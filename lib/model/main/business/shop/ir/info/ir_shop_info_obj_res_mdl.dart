class IrShopInfoObjResMdl {
  final String id;
  final String shopName;
  final String shopNo;
  final String shopImg;
  final String contactNo;
  final String station;
  final String plt1;
  final String plt2;
  final bool isOpen;
  final bool isActive;
  final bool isVer;
  bool isCash;
  bool isUpi;
  bool isCard;

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

  IrShopInfoObjResMdl({
    required this.id,
    required this.shopName,
    required this.shopNo,
    required this.shopImg,
    required this.contactNo,
    required this.station,
    required this.plt1,
    required this.plt2,
    required this.isOpen,
    required this.isActive,
    required this.isVer,
    required this.isCash,
    required this.isUpi,
    required this.isCard,
  });

  factory IrShopInfoObjResMdl.fromJson(Map<String, dynamic> json) {
    return IrShopInfoObjResMdl(
      id: json["id"] as String,
      shopName: json["name"] as String,
      shopNo: json["shop_no"] as String,
      shopImg: json["img"] as String,
      contactNo: json["contact_no"] as String,
      station: json["station"] as String,
      plt1: json["plt1"] ?? '',
      plt2: json["plt2"] ?? '',
      isOpen: json["is_open"] as bool,
      isActive: json["is_active"] as bool,
      isVer: json["is_verified"] as bool,
      isCash: json["is_cash"] as bool,
      isUpi: json["is_upi"] as bool,
      isCard: json["is_card"] as bool,
    );
  }
}
