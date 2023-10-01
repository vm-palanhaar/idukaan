import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/list/org_list_obj_res_mdl.dart';

class OrgListResMdl {
  final List<OrgListObjResMdl> org;
  final ErrorMdl? error;

  OrgListResMdl({
    required this.org,
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
      error: null,
    );
  }

  factory OrgListResMdl.failed(Map<String, dynamic> json) {
    return OrgListResMdl(
      org: [],
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
