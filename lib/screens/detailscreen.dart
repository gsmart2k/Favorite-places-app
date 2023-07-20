import 'package:flutter/material.dart';
import 'dart:io';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {super.key, required this.id, required this.title, required this.image});
  final String id;
  final String title;
  final File image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Stack(
        children: [
          Image.file(image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
        ],
      ),
    );
  }
}
