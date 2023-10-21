import 'package:flutter/material.dart';
import 'package:idukaan/controller/auth/auth_ctrl_api.dart';
import 'package:idukaan/controller/auth/auth_ctrl_mdl.dart';
import 'package:idukaan/view/init/init_view.dart';

class AuthCtrl extends AuthCtrlMdl {
  BuildContext? context;
  final AuthCtrlApi _authApi = AuthCtrlApi();

  AuthCtrl({this.context});

  // read all key-value
  Future<void> readAllKeys() async {
    for (String key in getAppKeys) {
      final x = await storage.read(
        key: key,
        aOptions: getAndroidOptions(),
      );
      if (x != null) {
        appKeys[key] = x;
      }
    }
  }

  // delete all key-value
  Future<void> deleteAllKeys() async {
    for (String key in getAppKeys) {
      await storage.delete(
        key: key,
        aOptions: getAndroidOptions(),
      );
    }
    userLoggedIn = false;
  }

  // read key-value
  Future<String?> readKey({
    required String key,
  }) async {
    return await storage.read(
      key: key,
      aOptions: getAndroidOptions(),
    );
  }

  // write key-value
  Future<void> writeKey({
    required String key,
    required String value,
  }) async {
    await storage.write(
      key: key,
      value: value,
      aOptions: getAndroidOptions(),
    );
  }

  Future<void> getUserLoggedIn({
    required BuildContext context,
  }) async {
    this.context = context;
    String? token = await readKey(key: AppKey.token.key);
    if (token != null) {
      appKeys[AppKey.token.key] = token;
      await getUserLoggedInApi();
      return;
    }
    userLoggedIn = false;
  }

  Future<void> getUserLoggedInApi() async {
    if (appKeys[AppKey.token.key] != null) {
      String res = await _authApi.getUserLoggedInValidApi(
        context: context!,
        token: appKeys[AppKey.token.key]!,
        showError: true,
      );
      if (res.isNotEmpty) {
        userLoggedIn = true;
        await writeKey(key: AppKey.token.key, value: res);
        await readAllKeys();
        return;
      }
    }
    userLoggedIn = false;
  }

  Future<void> postUserLogout({
    required BuildContext context,
  }) async {
    deleteAllKeys();
    Navigator.pushNamedAndRemoveUntil(context, InitView.id, (route) => false);
  }
}
