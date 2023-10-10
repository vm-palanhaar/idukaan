class AddIrShopSObjResMdl {
  final String id;
  final String org;
  final String shopName;
  final String shopNo;
  final String station;

  AddIrShopSObjResMdl({
    required this.id,
    required this.org,
    required this.shopName,
    required this.shopNo,
    required this.station,
  });

  factory AddIrShopSObjResMdl.fromJson(Map<String, dynamic> json) {
    return AddIrShopSObjResMdl(
      id: json["id"] as String,
      org: json["org"] as String,
      shopName: json["name"] as String,
      shopNo: json["shop_no"] as String,
      station: json["station"] as String,
    );
  }
}
