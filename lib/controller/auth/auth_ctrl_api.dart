import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:idukaan/controller/handle_errors_api.dart';
import 'package:idukaan/controller/rest_api.dart';

class AuthCtrlApi extends HandleErrorsApi {
  Future<String> getUserLoggedInValidApi({
    required BuildContext context,
    required String token,
    required bool showError,
  }) async {
    super.context = context;
    super.showError = true;
    var response = await http.post(
      Uri.parse(UserApiUri.validate.uri),
      headers: {
        'Authorization': 'Token $token',
      },
    );
    var resDecode = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return resDecode['token'];
    } else {
      handleErrors(statusCode: response.statusCode);
      return '';
    }
  }
}
