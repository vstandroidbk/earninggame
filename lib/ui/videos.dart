import 'package:flutter/material.dart';

import '../utils/colors.dart';

class VideosUi extends StatefulWidget {
  const VideosUi({super.key});

  @override
  State<VideosUi> createState() => _VideosUiState();
}

class _VideosUiState extends State<VideosUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("Videos"),
      ),
      body: const SafeArea(
          child: Center(
              child: Text(
        "No data Found",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ))),
    );
  }
}
