import 'package:solari/core/utils/responses/core_response.dart';

class ForgetPasswordResponse extends ApiResponse<ForgetPasswordData> {
  ForgetPasswordResponse({
    required super.status,
    super.message,
    super.data,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? ForgetPasswordData.fromJson(json['data'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class ForgetPasswordData {
  final String otpToken;

  ForgetPasswordData({
    required this.otpToken,
  });

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordData(
      otpToken: json['otp_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'otp_token': otpToken,
    };
  }
}
