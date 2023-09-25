import 'dart:developer';

import 'package:idukaan/controller/local/local_ctrl_mdl.dart';

class LocalCtrl extends LocalCtrlMdl {
  // read all values
  Future<void> readAllKeys() async {
    appKeys = await storage.readAll(
      aOptions: getAndroidOptions(),
    );
    if (appKeys.isNotEmpty) {
      // delete all keys if required no of keys are not found
      if (appKeys.keys.length != getAppKeys.length) {
        deleteAllKeys();
      }
    }
    log(appKeys.toString());
  }

  // delete all keys
  Future<void> deleteAllKeys() async {
    await storage.deleteAll(
      aOptions: getAndroidOptions(),
    );
    readAllKeys();
  }

  // write key
  Future<void> writeKey({
    required String key,
    required String value,
  }) async {
    await storage.write(
      key: key,
      value: value,
      aOptions: getAndroidOptions(),
    );
    readAllKeys();
  }

  /*
  1 - User verified
  0 - User not verified
  -1 - user not logged in
   */
  Future<int> isUserLoggedIn() async {
    await readAllKeys();
    if (appKeys[AppKey.isVerified.key] == 'true') {
      return 1;
    } else if (appKeys[AppKey.isVerified.key] == 'false') {
      return 0;
    } else {
      return -1;
    }
  }
}
