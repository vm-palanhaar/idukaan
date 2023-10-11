import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl_api.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl_mdl.dart';

class IrCtrl extends IrCtrlMdl {
  final IrCtrlApi _api = IrCtrlApi();

  void setTokenIrShopCtrl({
    required String token,
  }) {
    _api.setToken(token);
  }

  Future<bool> getIrShopLoc() async {
    LocationPermission permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      await Geolocator.openLocationSettings();
      return false;
    }
    Position? position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    addIrShop.addIrShop3.setLat(position.latitude.toString());
    addIrShop.addIrShop3.setLon(position.longitude.toString());
    return true;
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

  Future<void> postIrShopApi({
    required BuildContext context,
  }) async {
    addIrShopRes = await _api.postIrShopApi(
      context: context,
      showError: true,
      req: addIrShop,
    );
    notifyListeners();
  }
}
