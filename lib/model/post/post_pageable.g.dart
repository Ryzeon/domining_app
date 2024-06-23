// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_pageable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPageable _$PostPageableFromJson(Map<String, dynamic> json) => PostPageable(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostPageableToJson(PostPageable instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };
