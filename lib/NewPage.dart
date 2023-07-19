import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  String title;
  String body;
   NewPage({ required this.title, required this.body}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("$title"),
          Text("$body")
        ],
      ),
    );
  }
}
