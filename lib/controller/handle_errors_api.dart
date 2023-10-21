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
    if (isError && showError) {
      showErrorDialog(
        title: 'Attention Required',
        content: 'You\'ve been logged out! Please sign in again '
            'to access business diary.',
      );
    }
  }

  Future<void> handleErrors({required int statusCode}) async {
    switch (statusCode) {
      case 401:
        userLogout(isError: true);
        break;
      case 413:
        showErrorDialog(
          title: 'Attention Required',
          content: 'File size is too big. Please upload the file again.',
        );
        break;
      case 500:
        showErrorDialog(
          title: 'Work-In-Progress',
          content: 'Please try again after sometime. '
              'Teams are working for solving this issue.',
        );
        break;
      default:
        showErrorDialog(
          title: 'Attention Required',
          content:
              'Please report a bug it to us so that we can fix it as soon as '
              'possible. Your feedback is essential to helping us improve our '
              'app and make it the best it can be.',
        );
    }
  }
}
