// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) =>
    SignInRequest(
      usernameOrEmail: json['usernameOrEmail'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{
      'usernameOrEmail': instance.usernameOrEmail,
      'password': instance.password,
    };
