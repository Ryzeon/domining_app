import 'package:flutter/material.dart';

class FileViewWidget extends StatefulWidget {
  final String fileName;

  final Function(String fileName) onFileDeleted;

  const FileViewWidget(
      {super.key, required this.fileName, required this.onFileDeleted});

  @override
  State<FileViewWidget> createState() => _FileViewWidgetState();
}

class _FileViewWidgetState extends State<FileViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(widget.fileName),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              widget.onFileDeleted(widget.fileName);
            },
          ),
        ],
      ),
    );
  }
}
