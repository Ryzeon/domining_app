import 'package:domining_app/layout/base_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      // app bar, with name Domiing hub, and avatar in the  right
      leading: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Text('Domiing hub'),
            const Spacer(),
            CircleAvatar(
              radius: 20,
              // backgroundImage: const AssetImage('assets/images/avatar.png'),
            ),
          ],
        ),
      
      ),
        fields: Column(
      children: [
        const Text('Home Screen'),
      ],
    ));
  }
}
