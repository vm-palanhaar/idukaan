import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idukaan/controller/handle_errors_api.dart';
import 'package:idukaan/controller/rest_api.dart';
import 'package:idukaan/model/main/business/add/add_org_req_mdl.dart';
import 'package:idukaan/model/main/business/add/add_org_res_mdl.dart';
import 'package:idukaan/model/main/business/add/org_types_mdl.dart';

class BusinessCtrlApi extends HandleErrorsApi {
  late String _token;
  void setToken(String token) => _token = token;

  Future<List<OrgTypesMdl>> getOrgTypesApi({
    required BuildContext context,
    required bool showError,
  }) async {
    super.context = context;
    super.showError = showError;
    List<OrgTypesMdl> list = [];
    if (await checkInternetConnectivity()) {
      var response = await http.get(
        Uri.parse(BusinessApiUri.orgTypes.uri),
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var resDecode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        list = resDecode
            .map<OrgTypesMdl>((json) => OrgTypesMdl.fromJson(json))
            .toList();
      } else {
        //TODO: handle error codes
      }
    }
    return list;
  }

  Future<AddOrgResMdl?> postOrgApi({
    required BuildContext context,
    required bool showError,
    required AddOrgReqMdl addOrg,
  }) async {
    super.context = context;
    super.showError = showError;
    AddOrgResMdl? res;
    if (await checkInternetConnectivity()) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BusinessApiUri.addOrg.uri),
      );
      request.headers['Authorization'] = 'Token $_token';

      request.fields['type'] = addOrg.getType.id;
      request.fields['name'] = addOrg.getName;
      request.files.add(
        await http.MultipartFile.fromPath(
          "doc",
          addOrg.getDoc,
          filename: '${addOrg.getName}.pdf',
        ),
      );
      request.fields['reg_no'] = addOrg.getRegNo;

      var response = await request.send();
      var resData = await response.stream.toBytes();
      var resDecode = jsonDecode(String.fromCharCodes(resData));
      if (response.statusCode == 201) {
        res = AddOrgResMdl.success(resDecode);
      } else if (response.statusCode == 409) {
        res = AddOrgResMdl.failed(resDecode);
      } else {
        //TODO: handle error codes
      }
    }
    return res;
  }
}
