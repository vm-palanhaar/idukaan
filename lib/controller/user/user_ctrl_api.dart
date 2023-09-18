import 'package:flutter/cupertino.dart';
import 'package:idukaan/model/user/signup/user_signup_req_mdl.dart';
import 'package:idukaan/model/user/signup/user_signup_res_mdl.dart';

class UserCtrlApi {
  Future<UserSignupResMdl?> postUserSignup({
    required BuildContext context,
    required UserSignupReqMdl userSignupReq,
    required bool showError,
  }) async {}
}
