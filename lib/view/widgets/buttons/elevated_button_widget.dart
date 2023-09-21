import 'package:flutter/material.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/util/texts.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  const ElevatedButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: buttonMargin(context),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.01,
            ),
          ),
          fixedSize: Size(
            MediaQuery.of(context).size.width * 0.9,
            MediaQuery.of(context).size.height * 0.06,
          ),
        ),
        child: boldSizeText(
          text: title,
          size: MediaQuery.of(context).size.height * 0.027,
        ),
      ),
    );
  }
}
