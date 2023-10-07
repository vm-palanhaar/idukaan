import 'package:flutter/material.dart';
import 'package:idukaan/view/util/margins.dart';

class CTextErrorWidget extends StatelessWidget {
  final String text;
  const CTextErrorWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: screenMargin(context),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
