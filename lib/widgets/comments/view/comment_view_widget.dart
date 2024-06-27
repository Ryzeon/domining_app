import 'package:domining_app/model/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentViewWidget extends StatelessWidget {
  final Comment comment;

  final VoidCallback? refresh;

  const CommentViewWidget({super.key, required this.comment, this.refresh});

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
          Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWUem1ykMgZrm7P2GNRhID1fnipTWf1kQ1dA&s'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.userFullName!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(comment.username!),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          // align text to left
          Align(
            alignment: Alignment.centerLeft,
            child: Text(comment.content!),
          ),
        ],
      ),
    );
  }
}
