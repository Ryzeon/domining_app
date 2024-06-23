// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_pageable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentPageable _$CommentPageableFromJson(Map<String, dynamic> json) =>
    CommentPageable(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommentPageableToJson(CommentPageable instance) =>
    <String, dynamic>{
      'items': instance.items,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };
