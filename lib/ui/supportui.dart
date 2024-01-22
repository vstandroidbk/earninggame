import 'package:flutter/material.dart';

class SupportUi extends StatefulWidget {
  const SupportUi({super.key});

  @override
  State<SupportUi> createState() => _SupportUiState();
}

class _SupportUiState extends State<SupportUi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text("Support")),
    );
  }
}
