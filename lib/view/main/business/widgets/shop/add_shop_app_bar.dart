import 'package:flutter/material.dart';

AppBar appBarAddShop({
  required BuildContext context,
  required String title,
  required String subtitle,
  required double ind,
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
    actions: actions,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(
        MediaQuery.of(context).size.height * 0.039,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              bottom: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Text(subtitle),
          ),
          LinearProgressIndicator(value: ind),
        ],
      ),
    ),
  );
}
