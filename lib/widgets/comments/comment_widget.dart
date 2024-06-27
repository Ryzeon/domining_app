import 'package:domining_app/model/comment/comment.dart';
import 'package:domining_app/model/post/post.dart';
import 'package:domining_app/services/comment_rest.service.dart';
import 'package:domining_app/utils/request.dart';
import 'package:domining_app/widgets/comments/create/create_comment.widget.dart';
import 'package:domining_app/widgets/comments/view/comment_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CommentsWidget extends StatefulWidget {

  final Post post;

  const CommentsWidget({super.key, required this.post});

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {

  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CreateCommentWidget(
            targetId: widget.post.id!,
            isComment: false,
            update: () {
              refresh();
            },
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          ...comments.map((comment) => CommentViewWidget(comment: comment, refresh: () {
            fetchComments();
          },)),
        ],
      ),
    );
  }

  void fetchComments() {
    CommentRestService(Request().dio).getAll(widget.post.id!, 0, 20).then((value) {
      setState(() {
        List<Comment> comments = value.items!;
        this.comments = comments.reversed.toList();
      });
    })
    .catchError((error) {
       toastification.show(
        title: const Text('An error ocurred while fetching comments'),
        closeButtonShowType: CloseButtonShowType.none,
        primaryColor: Colors.red,
        autoCloseDuration: const Duration(seconds: 2),
      );
    });
  }

  void refresh() {
    fetchComments();
  }
}
