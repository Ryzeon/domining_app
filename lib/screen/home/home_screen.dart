import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Asegúrate de importar Get
import 'package:domining_app/services/user.service.dart'; // Importa UserService

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            onPressed: () {},
          ),
          const SizedBox(width: 5),
        ],
        automaticallyImplyLeading: false, // remove back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}