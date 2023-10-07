import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:idukaan/model/main/business/list/org_list_obj_res_mdl.dart';
import 'package:idukaan/model/main/business/list/org_list_res_mdl.dart';

class BusinessCtrlMdl extends ChangeNotifier {
  List<OrgTypesMdl> orgTypeList = [];
  AddOrgReqMdl addOrg = AddOrgReqMdl();
  AddOrgResMdl? addOrgRes;
  // list of org
  OrgListResMdl? orgList;
  // selected org obj
  OrgListObjResMdl? org;

  OrgInfoResMdl? orgInfo;
  // add org emp
  AddOrgEmpReqMdl addOrgEmp = AddOrgEmpReqMdl();
  AddOrgEmpResMdl? addOrgEmpRes;
  // list of org emp
  OrgEmpListResMdl? orgEmpList;
  // update org emp
  UpdateOrgEmpReqMdl updateOrgEmp = UpdateOrgEmpReqMdl();
  UpdateOrgEmpResMdl? updateOrgEmpRes;
  // delete org emp
DeleteOrgEmpResMdl? deleteOrgEmpRes;
}
