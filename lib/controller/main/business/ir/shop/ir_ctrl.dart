import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl_api.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl_mdl.dart';

class IrCtrl extends IrCtrlMdl {
  final IrCtrlApi _api = IrCtrlApi();

  void setTokenIrShopCtrl({
    required String token,
  }) {
    _api.setToken(token);
  }

  Future<void> getStationListApi({
    required BuildContext context,
  }) async {
    if (stationList == null || stationList!.stations.isEmpty) {
      stationList = await _api.getStationListApi(
        context: context,
        showError: true,
      );
      print(stationList!.stations.length);
      notifyListeners();
    }
  }
}
