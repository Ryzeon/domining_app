// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      names: json['names'] as String?,
      lastNames: json['lastNames'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'names': instance.names,
      'lastNames': instance.lastNames,
      'email': instance.email,
      'password': instance.password,
    };
