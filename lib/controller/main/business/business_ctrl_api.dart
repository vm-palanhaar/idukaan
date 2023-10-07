import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idukaan/controller/handle_errors_api.dart';
import 'package:idukaan/controller/rest_api.dart';
import 'package:idukaan/model/main/business/add/add_org_req_mdl.dart';
import 'package:idukaan/model/main/business/add/add_org_res_mdl.dart';
import 'package:idukaan/model/main/business/add/org_types_mdl.dart';
import 'package:idukaan/model/main/business/emp/add/add_org_emp_req_mdl.dart';
import 'package:idukaan/model/main/business/emp/add/add_org_emp_res_mdl.dart';
import 'package:idukaan/model/main/business/emp/delete/delete_org_emp_res_mdl.dart';
import 'package:idukaan/model/main/business/emp/list/org_emp_list_res_mdl.dart';
import 'package:idukaan/model/main/business/emp/patch/update_org_emp_req_mdl.dart';
import 'package:idukaan/model/main/business/emp/patch/update_org_emp_res_mdl.dart';
import 'package:idukaan/model/main/business/info/org_info_res_mdl.dart';
import 'package:idukaan/model/main/business/list/org_list_res_mdl.dart';

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
        list = resDecode.map<OrgTypesMdl>(
          (json) {
            return OrgTypesMdl.fromJson(json);
          },
        ).toList();
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

  Future<OrgListResMdl?> getOrgListApi({
    required BuildContext context,
    required bool showError,
  }) async {
    super.context = context;
    super.showError = showError;
    OrgListResMdl? orgList;
    if (await checkInternetConnectivity()) {
      var response = await http.get(
        Uri.parse(BusinessApiUri.orgList.uri),
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var resDecode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        orgList = OrgListResMdl.success(resDecode);
      } else if (response.statusCode == 400) {
        orgList = OrgListResMdl.failed(resDecode);
      } else {
        //TODO: handle error codes
      }
    }
    return orgList;
  }

  Future<OrgInfoResMdl?> getOrgInfoApi({
    required BuildContext context,
    required bool showError,
    required String orgId,
  }) async {
    super.context = context;
    super.showError = showError;
    OrgInfoResMdl? orgInfo;
    if (await checkInternetConnectivity()) {
      String uri = BusinessApiUri.orgInfo.uri;
      uri = uri.replaceAll("<orgId>", orgId);
      var response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var resDecode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        orgInfo = OrgInfoResMdl.success(resDecode);
      } else if (response.statusCode == 403) {
        orgInfo = OrgInfoResMdl.failed(resDecode);
      } else {
        //TODO: handle error codes
      }
    }
    return orgInfo;
  }

  Future<AddOrgEmpResMdl?> postOrgEmpApi({
    required BuildContext context,
    required AddOrgEmpReqMdl addOrgEmp,
    required bool showError,
  }) async {
    super.context = context;
    super.showError = showError;
    AddOrgEmpResMdl? res;
    if (await checkInternetConnectivity()) {
      String uri = BusinessApiUri.addOrgEmp.uri;
      uri = uri.replaceAll("<orgId>", addOrgEmp.getOrg);
      var response = await http.post(
        Uri.parse(uri),
        body: {
          'org': addOrgEmp.getOrg,
          'user': addOrgEmp.getUser,
          'is_manager': addOrgEmp.getIsMng,
          'join_date': addOrgEmp.getJDate,
        },
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var resDecode = jsonDecode(response.body);
      if (response.statusCode == 201) {
        res = AddOrgEmpResMdl.success(resDecode);
      }
      if (response.statusCode == 400) {
        res = AddOrgEmpResMdl.failed(resDecode);
      }
      if (response.statusCode == 403) {
        res = AddOrgEmpResMdl.failed(resDecode);
        //TODO: Logout user and show alert message as user account blocked
      }
      if (response.statusCode == 409) {
        res = AddOrgEmpResMdl.failed(resDecode);
      }
    }
    return res;
  }

  Future<OrgEmpListResMdl?> getOrgEmpListApi({
    required BuildContext context,
    required bool showError,
    required String orgId,
  }) async {
    super.context = context;
    super.showError = showError;
    OrgEmpListResMdl? res;
    if (await checkInternetConnectivity()) {
      String uri = BusinessApiUri.orgEmpList.uri;
      uri = uri.replaceAll("<orgId>", orgId);
      var response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var resDecode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        res = OrgEmpListResMdl.success(resDecode);
      } else if (response.statusCode == 403) {
        res = OrgEmpListResMdl.failed(resDecode);
      } else {
        //TODO: handle error codes
      }
    }
    return res;
  }

  Future<UpdateOrgEmpResMdl?> patchOrgEmpApi({
    required BuildContext context,
    required bool showError,
    required UpdateOrgEmpReqMdl updateEmp,
  }) async {
    super.context = context;
    super.showError = showError;
    UpdateOrgEmpResMdl? res;
    if (await checkInternetConnectivity()) {
      String uri = BusinessApiUri.patchOrgEmp.uri;
      uri = uri.replaceAll("<orgId>", updateEmp.getOrg);
      uri = uri.replaceAll("<orgEmpId>", updateEmp.getId);
      var response = await http.patch(
        Uri.parse(uri),
        body: {
          'id': updateEmp.getId,
          'is_manager': updateEmp.getIsMng,
          'join_date': updateEmp.getJDate,
        },
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var resDecode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        res = UpdateOrgEmpResMdl.success(resDecode);
      }
      if (response.statusCode == 400) {
        res = UpdateOrgEmpResMdl.failed(resDecode);
      }
      if (response.statusCode == 403) {
        res = UpdateOrgEmpResMdl.failed(resDecode);
        //TODO: Logout user and show alert message as user account blocked
      }
    }
    return res;
  }

  Future<DeleteOrgEmpResMdl?> deleteOrgEmpApi({
    required BuildContext context,
    required bool showError,
    required String orgId,
    required String empId,
  }) async {
    super.context = context;
    super.showError = showError;
    DeleteOrgEmpResMdl? res;
    if (await checkInternetConnectivity()) {
      String uri = BusinessApiUri.deleteOrgEmp.uri;
      uri = uri.replaceAll("<orgId>", orgId);
      uri = uri.replaceAll("<orgEmpId>", empId);
      var response = await http.delete(
        Uri.parse(uri),
        body: {
          'id': empId,
        },
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var resDecode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        res = DeleteOrgEmpResMdl.success(resDecode);
      }
      if (response.statusCode == 400) {
        res = DeleteOrgEmpResMdl.failed(resDecode);
      }
      if (response.statusCode == 403) {
        res = DeleteOrgEmpResMdl.failed(resDecode);
        //TODO: Logout user and show alert message as user account blocked
      }
    }
    return res;
  }


}
