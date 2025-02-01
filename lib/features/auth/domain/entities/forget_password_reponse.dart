import 'dart:convert';

class ForgetPasswordResponse {
  final ForgetPasswordData data;
  final int status;

  ForgetPasswordResponse({
    required this.data,
    required this.status,
  });

  ForgetPasswordResponse copyWith({
    ForgetPasswordData? data,
    int? status,
  }) =>
      ForgetPasswordResponse(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  factory ForgetPasswordResponse.fromRawJson(String str) =>
      ForgetPasswordResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordResponse(
        data: ForgetPasswordData.fromJson(json['data']),
        status: json['status'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data.toJson(),
        'status': status,
      };
}

class ForgetPasswordData {
  final String verificationCode;
  final String accessToken;

  ForgetPasswordData({
    required this.verificationCode,
    required this.accessToken,
  });

  ForgetPasswordData copyWith({
    String? verificationCode,
    String? accessToken,
  }) =>
      ForgetPasswordData(
        verificationCode: verificationCode ?? this.verificationCode,
        accessToken: accessToken ?? this.accessToken,
      );

  factory ForgetPasswordData.fromRawJson(String str) =>
      ForgetPasswordData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordData(
        verificationCode: json['verification_code'].toString(),
        accessToken: json['access_token'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'verification_code': verificationCode,
        'access_token': accessToken,
      };
}
