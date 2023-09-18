import 'package:flutter/material.dart';

Text boldText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}

Text boldSizeText({required String text, required double size}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: size,
    ),
  );
}
