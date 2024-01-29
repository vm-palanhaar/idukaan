class OrgTypesMdl {
  final String id;
  final String entity;
  final String docType;
  final String docNo;
  final String desc;
  final bool isDoc;

  OrgTypesMdl({
    required this.id,
    required this.entity,
    required this.docType,
    required this.docNo,
    required this.desc,
    required this.isDoc,
  });

  factory OrgTypesMdl.fromJson(Map<String, dynamic> json) {
    return OrgTypesMdl(
      id: json["id"] as String,
      entity: json["entity"] as String,
      docType: json["doc"] as String,
      docNo: json["docNo"] as String,
      desc: json["desc"] as String,
      isDoc: json["isDoc"] as bool,
    );
  }
}