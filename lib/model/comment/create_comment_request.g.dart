// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommentRequest _$CreateCommentRequestFromJson(
        Map<String, dynamic> json) =>
    CreateCommentRequest(
      content: json['content'] as String?,
      userId: json['userId'] as String?,
      postId: json['postId'] as String?,
      commentId: json['commentId'] as String?,
    );

Map<String, dynamic> _$CreateCommentRequestToJson(
        CreateCommentRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
      'userId': instance.userId,
      'postId': instance.postId,
      'commentId': instance.commentId,
    };
