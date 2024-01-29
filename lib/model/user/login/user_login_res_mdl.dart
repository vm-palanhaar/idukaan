import 'package:idukaan/model/user/login/user_login_fobj_res_mdl.dart';
import 'package:idukaan/model/user/login/user_login_sobj_res_mdl.dart';

class UserLoginResMdl {
  final String message;
  // success
  final UserLoginSObjResMdl? userSObj;
  final String token;
  // failed
  final UserLoginFObjResMdl? userFObj;

  UserLoginResMdl({
    required this.userSObj,
    required this.token,
    required this.message,
    required this.userFObj,
  });

  factory UserLoginResMdl.success(Map<String, dynamic> json) {
    return UserLoginResMdl(
      userSObj: UserLoginSObjResMdl.fromJson(json['userData']),
      token: json['token'] as String,
      message: json['message'] as String,
      userFObj: null,
    );
  }

  factory UserLoginResMdl.failed(Map<String, dynamic> json) {
    return UserLoginResMdl(
      userSObj: null,
      token: '',
      message: json['message'] as String,
      userFObj: UserLoginFObjResMdl.fromJson(json),
    );
  }
}
