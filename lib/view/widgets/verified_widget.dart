import 'package:flutter/material.dart';

class VerifiedWidget extends StatelessWidget {
  final bool isVer;
  const VerifiedWidget({
    super.key,
    required this.isVer,
  });

  @override
  Widget build(BuildContext context) {
    if (isVer) {
      return const Icon(
        Icons.verified,
        color: Colors.blue,
      );
    }
    return const Icon(
      Icons.pending,
      color: Colors.red,
    );
  }
}
