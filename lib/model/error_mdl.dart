import 'dart:developer';

class ErrorMdl {
  final String code;
  final String msg;

  ErrorMdl({
    required this.code,
    required this.msg,
  });

  factory ErrorMdl.fromJson(Map<String, dynamic> json) {
    log(json['code']);
    return ErrorMdl(
      code: json["code"] as String,
      msg: json["message"] as String,
    );
  }
}