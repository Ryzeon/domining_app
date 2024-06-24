import 'package:domining_app/layout/base_layout.dart';
import 'package:domining_app/services/user.service.dart';
import 'package:domining_app/shared/widgets/resources/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ICON PERSON IN THE RIGHT CORNET BUT BEFORE ICONM, A TEXT LIKE [ICON] PEPE
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
          // suscribe to the user service
          // UserServicer.currentUser != null
          //     ? Text(UserServicer.currentUser!.username!)
              // : const Text('N/A'),
          const SizedBox(
            width: 5,
          )
        ],
        // remove back button
        automaticallyImplyLeading: false,
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
