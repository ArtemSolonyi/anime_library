import 'package:anime_library/dtos/authentication-response.dto.dart';
import 'package:anime_library/repository/authentication.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator/locator.dart';

typedef MakeRequest = Future<Response> Function(Dio dio);
typedef OnSuccess<T> = T Function(Response response);
typedef OnError<T> = T Function(DioError dioError);

// class CustomInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print('REQUEST[${options.method}] => PATH: ${options.path}');
//     return super.onRequest(options, handler);
//   }
// }
class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(BaseOptions(baseUrl: 'http://localhost:6004/api/v1/'));
  }

  Dio get getInstance {
    return dio;
  }
}

Future<Result<T, E>> request<T, E>({
  required MakeRequest makeRequest,
  required OnSuccess<T> onSuccess,
  required OnError<E> onError,
}) async {
  try {
    final response = await makeRequest(getIt.get<DioClient>().getInstance);
    return Result.success(onSuccess(response));
  } on DioError catch (e) {
    return Result.error(onError(e));
  }
}

class CustomInterceptor extends Interceptor {
  Dio api = getIt.get<DioClient>().getInstance;
  AuthenticationRepository ar = getIt.get<AuthenticationRepository>();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    options.headers['Authorization'] = prefs.getString('accessToken');
    handler.next(options);
  }

  @override
  void onError(err, handler) async {
    bool retry;
    if (err.response?.statusCode == 401) {
      retry = true;
      await ar.refresh();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      err.requestOptions.headers['Authorization'] =
          prefs.getString('accessToken');
      api.request(err.requestOptions.path,
          cancelToken: err.requestOptions.cancelToken,
          data: err.requestOptions.data,
          onReceiveProgress: err.requestOptions.onReceiveProgress,
          onSendProgress: err.requestOptions.onReceiveProgress,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(
            contentType: err.requestOptions.contentType,
            extra: err.requestOptions.extra,
            followRedirects: err.requestOptions.followRedirects,
            headers: err.requestOptions.headers,
            listFormat: err.requestOptions.listFormat,
            maxRedirects: err.requestOptions.maxRedirects,
            method: err.requestOptions.method,
            receiveDataWhenStatusError:
                err.requestOptions.receiveDataWhenStatusError,
            receiveTimeout: err.requestOptions.receiveTimeout,
            responseDecoder: err.requestOptions.responseDecoder,
            requestEncoder: err.requestOptions.requestEncoder,
            responseType: err.requestOptions.responseType,
            sendTimeout: err.requestOptions.sendTimeout,
            validateStatus: err.requestOptions.validateStatus,
          ));
    }
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
