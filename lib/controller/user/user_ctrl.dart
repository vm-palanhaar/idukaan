import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/auth/auth_ctrl.dart';
import 'package:idukaan/controller/auth/auth_ctrl_mdl.dart';
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
    await _saveUserLoginInfo();
    notifyListeners();
  }

  Future<void> _saveUserLoginInfo() async {
    if (userLoginRes != null) {
      if (userLoginRes!.token.isNotEmpty && userLoginRes!.userSObj != null) {
        AuthCtrl ctrl = Provider.of<AuthCtrl>(context!, listen: false);
        await ctrl.writeKey(
          key: AppKey.firstName.key,
          value: userLoginRes!.userSObj!.firstName,
        );
        await ctrl.writeKey(
          key: AppKey.lastName.key,
          value: userLoginRes!.userSObj!.lastName,
        );
        await ctrl.writeKey(
          key: AppKey.username.key,
          value: userLoginRes!.userSObj!.username,
        );
        await ctrl.writeKey(
          key: AppKey.token.key,
          value: userLoginRes!.token,
        );
      }
    }
  }

  Future<void> postUserLogoutApi({
    required BuildContext context,
  }) async {
    AuthCtrl ctrl = Provider.of<AuthCtrl>(context, listen: false);
    String token = ctrl.appKeys[AppKey.token.key]!;
    userLogoutRes = await _userApi.postUserLogoutApi(
      context: context,
      token: token,
      showError: true,
    );
    if (userLogoutRes) {
      await ctrl.deleteAllKeys();
    }
    notifyListeners();
  }
}
