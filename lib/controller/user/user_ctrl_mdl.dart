import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idukaan/model/user/signup/user_signup_req_mdl.dart';
import 'package:idukaan/model/user/signup/user_signup_res_mdl.dart';

class UserCtrlMdl extends ChangeNotifier {
  UserSignupReqMdl userSignUpReq = UserSignupReqMdl();
  UserSignupResMdl? userSignUpRes;
}
