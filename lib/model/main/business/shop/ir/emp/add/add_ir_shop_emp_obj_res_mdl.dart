class AddIrShopEmpObjResMdl {
  final String id;
  final String shopId;
  final String orgEmpId;
  final bool isMng;

  AddIrShopEmpObjResMdl({
    required this.id,
    required this.shopId,
    required this.orgEmpId,
    required this.isMng,
  });

  factory AddIrShopEmpObjResMdl.fromJson(Map<String, dynamic> json) {
    return AddIrShopEmpObjResMdl(
      id: json["id"] as String,
      shopId: json["shop"].toString(),
      orgEmpId: json["org_emp"].toString(),
      isMng: json["is_manager"] as bool,
    );
  }
}
