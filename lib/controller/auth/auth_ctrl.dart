import 'package:flutter/material.dart';
import 'package:idukaan/controller/auth/auth_ctrl_api.dart';
import 'package:idukaan/controller/auth/auth_ctrl_mdl.dart';
import 'package:idukaan/view/init/init_view.dart';

class AuthCtrl extends AuthCtrlMdl {
  final AuthCtrlApi _authApi = AuthCtrlApi();

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

  Future<void> getUserLoggedInLocal() async {
    String? token = await readKey(key: AppKey.token.key);
    if (token != null) {
      userLoggedIn = true;
      return;
    }
    userLoggedIn = false;
  }

  Future<void> getUserLoggedInApi({
    required BuildContext context,
  }) async {
    if (appKeys[AppKey.token.key] != null) {
      String token = appKeys[AppKey.token.key]!;
      userLoggedInRes = await _authApi.getUserLoggedInValidApi(
        context: context,
        token: token,
        showError: true,
      );
    }
    if (userLoggedInRes != null) {
      await writeKey(
        key: AppKey.firstName.key,
        value: userLoggedInRes!.firstName,
      );
      await writeKey(
        key: AppKey.lastName.key,
        value: userLoggedInRes!.lastName,
      );
      await writeKey(
        key: AppKey.username.key,
        value: userLoggedInRes!.username,
      );
      userLoggedInRes = null;
      userLoggedIn = true;
    }
  }

  Future<void> postUserLogout({
    required BuildContext context,
  }) async {
    deleteAllKeys();
    Navigator.pushNamedAndRemoveUntil(context, InitView.id, (route) => false);
  }
}
