import 'package:flutter/material.dart';

AppBar appBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) {
  double roundingProfile = MediaQuery.of(context).size.width * 0.05;
  return AppBar(
    title: Text(
      title,
      textDirection: TextDirection.ltr,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(roundingProfile),
        bottomLeft: Radius.circular(roundingProfile),
      ),
    ),
    actions: actions,
  );
}
