// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCreate _$PostCreateFromJson(Map<String, dynamic> json) => PostCreate(
      authorId: json['authorId'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      company: json['company'] as String?,
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostCreateToJson(PostCreate instance) =>
    <String, dynamic>{
      'authorId': instance.authorId,
      'title': instance.title,
      'content': instance.content,
      'company': instance.company,
      'files': instance.files,
    };
