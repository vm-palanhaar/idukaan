import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_shop_ctrl_api.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_shop_ctrl_mdl.dart';

class IrShopCtrl extends IrShopCtrlMdl {
  final IrShopCtrlApi _api = IrShopCtrlApi();

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
      notifyListeners();
    }
  }
}
