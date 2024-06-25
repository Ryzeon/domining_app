import 'package:domining_app/model/post/post.dart';
import 'package:domining_app/widgets/home/post/post_view.widget.dart';
import 'package:flutter/material.dart';

class AllPostViewWidget extends StatefulWidget {

  final List<Post> posts;

  const AllPostViewWidget({super.key, required this.posts});

  @override
  State<AllPostViewWidget> createState() => _AllPostViewWidgetState();
}

class _AllPostViewWidgetState extends State<AllPostViewWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.posts.map((post) => PostViewWidget(post: post)).toList(),
    );
  }

  
}
