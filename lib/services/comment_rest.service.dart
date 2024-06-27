import 'package:dio/dio.dart';
import 'package:domining_app/model/comment/comment.dart';
import 'package:domining_app/model/comment/comment_pageable.dart';
import 'package:domining_app/model/comment/create_comment_request.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_rest.service.g.dart';

@RestApi()
abstract class CommentRestService {
  factory CommentRestService(Dio dio, {String baseUrl}) = _CommentRestService;


  @POST('/comments')
  Future<Comment> create(@Body() CreateCommentRequest request);

  @GET('/comments/{id}')
  Future<CommentPageable> getAll(
      @Path('id') String id, @Query('page') int page, @Query('size') int size);

  @DELETE('/comments/{id}')
  Future<void> delete(@Path('id') String id);
}
