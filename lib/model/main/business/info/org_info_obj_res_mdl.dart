class OrgInfoObjResMdl {
  final String id;
  final String name;
  final String type;
  final int nEmp;

  String get getNoEmp => nEmp.toString();

  OrgInfoObjResMdl({
    required this.id,
    required this.name,
    required this.type,
    required this.nEmp,
  });

  factory OrgInfoObjResMdl.fromJson(Map<String, dynamic> json) {
    return OrgInfoObjResMdl(
      id: json["id"] as String,
      name: json["name"] as String,
      type: json["type"] as String,
      nEmp: json["emp"] as int,
    );
  }
}
