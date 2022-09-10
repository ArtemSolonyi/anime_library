import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dtos/authentication-response.dto.dart';
import '../dtos/error_dto.dart';
import '../dtos/tokens.dto.dart';
import '../locator/locator.dart';

typedef MakeRequest = Future<Response> Function(Dio dio);
typedef OnSuccess<T> = T Function(Response response);
typedef OnError<T> = T Function(DioError dioError);

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = getIt.get<Dio>();
    dio.options.baseUrl = 'http://localhost:6004/api/v1';
  }

  addInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      options.headers['Authorization'] = prefs.getString('accessToken');
      handler.next(options);
    }, onError: (err, handler) async {
      bool retry = false;
      if (err.response?.statusCode == 401 && !retry) {
        retry = true;
        SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();
        final RequestOptions? options = err.response?.requestOptions;
        final data = await request<AuthenticationResponse, ErrorDto>(
            makeRequest: (dio) => dio.post('/auth/refresh',
                data: {'refreshToken': prefs.get('refreshToken')}),
            onSuccess: (response) =>
                AuthenticationResponse.fromJson(response.data),
            onError: (error) => ErrorDto.fromJson(error.response?.data));
        data
          ..onData((data) {
            print('${data.tokens.accessToken} qqqqqqqqqqq');
            prefs.remove('accessToken');
            prefs.remove('refreshToken');
            prefs.setString('accessToken', data.tokens.accessToken);
            prefs.setString('refreshToken', data.tokens.refreshToken);
          })
          ..onError((error) => print(error.message));
        err.requestOptions.headers['Authorization'] = prefs.get('accessToken');
        final response = await dio.request(err.requestOptions.path,
            cancelToken: err.requestOptions.cancelToken,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ));
        return handler.resolve(response);
      }
      return handler.next(err);
    }));
    return this;
  }

  get instance {
    return dio;
  }
}

Future<Result<T, E>> request<T, E>({
  required MakeRequest makeRequest,
  required OnSuccess<T> onSuccess,
  required OnError<E> onError,
}) async {
  try {
    final response = await makeRequest(getIt.get<DioClient>().instance);
    return Result.success(onSuccess(response));
  } on DioError catch (e) {
    return Result.error(onError(e));
  }
}

class Result<T, E> {
  final T? data;
  final E? error;

  const Result(this.data, this.error);

  factory Result.success(T data) => Result(data, null);

  factory Result.error(E error) => Result(null, error);

  void onData(Function(T data) action) {
    if (data != null) {
      action(data as T);
    }
  }

  void onError(Function(E error) action) {
    if (error != null) {
      action(error as E);
    }
  }
}
