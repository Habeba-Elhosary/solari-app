import 'package:solari/core/utils/responses/core_response.dart';

class VerifyOtpResponse extends ApiResponse<VerifyOtpData?> {
  VerifyOtpResponse({
    required super.status,
    super.message,
    super.data,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? VerifyOtpData.fromJson(json['data']) : null,
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

class VerifyOtpData {
  final String resetToken;

  VerifyOtpData({
    required this.resetToken,
  });

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) {
    return VerifyOtpData(
      resetToken: json['reset_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reset_token': resetToken,
    };
  }
}
