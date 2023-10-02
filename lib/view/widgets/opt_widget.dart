import 'package:flutter/material.dart';
import 'package:idukaan/view/widgets/text_widget.dart';

class OptWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const OptWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: MediaQuery.of(context).size.height * 0.06,
            ),
            TextWidget(
              text: title,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
