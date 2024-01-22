import 'package:earninggame/utils/colors.dart';
import 'package:flutter/material.dart';

class NotificationUi extends StatefulWidget {
  const NotificationUi({super.key});

  @override
  State<NotificationUi> createState() => _NotificationUiState();
}

class _NotificationUiState extends State<NotificationUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("Notifications"),
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
