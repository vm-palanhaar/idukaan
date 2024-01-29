class OrgListObjResMdl {
  final String id;
  final String name;
  final bool isActive;
  final bool isKyo;
  final bool empMng;

  OrgListObjResMdl({
    required this.id,
    required this.name,
    required this.isActive,
    required this.isKyo,
    required this.empMng,
  });

  factory OrgListObjResMdl.fromJson(Map<String, dynamic> json) {
    return OrgListObjResMdl(
      id: json["id"] as String,
      name: json["name"] as String,
      isActive: json["isActive"] as bool,
      isKyo: json["isKyo"] as bool,
      empMng: json["isMng"] as bool,
    );
  }
}
