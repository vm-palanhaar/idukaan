import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:idukaan/controller/rest_api.dart';
import 'package:idukaan/model/user/login/user_login_req_mdl.dart';
import 'package:idukaan/model/user/login/user_login_res_mdl.dart';
import 'package:idukaan/model/user/signup/user_signup_req_mdl.dart';
import 'package:idukaan/model/user/signup/user_signup_res_mdl.dart';

class UserCtrlApi {
  Future<UserSignupResMdl?> postUserSignupApi({
    required BuildContext context,
    required UserSignupReqMdl userSignupReq,
    required bool showError,
  }) async {
    UserSignupResMdl? userRes;
    var response = await http.post(
      Uri.parse(UserApiUri.signup.uri),
      body: {
        'first_name': userSignupReq.getFirstName,
        'last_name': userSignupReq.getLastName,
        'contact_no': userSignupReq.getContactNo,
        'email': userSignupReq.getEmail,
        'username': userSignupReq.getUsername,
        'password': userSignupReq.getPwd,
      },
    );
    var resDecode = jsonDecode(response.body);
    switch (response.statusCode) {
      case 201:
        userRes = UserSignupResMdl.success(resDecode);
        break;
      default:
        userRes = UserSignupResMdl.failed(resDecode);
    }
    return userRes;
  }

  Future<UserLoginResMdl?> postUserLoginApi({
    required BuildContext context,
    required UserLoginReqMdl userLoginReq,
    required bool showError,
  }) async {
    UserLoginResMdl? userRes;
    var response = await http.post(
      Uri.parse(UserApiUri.login.uri),
      body: {
        'username': userLoginReq.getUsername,
        'password': userLoginReq.getPwd,
      },
    );
    var resDecode = jsonDecode(response.body);
    switch (response.statusCode) {
      case 201:
        userRes = UserLoginResMdl.success(resDecode);
        break;
      default:
        userRes = UserLoginResMdl.failed(resDecode);
    }
    return userRes;
  }

  Future<bool> postUserLogoutApi({
    required BuildContext context,
    required String token,
    required bool showError,
  }) async {
    var response = await http.post(
      Uri.parse(UserApiUri.logout.uri),
      headers: {
        'Authorization': 'Token $token',
      },
    );
    switch (response.statusCode){
      case 204:
        return true;
    }
    return false;
  }
}
