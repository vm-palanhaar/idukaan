import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class HandleErrorsApi {
  BuildContext? context;
  bool showError = false;

  Future<bool> checkInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (showError){
        //TODO: Design no internet screen and push to that screen
      }
      return false;
    }
    return true;
  }
}
