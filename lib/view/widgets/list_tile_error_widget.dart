import 'package:flutter/material.dart';
import 'package:idukaan/view/widgets/text_widget.dart';

class ListTileErrorWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const ListTileErrorWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextWidget(
        text: title,
        error: true,
      ),
      subtitle: TextWidget(
        text: subtitle,
        error: true,
      ),
    );
  }
}
