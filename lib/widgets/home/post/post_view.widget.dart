import 'package:domining_app/model/post/post.dart';
import 'package:domining_app/utils/lang.dart';
import 'package:domining_app/widgets/home/post/post_file_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostViewWidget extends StatelessWidget {
  final Post post;

  const PostViewWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  post.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '${post.authorUsername!} - ${getNiceDate()}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(post.content!),
          const SizedBox(height: 10),
          if (post.files != null)
            Column(
              children: post.files!.map((file) {
                var niceFileUrl = Lang.getNiceServer() + file;
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: PostFileViewWidget(fileUrl: niceFileUrl),
                );
              }).toList(),
            ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('Likes: ${getLikesCount()}'),
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () async {
                  likePost();
                },
              ),
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  getLikesCount() {
    return post.likes?.length ?? 0;
  }

  getNiceDate() {
    var date = post.createdAt!;
    // Format, 12 March 2021, 12:00
    var formatter = DateFormat('d MMMM yyyy, HH:mm');
    return formatter.format(date);
  }

  void likePost() {}
}
