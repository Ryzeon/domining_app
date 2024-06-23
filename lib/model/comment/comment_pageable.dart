
import 'package:domining_app/model/comment/comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_pageable.g.dart';
@JsonSerializable()
// ignore error

class CommentPageable  {
  final List<Comment>? items;
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;

  CommentPageable({this.items, this.currentPage, this.totalPages, this.totalItems});

  factory CommentPageable.fromJson(Map<String, dynamic> json) => _$CommentPageableFromJson(json);

  Map<String, dynamic> toJson() => _$CommentPageableToJson(this);
}