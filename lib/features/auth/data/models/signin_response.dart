import 'package:solari/core/utils/responses/core_response.dart';

class SignInResponse extends ApiResponse<AuthData> {
  SignInResponse({
    required super.status,
    super.message,
    super.data,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? AuthData.fromJson(json['data']) : null,
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

class AuthData {
  final String name;
  final String email;
  final int otpVerified;
  final String token;

  AuthData({
    required this.name,
    required this.email,
    required this.otpVerified,
    required this.token,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      name: json['name'],
      email: json['email'],
      otpVerified: json['otp_verified'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'otp_verified': otpVerified,
      'token': token,
    };
  }
}
