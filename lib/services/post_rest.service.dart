import 'package:dio/dio.dart';
import 'package:domining_app/model/post/post.dart';
import 'package:domining_app/model/post/post_create.dart';
import 'package:domining_app/model/post/post_pageable.dart';
import 'package:retrofit/retrofit.dart';

part 'post_rest.service.g.dart';

@RestApi()
abstract class PostRestService {
  factory PostRestService(Dio dio, {String baseUrl}) = _PostRestService;

  @GET('/post/{id}')
  Future<Post> getById(@Path('id') String id);

  @POST('/post')
  Future<Post> create(@Body() PostCreate request);

  @POST('/post/{id}/like')
  Future<void> like(@Path('id') String id);

  @DELETE('/post/{id}')
  Future<void> delete(@Path('id') String id);

  @GET('/post')
  Future<PostPageable> getAll(@Query('page') int page , @Query('size') int size);
}
