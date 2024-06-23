// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String?,
      content: json['content'] as String?,
      userId: json['userId'] as String?,
      postId: json['postId'] as String?,
      commentType: json['commentType'] as String?,
      subComment: json['subComment'] as bool?,
      subComments: (json['subComments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'userId': instance.userId,
      'postId': instance.postId,
      'commentType': instance.commentType,
      'subComment': instance.subComment,
      'subComments': instance.subComments,
    };
