import 'package:domining_app/model/post/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_pageable.g.dart';
@JsonSerializable()
class PostPageable {
  final List<Post>? posts;
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;

  PostPageable(
      {this.posts, this.currentPage, this.totalPages, this.totalItems});

  factory PostPageable.fromJson(Map<String, dynamic> json) =>
      _$PostPageableFromJson(json);

  Map<String, dynamic> toJson() => _$PostPageableToJson(this);
}
