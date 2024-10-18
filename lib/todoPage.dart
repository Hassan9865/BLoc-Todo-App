import 'package:flutter/material.dart';

class Todopage extends StatelessWidget {
  const Todopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: Column(
        children: [TextField()],
      ),
    );
  }
}
