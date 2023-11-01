import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/auth/auth_ctrl.dart';
import 'package:idukaan/controller/auth/auth_ctrl_mdl.dart';
import 'package:idukaan/controller/main/profile/profile_ctrl_api.dart';
import 'package:idukaan/controller/main/profile/profile_ctrl_mdl.dart';
import 'package:idukaan/model/main/profile/info/profile_info_res_mdl.dart';
import 'package:provider/provider.dart';

class ProfileCtrl extends ProfileCtrlMdl {
  BuildContext context;
  final ProfileCtrlApi _api = ProfileCtrlApi();

  ProfileCtrl({required this.context}) {
    String? token = Provider.of<AuthCtrl>(
      context,
      listen: false,
    ).appKeys[AppKey.token.key]!;
    _api.setToken(token);
  }

  Future<ProfileInfoResMdl?> getProfileInfoApi({
    required BuildContext context,
  }) async {
    return await _api.getProfileInfoApi(
      context: context,
    );
  }

  Future<void> postLogoutApi({
    required BuildContext context,
  }) async {
    await _api.postLogoutApi(context: context);
  }
}
