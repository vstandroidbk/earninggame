import 'package:flutter/material.dart';

class CustomCircularProgress extends StatefulWidget {
  const CustomCircularProgress({super.key});

  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
