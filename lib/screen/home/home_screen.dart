import 'package:domining_app/iam/authentication.service.dart';
import 'package:domining_app/model/post/post.dart';
import 'package:domining_app/screen/login/login_screen.dart';
import 'package:domining_app/services/post_rest.service.dart';
import 'package:domining_app/shared/widgets/items/widgets.dart';
import 'package:domining_app/utils/methods.dart';
import 'package:domining_app/utils/request.dart';
import 'package:domining_app/widgets/home/post/all_post__view.widget.dart';
import 'package:domining_app/widgets/home/post/create_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Asegúrate de importar Get
import 'package:domining_app/services/user.service.dart'; // Importa UserService

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    getAllPost();
    UserService.currentUser.listen((_) {
      updateLocal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(() => Text(
                // Comprueba si username no es null y no está vacío, de lo contrario muestra 'N/A'
                UserService.currentUser.value.username?.isNotEmpty == true
                    ? UserService.currentUser.value.username!
                    : 'N/A', // Muestra el nombre de usuario o 'N/A'
                style: const TextStyle(color: Colors.white), // Estilo opcional
              )),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              logout();
            },
          ),
          const SizedBox(width: 5),
        ],
        automaticallyImplyLeading: false, // remove back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          // Envuelve el Column en un SingleChildScrollView
          child: Column(
            children: [
              CreatePostWidget(
                onPostCreated: (_) => {
                  updateLocal(),
                },
              ),
              freev(v: 10),
              AllPostViewWidget(
                posts: posts,
                refresh: () {
                  updateLocal();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateLocal() {
    setState(() {});
    getAllPost();
  }

  void logout() {
    Authentication.signOut();
    navigatePush(context, secondPage: const LoginScreen());
  }

  getAllPost() {
    var postService = PostRestService(Request().dio);
    postService.getAll(0, 20).then((value) {
      List<Post> posts = value.posts!;
      setState(() {
        this.posts = posts.reversed.toList();
      });
    });
  }
}
