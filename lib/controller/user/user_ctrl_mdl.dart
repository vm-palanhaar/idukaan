import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idukaan/model/user/login/user_login_req_mdl.dart';
import 'package:idukaan/model/user/login/user_login_res_mdl.dart';
import 'package:idukaan/model/user/signup/user_signup_req_mdl.dart';
import 'package:idukaan/model/user/signup/user_signup_res_mdl.dart';
import 'package:idukaan/model/user/user_logged_in_valid_res_mdl.dart';

class UserCtrlMdl extends ChangeNotifier {
  BuildContext? context;

  UserSignupReqMdl userSignUpReq = UserSignupReqMdl();
  UserSignupResMdl? userSignUpRes;

  UserLoginReqMdl userLoginReq = UserLoginReqMdl();
  UserLoginResMdl? userLoginRes;

  UserLoggedInValidResMdl? userLoggedInValidRes;

  bool userLogoutRes = false;
}
