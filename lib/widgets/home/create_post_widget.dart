import 'package:domining_app/shared/widgets/resources/colors.dart';
import 'package:domining_app/widgets/home/upload_files_widget.dart';
import 'package:flutter/material.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.white,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
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
              const Expanded(
                child: TextField(
                  maxLines: null,
                  scrollPhysics: AlwaysScrollableScrollPhysics(),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'What\'s on your mind?',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(
            color: AppColors.white,
            thickness: 1,
          ),
          Row(
            children: [
              const UploadFilesWidget(),
            ],
          )
        ],
      ),
    );
  }
}
