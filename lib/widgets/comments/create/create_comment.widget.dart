import 'package:domining_app/model/comment/create_comment_request.dart';
import 'package:domining_app/services/comment_rest.service.dart';
import 'package:domining_app/services/user.service.dart';
import 'package:domining_app/utils/request.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CreateCommentWidget extends StatefulWidget {

  final String targetId;
  final bool isComment;
  final VoidCallback? update;

  const CreateCommentWidget(
      {super.key, required this.targetId, required this.isComment, this.update});

  @override
  State<CreateCommentWidget> createState() => _CreateCommentWidgetState();
}

class _CreateCommentWidgetState extends State<CreateCommentWidget> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // FIRST A EMTPY AVATAR // A TEXT FIEDL with border runded wtih text, white your comment and bottom a button with send icon
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWUem1ykMgZrm7P2GNRhID1fnipTWf1kQ1dA&s'),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Write your comment',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              createComment();
            },
          ),
        ],
      ),
    );
  }

  void createComment() {
    CreateCommentRequest comment = CreateCommentRequest(
      content: _commentController.text,
      userId: UserService.currentUser.value.id,
      postId: widget.isComment ? null : widget.targetId,
      commentId: widget.isComment ? widget.targetId : null,
    );
    CommentRestService(Request().dio).create(comment).then((_) {
      _commentController.clear();
      if (widget.update != null) {
        widget.update!();
      }
    })
    .catchError((error) {
      toastification.show(
        title: const Text('An error ocurred while creating comment'),
        closeButtonShowType: CloseButtonShowType.none,
        primaryColor: Colors.red,
        autoCloseDuration: const Duration(seconds: 2),
      );
    });
  }
}
