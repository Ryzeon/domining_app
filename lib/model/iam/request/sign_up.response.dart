import 'package:json_annotation/json_annotation.dart';

part 'sign_up.response.g.dart';
@JsonSerializable()
class SignUpResponse {
  final String? id;
  final String? username;
  final String? email;
  final List<String>? roles;

  SignUpResponse({
    this.id,
    this.username,
    this.email,
    this.roles,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}