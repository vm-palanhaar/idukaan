import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/auth/auth_ctrl.dart';
import 'package:idukaan/controller/auth/auth_ctrl_mdl.dart';
import 'package:idukaan/controller/main/business/business_ctrl_api.dart';
import 'package:idukaan/controller/main/business/business_ctrl_mdl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_shop_ctrl.dart';
import 'package:provider/provider.dart';

class BusinessCtrl extends BusinessCtrlMdl {
  BuildContext context;
  final BusinessCtrlApi _api = BusinessCtrlApi();
  final IrShopCtrl _irShopCtrl = IrShopCtrl();

  BusinessCtrl({required this.context}) {
    String? token = Provider.of<AuthCtrl>(
      context,
      listen: false,
    ).appKeys[AppKey.token.key]!;
    _api.setToken(token);
    _irShopCtrl.setTokenIrShopCtrl(token: token);
  }

  Future<void> getOrgTypesApi({
    required BuildContext context,
  }) async {
    if (orgTypeList.isEmpty) {
      orgTypeList = await _api.getOrgTypesApi(
        context: context,
        showError: false,
      );
    }
    if (orgTypeList.isNotEmpty) {
      addOrg.setType(orgTypeList.first);
    }
  }

  Future<void> postOrgApi({
    required BuildContext context,
  }) async {
    addOrgRes = await _api.postOrgApi(
      context: context,
      showError: true,
      addOrg: addOrg,
    );
    addOrg.setInitValues();
    notifyListeners();
  }

  Future<void> getOrgListApi({
    required BuildContext context,
    required bool reload,
  }) async {
    if (orgList == null || orgList!.org.isEmpty || reload) {
      orgList = null;
      orgList = await _api.getOrgListApi(
        context: context,
        showError: true,
      );
      notifyListeners();
    }
  }

  Future<void> getOrgInfoApi({
    required BuildContext context,
  }) async {
    orgInfo = await _api.getOrgInfoApi(
      context: context,
      showError: true,
      orgId: org!.id,
    );
    notifyListeners();
  }

  Future<void> postOrgEmpApi({
    required BuildContext context,
  }) async {
    addOrgEmp.setOrg(org!.id);
    addOrgEmpRes = await _api.postOrgEmpApi(
      context: context,
      addOrgEmp: addOrgEmp,
      showError: true,
    );
    addOrgEmp.setInitValues();
    notifyListeners();
  }

  Future<void> getOrgEmpListApi({
    required BuildContext context,
    required bool reload,
  }) async {
    if (orgEmpList == null || orgEmpList!.emp.isEmpty || reload) {
      orgEmpList = null;
      orgEmpList = await _api.getOrgEmpListApi(
        context: context,
        showError: true,
        orgId: org!.id,
      );
      notifyListeners();
    }
  }

  Future<void> patchOrgEmpApi({
    required BuildContext context,
  }) async {
    updateOrgEmp.setOrg(org!.id);
    updateOrgEmpRes = await _api.patchOrgEmpApi(
      context: context,
      showError: true,
      updateEmp: updateOrgEmp,
    );
    updateOrgEmp.setInitValues();
    notifyListeners();
  }

  Future<void> deleteOrgEmpApi({
    required BuildContext context,
    required String empId,
  }) async {
    deleteOrgEmpRes = await _api.deleteOrgEmpApi(
      context: context,
      showError: true,
      orgId: org!.id,
      empId: empId,
    );
    notifyListeners();
  }
}
