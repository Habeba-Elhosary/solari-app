import 'dart:convert';

class SignInResponseModel {
  final String refresh;
  String access;
  final int id;
  SignInResponseModel({
    required this.refresh,
    required this.access,
    required this.id,
  });

  SignInResponseModel copyWith({
    String? refresh,
    String? access,
    int? id,
  }) {
    return SignInResponseModel(
      refresh: refresh ?? this.refresh,
      access: access ?? this.access,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'refresh token': refresh,
      'access token': access,
      'id': id,
    };
  }

  factory SignInResponseModel.fromMap(Map<String, dynamic> map) {
    return SignInResponseModel(
      refresh: map['refresh token'],
      access: map['access token'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInResponseModel.fromJson(String source) =>
      SignInResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginResponse(refresh: $refresh, access: $access, email: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignInResponseModel &&
        other.refresh == refresh &&
        other.access == access &&
        other.id == id;
  }

  @override
  int get hashCode => refresh.hashCode ^ access.hashCode ^ id.hashCode;
}
