import 'package:domining_app/model/post/like_post_request.dart';
import 'package:domining_app/model/post/post.dart';
import 'package:domining_app/services/post_rest.service.dart';
import 'package:domining_app/services/user.service.dart';
import 'package:domining_app/shared/widgets/resources/colors.dart';
import 'package:domining_app/utils/lang.dart';
import 'package:domining_app/utils/request.dart';
import 'package:domining_app/widgets/home/post/post_file_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostViewWidget extends StatelessWidget {
  final Post post;
  final VoidCallback? refresh;

  const PostViewWidget({super.key, required this.post, this.refresh});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 8.0,
      radius: const Radius.circular(20),
      child: Container(
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
        child: SingleChildScrollView(
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: post.files!.map((file) {
                      var niceFileUrl = Lang.getNiceServer() + file;
                      return Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.second,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.second.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: PostFileViewWidget(fileUrl: niceFileUrl),
                      );
                    }).toList(),
                  ),
                ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(getNiceLikeText()),
                  IconButton(
                    icon: const Icon(Icons.thumb_up),
                    color: isLiked() ? Colors.blue : Colors.grey,
                    onPressed: () async {
                      likePost();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.comment),
                    onPressed: () {},
                  ),
                  Expanded(child: Container()),
                  if (canDelete())
                    IconButton(
                      icon: const Icon(Icons.delete),
                      // color: Colors.red,
                      onPressed: () {
                        deletePost();
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deletePost() {
    PostRestService(Request().dio).delete(post.id!).whenComplete(() {
      if (refresh != null) {
        refresh!();
      }
    });
  }

  bool canDelete() {
    return post.authorId == UserService.currentUser.value.id;
  }

  void toggleLike() {
    bool liked = isLiked();
    LikePostRequest request = LikePostRequest(
      postId: post.id,
      userId: UserService.currentUser.value.id,
      like: !liked,
    );
    PostRestService(Request().dio).like(request).whenComplete(() {
      if (refresh != null) {
        refresh!();
      }
    });
  }

  String getNiceLikeText() {
    var likesCount = getLikesCount();
    if (likesCount == 0) {
      return 'No likes';
    }
    if (likesCount == 1) {
      if (isLiked()) {
        return 'You liked this post';
      }
      return '1 other liked this post';
    }
    if (isLiked()) {
      return 'You and ${likesCount - 1} others liked this post';
    }
    return '$likesCount others liked this post';
  }

  bool isLiked() {
    var userId = UserService.currentUser.value.id;
    return post.likes?.contains(userId) ?? false;
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

  void likePost() {
    toggleLike();
  }
}
