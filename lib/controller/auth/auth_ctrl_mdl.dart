import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthCtrlMdl extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  final List<String> _appKeys = [
    AppKey.username.key,
    AppKey.token.key,
  ];

  List<String> get getAppKeys => _appKeys;

  Map<String, String> appKeys = {};

  /*
  true - user verified and valid logged in
  false - user not logged in
   */
  bool userLoggedIn = false;
}

enum AppKey {
  username(key: 'ipid_user_username'),
  token(key: 'ipid_user_token');

  const AppKey({
    required this.key,
  });

  final String key;
}
