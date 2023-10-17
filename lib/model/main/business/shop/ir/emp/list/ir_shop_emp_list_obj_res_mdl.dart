class IrShopEmpListObjResMdl {
  final String id;
  final String name;
  bool isMng;
  String exp;
  String jDate;

  IrShopEmpListObjResMdl({
    required this.id,
    required this.name,
    required this.isMng,
    required this.exp,
    required this.jDate,
  });

  factory IrShopEmpListObjResMdl.fromJson(Map<String, dynamic> json) {
    return IrShopEmpListObjResMdl(
      id: json["id"] as String,
      name: json["name"] as String,
      isMng: json["is_manager"] as bool,
      exp: json["exp"] as String,
      jDate: json["join_date"] as String,
    );
  }
}