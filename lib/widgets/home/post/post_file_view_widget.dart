import 'package:domining_app/widgets/home/post/player/post_video_player.widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostFileViewWidget extends StatefulWidget {
  
  final String fileUrl;

  const PostFileViewWidget({super.key, required this.fileUrl});

  @override
  State<PostFileViewWidget> createState() => _PostFileViewWidgetState();
}

class _PostFileViewWidgetState extends State<PostFileViewWidget> {
  @override
  Widget build(BuildContext context) {
    if (canRender()) {
      return InkWell(
        onTap: () async {
          await launchUrl(Uri.parse(widget.fileUrl));
        },
        child: Container(
          // JUST RENDER A SMALL IMG, BTW WHEN CLICK SEND TO A NEW PAGE
          padding: const EdgeInsets.all(5),
          width: 400,
          height: 400,

          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: isVideo()
              ? PostVideoPlayerWidget(fileUrl: widget.fileUrl)
              : Image.network(widget.fileUrl),
          // AHANDLE ON CLICK
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Text('Attachment'),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () async {
              launchUrl(Uri.parse(widget.fileUrl));
            },
          ),
        ],
      ),
    );
  }

  canRender() {
    // if contains image or video in the fileUrl
    if (widget.fileUrl.contains('image') || widget.fileUrl.contains('video')) {
      return true;
    }
    return false;
  }

  isVideo() {
    return widget.fileUrl.contains('video');
  }
}
