// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    UpdateUserRequest(
      names: json['names'] as String?,
      username: json['username'] as String?,
      lastNames: json['lastNames'] as String?,
      position: json['position'] as String?,
      company: json['company'] as String?,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'names': instance.names,
      'username': instance.username,
      'lastNames': instance.lastNames,
      'position': instance.position,
      'company': instance.company,
      'about': instance.about,
    };
