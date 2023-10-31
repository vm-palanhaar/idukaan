class IrShopListObjResMdl {
  final String id;
  final String orgId;
  final String shopNo;
  final String shopName;
  final String shopImg;
  final String station;
  final String plt1;
  final String plt2;
  bool isOpen;
  final bool isActive;
  final bool isVer;
  final bool empMng;
  final String msg;

  String getPlt() {
    if (plt1.isNotEmpty && plt2.isNotEmpty) {
      return '$plt1, $plt2';
    } else if (plt1.isNotEmpty && plt2.isEmpty) {
      return plt1;
    } else if (plt1.isEmpty && plt2.isNotEmpty) {
      return plt2;
    }
    return '';
  }

  IrShopListObjResMdl({
    required this.id,
    required this.orgId,
    required this.shopNo,
    required this.shopName,
    required this.shopImg,
    required this.station,
    required this.plt1,
    required this.plt2,
    required this.isOpen,
    required this.isActive,
    required this.isVer,
    required this.empMng,
    required this.msg,
  });

  factory IrShopListObjResMdl.fromJson(Map<String, dynamic> json) {
    return IrShopListObjResMdl(
      id: json["id"] as String,
      orgId: json["org"] as String,
      shopNo: json["shop_no"] as String,
      shopName: json["name"] as String,
      shopImg: json["img"] as String,
      station: json["station"] as String,
      plt1: json["plt1"] ?? '',
      plt2: json["plt2"] ?? '',
      isOpen: json["is_open"] as bool,
      isActive: json["is_active"] as bool,
      isVer: json["is_verified"] as bool,
      empMng: json["emp_manager"] as bool,
      msg: json["msg"] ?? '',
    );
  }
}
