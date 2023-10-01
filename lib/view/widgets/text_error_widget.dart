import 'package:flutter/material.dart';

class TextErrorWidget extends StatelessWidget {
  final String text;
  const TextErrorWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
