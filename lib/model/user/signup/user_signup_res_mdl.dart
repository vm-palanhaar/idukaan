import 'package:idukaan/model/user/signup/user_signup_fobj_res_mdl.dart';
import 'package:idukaan/model/user/signup/user_signup_sobj_res_mdl.dart';

class UserSignupResMdl {
  // success
  final UserSignupSObjResMdl? userSObj;
  final String message;
  // failed
  final UserSignupFObjResMdl? userFObj;

  UserSignupResMdl({
    required this.userSObj,
    required this.message,
    required this.userFObj,
  });

  factory UserSignupResMdl.success(Map<String, dynamic> json) {
    return UserSignupResMdl(
      userSObj: UserSignupSObjResMdl.fromJson(json['user']),
      message: json['message'] as String,
      userFObj: null,
    );
  }

  factory UserSignupResMdl.failed(Map<String, dynamic> json) {
    return UserSignupResMdl(
      userSObj: null,
      message: json['message'] as String,
      userFObj: UserSignupFObjResMdl.fromJson(json),
    );
  }
}
