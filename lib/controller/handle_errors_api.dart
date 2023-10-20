import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idukaan/controller/auth/auth_ctrl.dart';
import 'package:provider/provider.dart';

class HandleErrorsApi {
  BuildContext? context;
  bool showError = false;

  void showErrorDialog({
    required String title,
    required String content,
  }) {
    showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
      ),
    );
    Navigator.pop(context!);
  }

  Future<bool> checkInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (showError) {
        //TODO: Design no internet screen and push to that screen
      }
      return false;
    }
    return true;
  }

  Future<void> userLogout({
    required bool isError,
  }) async {
    await Provider.of<AuthCtrl>(context!, listen: false).postUserLogout(
      context: context!,
    );
    if (isError) {
      showErrorDialog(
        title: 'Attention Required',
        content: 'You\'ve been logged out! Please sign in again '
            'to access business diary.',
      );
    }
  }
}
