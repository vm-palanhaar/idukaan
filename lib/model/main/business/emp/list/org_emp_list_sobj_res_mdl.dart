class OrgEmpListSObjResMdl {
  final String id;
  final String name;
  bool isMng;
  String exp;
  String jDate;

  OrgEmpListSObjResMdl({
    required this.id,
    required this.name,
    required this.isMng,
    required this.exp,
    required this.jDate,
  });

  factory OrgEmpListSObjResMdl.fromJson(Map<String, dynamic> json) {
    return OrgEmpListSObjResMdl(
      id: json["id"] as String,
      name: json["name"] as String,
      isMng: json["isMng"] as bool,
      exp: json["exp"] as String,
      jDate: json["joinDate"] as String,
    );
  }
}