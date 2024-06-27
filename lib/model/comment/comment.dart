import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';
@JsonSerializable()
class Comment {
  final String? id;
  final String? content;
  final String? userId;
  final String? username;
  final String? userFullName;
  final String? postId;
  final String? commentType;
  final bool? subComment;
  final List<Comment>? subComments;

  Comment(
      {this.id,
      this.content,
      this.userId,
      this.username,
      this.userFullName,
      this.postId,
      this.commentType,
      this.subComment,
      this.subComments});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}