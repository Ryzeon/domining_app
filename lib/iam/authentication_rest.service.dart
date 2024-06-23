import 'package:dio/dio.dart';
import 'package:domining_app/model/iam/request/sign_in.request.dart';
import 'package:domining_app/model/iam/request/sign_in.response.dart';
import 'package:domining_app/model/iam/request/sign_up.request.dart';
import 'package:domining_app/model/iam/request/sign_up.response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_rest.service.g.dart';

@RestApi()
abstract class AuthenticationRestService {
  factory AuthenticationRestService(Dio dio, {String baseUrl}) = _AuthenticationRestService;

  @POST('/authentication/sign-in')
  Future<SignInResponse> signIn({@Body() required  SignInRequest request});

  @POST('/authentication/sign-up')
  Future<SignUpResponse> signUp({@Body() required  SignUpRequest request});
}