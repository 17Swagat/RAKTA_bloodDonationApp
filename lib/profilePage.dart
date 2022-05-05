import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 119, 119),
      appBar: AppBar(
        centerTitle: true,
        title: Text("PROFILE"),
        backgroundColor: Colors.redAccent,
      ),
      // body: List,
    );
  }
}
