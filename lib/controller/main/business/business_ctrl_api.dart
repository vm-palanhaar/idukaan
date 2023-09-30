import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idukaan/controller/handle_errors_api.dart';
import 'package:idukaan/controller/rest_api.dart';
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
      switch (response.statusCode) {
        case 200:
          list = resDecode
              .map<OrgTypesMdl>((json) => OrgTypesMdl.fromJson(json))
              .toList();
          break;
        default:
          //TODO: handle error codes
      }
    }
    return list;
  }
}
