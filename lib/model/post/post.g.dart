// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String?,
      authorId: json['authorId'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      company: json['company'] as String?,
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList(),
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'title': instance.title,
      'content': instance.content,
      'company': instance.company,
      'files': instance.files,
      'likes': instance.likes,
    };
