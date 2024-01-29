import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/list/org_list_obj_res_mdl.dart';

class OrgListResMdl {
  final List<OrgListObjResMdl> org;
  final String isVerMsg;
  final ErrorMdl? error;

  OrgListResMdl({
    required this.org,
    required this.isVerMsg,
    required this.error,
  });

  factory OrgListResMdl.success(Map<String, dynamic> json) {
    var list = json['orgList'] as List;
    return OrgListResMdl(
      org: list.map<OrgListObjResMdl>(
        (json) {
          return OrgListObjResMdl.fromJson(json);
        },
      ).toList(),
      isVerMsg: json['isKyoFalseMsg'] as String,
      error: null,
    );
  }

  factory OrgListResMdl.failed(Map<String, dynamic> json) {
    return OrgListResMdl(
      org: [],
      isVerMsg: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
