import 'package:dio/dio.dart';
import 'package:domining_app/iam/authenticaction_interceptor.dart';
import 'package:domining_app/utils/lang.dart';

class Request {
  static final Request _instance = Request._internal();

  var dio = Dio(BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  factory Request() {
    return _instance;
  }

  Request._internal() {
    dio.options.baseUrl = Lang.prod.getBool()
        ? Lang.backendUrl.getString()
        : Lang.localUrl.getString();
    dio.interceptors
      ..add(LogInterceptor())
      ..add(AuthenticactionInterceptor())
      ..add(InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) {
          if (error.response?.statusCode == 400 ||
              error.response?.statusCode == 404) {
            // Aquí puedes manejar el error como prefieras, por ejemplo, lanzando una excepción personalizada
            var errorMessage =
                error.response?.data['message'] ?? 'Unknown error';
            return handler.next(DioException(
              requestOptions: error.requestOptions,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: error.response?.statusCode,
                data: {'message': errorMessage},
              ),
            ));
          }
          return handler.next(error);
        },
      ));
  }
}
