import 'package:dio/dio.dart';
import 'package:domining_app/model/iam/user.dart';
import 'package:retrofit/http.dart';

part 'user_rest.service.g.dart';

@RestApi()
abstract class UserRestServer {

  factory UserRestServer(Dio dio, {String baseUrl}) = _UserRestServer;


  @GET('/user')
  Future<User> getById(@Path('id') String id);
}
