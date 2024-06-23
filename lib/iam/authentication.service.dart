import 'package:domining_app/iam/authentication_rest.service.dart';
import 'package:domining_app/model/iam/request/sign_up.request.dart';
import 'package:domining_app/model/iam/request/sign_up.response.dart';
import 'package:domining_app/utils/request.dart';

class Authentication {

  static Future<bool> checkServer() async {
    try {
      var response = await Request().dio.get('/ping');
      return response.statusCode == 200;
    } catch (e) {
    rethrow;
    }
  }

  static Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    final authService = AuthenticationRestService(Request().dio);
    try {
      var response = await authService.signUp(request: signUpRequest);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
