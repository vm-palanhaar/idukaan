import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:idukaan/controller/rest_api.dart';
import 'package:idukaan/model/user/user_logged_in_res_mdl.dart';

class AuthCtrlApi {
  Future<UserLoggedInResMdl?> getUserLoggedInValidApi({
    required BuildContext context,
    required String token,
    required bool showError,
  }) async {
    UserLoggedInResMdl? userRes;
    var response = await http.get(
      Uri.parse(UserApiUri.validate.uri),
      headers: {
        'Authorization': 'Token $token',
      },
    );
    var resDecode = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        userRes = UserLoggedInResMdl.fromJson(resDecode['user']);
        return userRes;
    }
    return userRes;
  }
}
