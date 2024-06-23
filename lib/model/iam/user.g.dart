// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      names: json['names'] as String?,
      lastNames: json['lastNames'] as String?,
      position: json['position'] as String?,
      company: json['company'] as String?,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'names': instance.names,
      'lastNames': instance.lastNames,
      'position': instance.position,
      'company': instance.company,
      'about': instance.about,
    };
