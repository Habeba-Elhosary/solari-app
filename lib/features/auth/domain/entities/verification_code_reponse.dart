import 'dart:convert';

class VerificationCodeRepsonse {
  final String verificationCode;

  VerificationCodeRepsonse({
    required this.verificationCode,
  });

  VerificationCodeRepsonse copyWith({
    String? verificationCode,
  }) =>
      VerificationCodeRepsonse(
        verificationCode: verificationCode ?? this.verificationCode,
      );

  factory VerificationCodeRepsonse.fromRawJson(String str) =>
      VerificationCodeRepsonse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerificationCodeRepsonse.fromJson(Map<String, dynamic> json) =>
      VerificationCodeRepsonse(
        verificationCode: json['verification_code'].toString(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'verification_code': verificationCode,
      };
}
