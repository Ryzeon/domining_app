import 'package:json_annotation/json_annotation.dart';

part 'sign_up.request.g.dart';

@JsonSerializable()
class SignUpRequest {
  String? names;
  String? lastNames;
  String? email;
  String? password;

  SignUpRequest({
    this.names,
    this.lastNames,
    this.email,
    this.password,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
