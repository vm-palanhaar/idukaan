import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalCtrlMdl extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  final List<String> _appKeys = [
    AppKey.firstName.key,
    AppKey.lastName.key,
    AppKey.username.key,
    AppKey.isVerified.key,
    AppKey.token.key,
  ];

  List<String> get getAppKeys => _appKeys;

  Map<String, String> appKeys = {};
}

enum AppKey {
  firstName(key: 'ipid_user_firstname'),
  lastName(key: 'ipid_user_lastname'),
  username(key: 'ipid_user_username'),
  isVerified(key: 'ipid_user_isverified'),
  token(key: 'ipid_user_token');

  const AppKey({
    required this.key,
  });

  final String key;
}
