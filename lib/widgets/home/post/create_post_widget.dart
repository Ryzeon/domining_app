import 'package:dio/dio.dart';
import 'package:domining_app/model/file/file_model.dart';
import 'package:domining_app/model/post/post_create.dart';
import 'package:domining_app/services/file_rest.service.dart';
import 'package:domining_app/services/post_rest.service.dart';
import 'package:domining_app/services/user.service.dart';
import 'package:domining_app/shared/widgets/resources/colors.dart';
import 'package:domining_app/utils/request.dart';
import 'package:domining_app/widgets/home/file_view.widget.dart';
import 'package:domining_app/widgets/home/upload_files_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CreatePostWidget extends StatefulWidget {

  final Function(void) onPostCreated;

  const CreatePostWidget({super.key, required this.onPostCreated});

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  List<PlatformFile> files = [];

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _titleEditingController = TextEditingController();

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
              Expanded(
                child: TextField(
                  controller: _titleEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                  ),
                ),
              ),
              // Separator
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  maxLines: null,
                  scrollPhysics: const AlwaysScrollableScrollPhysics(),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'What\'s on your mind?',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  onPostCreated();
                },
              ),
            ],
          ),
          const Divider(
            color: AppColors.white,
            thickness: 1,
          ),
          // Dentro de la función build, para la sección de carga y visualización de archivos
          Row(
            children: [
              UploadFilesWidget(
                onFileAdded: (file) => {
                  onFileAdded(file),
                },
              ),
              const SizedBox(width: 10),
              // Asegurarse de que el SingleChildScrollView pueda desplazarse horizontalmente
              Expanded(
                // Asegura que el SingleChildScrollView tenga espacio para expandirse
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: files
                        .map((file) => FileViewWidget(
                              fileName: file.name,
                              onFileDeleted: (fileName) {
                                setState(() {
                                  files.removeWhere(
                                      (element) => element.name == fileName);
                                });
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  onFileAdded(FilePickerResult result) {
    setState(() {
      files.addAll(result.files); // Assuming you want to add all picked files
    });
  }

  void handlePostCreated(String text, List<PlatformFile> files) async {
    var postService = FileRestService(Request().dio);
    List<FileModel> postFiles = [];
    for (var platformFile in files) {
      try {
        FormData file = FormData.fromMap({
          'file': MultipartFile.fromBytes(
            platformFile.bytes!,
            filename: platformFile.name,
          ),
        });
        var response = await postService.upload(file);
        postFiles.add(response);
      } catch (e) {
        print('Error: $e');
      }
    }
    createPost(text, postFiles);
  }

  void createPost(String text, List<FileModel> files) {
    List<String> filesId = files.map((e) => e.id!).toList();
    var createPost = PostCreate(
        authorId: UserService.currentUser.value.id!,
        title: _titleEditingController.text,
        content: text,
        company: UserService.currentUser.value.company!,
        files: filesId);
    var postService = PostRestService(Request().dio);
    postService.create(createPost).then((value) {
      setState(() {
        _textEditingController.clear();
        _titleEditingController.clear();
        this.files.clear();
      });
      widget.onPostCreated(null);
    });
  }

  onPostCreated() {
    handlePostCreated(_textEditingController.text, files);
  }
}
