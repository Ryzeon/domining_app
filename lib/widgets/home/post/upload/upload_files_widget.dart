import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFilesWidget extends StatelessWidget {
  final Function(FilePickerResult file) onFileAdded;
  const UploadFilesWidget({super.key, required this.onFileAdded});

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
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () async {
              openUploadFiles();
            },
          ),
          const Text('Upload files'),
        ],
      ),
    );
  }

  void openUploadFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      onFileAdded(result);
    } else {
      // User canceled the picker
    }
  }
}
