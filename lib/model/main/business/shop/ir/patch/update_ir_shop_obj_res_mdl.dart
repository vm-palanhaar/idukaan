class UpdateIrShopObjResMdl {
  final String id;
  final String contactNo;
  final bool isOpen;
  final bool isCash;
  final bool isUpi;
  final bool isCard;

  UpdateIrShopObjResMdl({
    required this.id,
    required this.contactNo,
    required this.isOpen,
    required this.isCash,
    required this.isUpi,
    required this.isCard,
  });

  factory UpdateIrShopObjResMdl.fromJson(Map<String, dynamic> json) {
    return UpdateIrShopObjResMdl(
      id: json["id"] as String,
      contactNo: json["contact_no"] as String,
      isOpen: json["is_open"] as bool,
      isCash: json["is_cash"] as bool,
      isUpi: json["is_upi"] as bool,
      isCard: json["is_card"] as bool,
    );
  }
}
