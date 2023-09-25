import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/local/local_ctrl.dart';
import 'package:idukaan/controller/local/local_ctrl_mdl.dart';
import 'package:idukaan/controller/user/user_ctrl_api.dart';
import 'package:idukaan/controller/user/user_ctrl_mdl.dart';
import 'package:provider/provider.dart';

class UserCtrl extends UserCtrlMdl {
  final UserCtrlApi _userApi = UserCtrlApi();

  Future<void> postUserSignupApi({
    required BuildContext context,
  }) async {
    super.context = context;
    userSignUpRes = await _userApi.postUserSignupApi(
      context: context,
      userSignupReq: userSignUpReq,
      showError: true,
    );
    notifyListeners();
  }

  Future<void> postUserLoginApi({
    required BuildContext context,
  }) async {
    super.context = context;
    userLoginRes = await _userApi.postUserLoginApi(
      context: context,
      userLoginReq: userLoginReq,
      showError: true,
    );
    await saveUserInfo();
    notifyListeners();
  }

  Future<void> saveUserInfo() async {
    if (userLoginRes != null) {
      if (userLoginRes!.userSObj != null) {
        LocalCtrl ctrl = Provider.of<LocalCtrl>(context!, listen: false);
        ctrl.deleteAllKeys();
        ctrl.writeKey(
          key: AppKey.firstName.key,
          value: userLoginRes!.userSObj!.firstName,
        );
        ctrl.writeKey(
          key: AppKey.lastName.key,
          value: userLoginRes!.userSObj!.lastName,
        );
        ctrl.writeKey(
          key: AppKey.username.key,
          value: userLoginRes!.userSObj!.username,
        );
        ctrl.writeKey(
          key: AppKey.isVerified.key,
          value: userLoginRes!.userSObj!.isVer.toString(),
        );
        ctrl.writeKey(
          key: AppKey.token.key,
          value: userLoginRes!.token,
        );
      }
    }
  }
}
