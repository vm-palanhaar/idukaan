class OrgListObjResMdl {
  final String id;
  final String name;
  final bool isActive;
  final bool isVer;

  OrgListObjResMdl({
    required this.id,
    required this.name,
    required this.isActive,
    required this.isVer,
  });

  factory OrgListObjResMdl.fromJson(Map<String, dynamic> json) {
    return OrgListObjResMdl(
      id: json["id"] as String,
      name: json["name"] as String,
      isActive: json["is_active"] as bool,
      isVer: json["is_verified"] as bool,
    );
  }
}
