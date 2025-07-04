import 'package:solari/core/utils/enums/user_types.dart';
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
  final String? otpToken;
  final bool otpVerified;
  final String token;
  final UserType userType;

  AuthData({
    required this.name,
    required this.email,
    required this.otpToken,
    required this.otpVerified,
    required this.token,
    required this.userType,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      name: json['name'],
      email: json['email'],
      otpToken: json['otp_token'],
      otpVerified: json['otp_verified'],
      token: json['token'],
      userType: UserType.fromStringKey(json['role'] ?? ''),
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
