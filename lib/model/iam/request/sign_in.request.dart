import 'package:json_annotation/json_annotation.dart';

part 'sign_in.request.g.dart';

@JsonSerializable()
class SignInRequest {
  //  String usernameOrEmail,
  //   String password
  String? usernameOrEmail;
  String? password;

  SignInRequest({
    this.usernameOrEmail,
    this.password,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
