import 'package:domining_app/iam/authentication_rest.service.dart';
import 'package:domining_app/model/iam/request/sign_in.request.dart';
import 'package:domining_app/model/iam/request/sign_in.response.dart';
import 'package:domining_app/model/iam/request/sign_up.request.dart';
import 'package:domining_app/model/iam/request/sign_up.response.dart';
import 'package:domining_app/services/user.service.dart';
import 'package:domining_app/utils/request.dart';
import 'package:localstorage/localstorage.dart';
import 'package:get/get.dart';

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

  static Future<bool> retrieveToken() async {
    var token = localStorage.getItem('token');
    if (token != null) {
      try {
        var response = await AuthenticationRestService(Request().dio).refreshToken(token);
        _save(response);
      } catch (e) {
        signOut();
        return false;
      }
      return true;
    }
    return false;
  }

  static var username = ''.obs;
  static var id = ''.obs;
  static var email = ''.obs;

  static _save(SignInResponse response) {
    localStorage.setItem('token', response.token!);

    username.value = response.username!;
    id.value = response.id!;
    email.value = response.email!;

    UserService.setLocalUser(response.id!);
  }

  static signOut() {
    localStorage.clear();

    username.value = '';
    id.value = '';
    email.value = '';
  }

  static Future<SignInResponse> signIn(SignInRequest request) async {
    final authService = AuthenticationRestService(Request().dio);
    try {
      var response = await authService.signIn(request: request);
      _save(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
