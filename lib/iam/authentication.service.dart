import 'package:domining_app/iam/authentication_rest.service.dart';
import 'package:domining_app/model/iam/request/sign_in.request.dart';
import 'package:domining_app/model/iam/request/sign_in.response.dart';
import 'package:domining_app/model/iam/request/sign_up.request.dart';
import 'package:domining_app/model/iam/request/sign_up.response.dart';
import 'package:domining_app/services/user.service.dart';
import 'package:domining_app/utils/request.dart';
import 'package:localstorage/localstorage.dart';

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

  static String username = '';
  static String id = '';
  static String email = '';

  static _save(SignInResponse response) {
    localStorage.setItem('token', response.token!);
    localStorage.setItem('username', response.username!);
    localStorage.setItem('id', response.id!);
    localStorage.setItem('email', response.email!);

    username = response.username!;
    id = response.id!;
    email = response.email!;
    
    UserService.setLocalUser(response.id!);
  }

  static signOut() {
    localStorage.clear();

    username = '';
    id = '';
    email = '';
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
