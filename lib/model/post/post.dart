import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';
@JsonSerializable()
class Post {
  final String? id;
  final String? authorId;

  final String? title;
  final String? content;

  final String? company;
  final List<String>? files;
  final List<String>? likes;

  Post(
      {this.id,
      this.authorId,
      this.title,
      this.content,
      this.company,
      this.files,
      this.likes});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
