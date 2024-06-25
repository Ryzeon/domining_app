
import 'package:json_annotation/json_annotation.dart';

part 'post_create.g.dart';

@JsonSerializable()
class PostCreate {
  final String? authorId;
  final String? title;
  final String? content;
  final String?  company;
  final List<String>? files;

  PostCreate({
     this.authorId,
     this.title,
     this.content,
     this.company,
     this.files,
  });

  factory PostCreate.fromJson(Map<String, dynamic> json) =>
      _$PostCreateFromJson(json);

  Map<String, dynamic> toJson() => _$PostCreateToJson(this);
}