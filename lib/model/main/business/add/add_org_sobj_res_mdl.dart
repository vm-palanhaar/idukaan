class AddOrgSObjResMdl {
  final String id;
  final String name;
  final int type;

  AddOrgSObjResMdl({
    required this.id,
    required this.name,
    required this.type,
  });

  factory AddOrgSObjResMdl.fromJson(Map<String, dynamic> json) {
    return AddOrgSObjResMdl(
      id: json["id"] as String,
      name: json["name"] as String,
      type: json["type"] as int,
    );
  }
}
