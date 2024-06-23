import 'package:json_annotation/json_annotation.dart';

part 'sign_in.response.g.dart';
@JsonSerializable()
class SignInResponse {
  final String? id;
  final String? username;
  final String? email;
  final String? token;

  SignInResponse({
    this.id,
    this.username,
    this.email,
    this.token,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
