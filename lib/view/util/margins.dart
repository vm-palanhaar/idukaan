import 'package:flutter/material.dart';

EdgeInsets screenMargin(BuildContext context) {
  return EdgeInsets.symmetric(
    horizontal: MediaQuery.of(context).size.width * 0.02,
    vertical: MediaQuery.of(context).size.height * 0.02,
  );
}

EdgeInsets buttonMargin(BuildContext context) {
  return EdgeInsets.symmetric(
    vertical: MediaQuery.of(context).size.height * 0.03,
  );
}

EdgeInsets textFieldMargin(BuildContext context) {
  return EdgeInsets.symmetric(
    vertical: MediaQuery.of(context).size.height * 0.01,
    horizontal: MediaQuery.of(context).size.width * 0.01,
  );
}