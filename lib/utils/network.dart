import 'package:dio/dio.dart';

typedef MakeRequest = Future<Response> Function(Dio dio);
typedef OnSuccess<T> = T Function(Response response);
typedef OnError<T> = T Function(DioError dioError);

Future<Result<T, E>> request<T, E>({
  required MakeRequest makeRequest,
  required OnSuccess<T> onSuccess,
  required OnError<E> onError,
}) async {
  try {
    final response = await makeRequest(Dio());
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
