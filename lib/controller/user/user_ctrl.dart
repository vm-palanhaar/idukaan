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
    await _saveUserLoginInfo();
    notifyListeners();
  }

  Future<void> _saveUserLoginInfo() async {
    if (userLoginRes != null) {
      if (userLoginRes!.userSObj != null) {
        LocalCtrl ctrl = Provider.of<LocalCtrl>(context!, listen: false);
        await ctrl.deleteAllKeys();
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
          key: AppKey.isVerified.key,
          value: userLoginRes!.userSObj!.isVer.toString(),
        );
        await ctrl.writeKey(
          key: AppKey.token.key,
          value: userLoginRes!.token,
        );
      }
    }
  }

  Future<void> getUserLoggedInValidApi({
    required BuildContext context,
  }) async {
    super.context = context;
    LocalCtrl ctrl = Provider.of<LocalCtrl>(context, listen: false);
    String token = ctrl.appKeys[AppKey.token.key]!;
    userLoggedInValidRes = await _userApi.getUserLoggedInValidApi(
      context: context,
      token: token,
      showError: true,
    );
    if (userLoggedInValidRes != null) {
      await _saveUserLoggedInValidInfo();
    } else {
      await ctrl.deleteAllKeys();
    }
    notifyListeners();
  }

  Future<void> _saveUserLoggedInValidInfo() async {
    LocalCtrl ctrl = Provider.of<LocalCtrl>(context!, listen: false);
    if (userLoggedInValidRes != null) {
      await ctrl.writeKey(
        key: AppKey.firstName.key,
        value: userLoggedInValidRes!.firstName,
      );
      await ctrl.writeKey(
        key: AppKey.lastName.key,
        value: userLoggedInValidRes!.lastName,
      );
      await ctrl.writeKey(
        key: AppKey.username.key,
        value: userLoggedInValidRes!.username,
      );
      await ctrl.writeKey(
        key: AppKey.isVerified.key,
        value: userLoggedInValidRes!.isVer.toString(),
      );
    } else {
      await ctrl.deleteAllKeys();
    }
  }

  Future<void> postUserLogoutApi({
    required BuildContext context,
  }) async {
    LocalCtrl ctrl = Provider.of<LocalCtrl>(context, listen: false);
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
