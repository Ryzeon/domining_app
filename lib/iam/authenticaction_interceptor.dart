import 'package:dio/dio.dart';
import 'package:localstorage/localstorage.dart';

class AuthenticactionInterceptor extends Interceptor {
  AuthenticactionInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // create a list of the endpoints where you don't need to pass a token.
    final listOfPaths = <String>[
      '/authentication/sign-up',
      '/authentication/sign-in',
      '/authentication/sign-in',
      '/ping',
      '/files/download',
      '/files/image',
      '/files/video',
      '/files/document'
    ];

    // Check if the requested endpoint match in the
    if (listOfPaths.contains(options.path.toString())) {
      // if the endpoint is matched then skip adding the token.
      return handler.next(options);
    }

    if (localStorage.getItem('token') == null) {
      return handler.next(options);
    }

    var token = localStorage.getItem('token');
    options.headers.addAll({'Authorization': token});
    return handler.next(options);
  }

  // You can also perform some actions in the response or onError.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
