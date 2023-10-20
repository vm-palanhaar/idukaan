import 'package:flutter/material.dart';
import 'package:idukaan/view/widgets/text_widget.dart';

class ListTileRowWidget extends StatelessWidget {
  final String title;
  final bool? titleBold;
  final IconData? icon;
  final Function? onTap;
  const ListTileRowWidget({
    super.key,
    required this.title,
    this.titleBold,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Card(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.002,
            horizontal: MediaQuery.of(context).size.width * 0.011,
          ),
          child: Row(
            children: [
              TextWidget(
                text: title,
                fontSize: MediaQuery.of(context).size.height * 0.017,
                fontWeight: titleBold == null ? null : FontWeight.bold,
              ),
              const Spacer(),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
