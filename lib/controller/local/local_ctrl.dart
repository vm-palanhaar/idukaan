import 'package:idukaan/controller/local/local_ctrl_mdl.dart';

class LocalCtrl extends LocalCtrlMdl {
  // read all values
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
    if (appKeys.length != getAppKeys.length) {
      await deleteAllKeys();
    }
  }

  // delete all keys
  Future<void> deleteAllKeys() async {
    for (String key in getAppKeys) {
      await storage.delete(
        key: key,
        aOptions: getAndroidOptions(),
      );
    }
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
