
import 'package:json_annotation/json_annotation.dart';

part 'create_comment_request.g.dart';

@JsonSerializable()
class CreateCommentRequest {
  final String? content;
  final String? userId;
  final String? postId;
  final String? commentId;

  CreateCommentRequest({this.content, this.userId, this.postId, this.commentId});

  factory CreateCommentRequest.fromJson(Map<String, dynamic> json) => _$CreateCommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommentRequestToJson(this);
}