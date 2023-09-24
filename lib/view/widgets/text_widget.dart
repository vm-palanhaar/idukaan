import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool? error;
  const TextWidget({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: error == true ? Colors.red : null,
      ),
    );
  }
}
