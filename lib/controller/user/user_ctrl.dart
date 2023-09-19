import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/user/user_ctrl_mdl.dart';

class UserCtrl extends UserCtrlMdl {
  final userSignupKey = GlobalKey<FormState>();

  Future<void> userSignupApi({
    required BuildContext context,
  }) async {}

  Future<void> userLoginApi({
    required BuildContext context,
  }) async {}
}
