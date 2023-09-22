import 'package:flutter/material.dart';

AppBar appBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Text(
      title,
      textDirection: TextDirection.ltr,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: actions,
  );
}
