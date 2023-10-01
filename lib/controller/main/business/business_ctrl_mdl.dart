import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idukaan/model/main/business/add/add_org_req_mdl.dart';
import 'package:idukaan/model/main/business/add/add_org_res_mdl.dart';
import 'package:idukaan/model/main/business/add/org_types_mdl.dart';
import 'package:idukaan/model/main/business/list/org_list_res_mdl.dart';

class BusinessCtrlMdl extends ChangeNotifier {
  List<OrgTypesMdl> orgTypeList = [];
  AddOrgReqMdl addOrg = AddOrgReqMdl();
  AddOrgResMdl? addOrgRes;

  OrgListResMdl? orgList;
}
