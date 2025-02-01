import 'dart:convert';

ChangePasswordResponse changePasswordResponseFromJson(String str) =>
    ChangePasswordResponse.fromJson(json.decode(str));

String changePasswordResponseToJson(ChangePasswordResponse data) =>
    json.encode(data.toJson());

class ChangePasswordResponse {
  ChangePasswordResponse({
    required this.code,
    required this.status,
    required this.message,
    required this.body,
    required this.info,
  });

  final int code;
  final bool status;
  final String message;
  final List<dynamic> body;
  final String info;

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      ChangePasswordResponse(
        code: json['code'],
        status: json['status'],
        message: json['message'],
        // ignore: always_specify_types
        body: List<dynamic>.from(json['body'].map((x) => x)),
        info: json['info'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'status': status,
        'message': message,
        // ignore: always_specify_types
        'body': List<dynamic>.from(body.map((x) => x)),
        'info': info,
      };
}
