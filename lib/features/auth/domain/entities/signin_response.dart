import 'dart:convert';

// ignore: constant_identifier_names
const String MERCHANT = 'merchant';
// ignore: constant_identifier_names
const String M_PROMOTER = 'marketing_promoter';
// ignore: constant_identifier_names
const String M_SUPERVISOR = 'marketing_supervisor';
// ignore: constant_identifier_names
const String M_MANAGER = 'marketing_manager';
// ignore: constant_identifier_names
const String M_H_MANAGER = 'marketing_head_manager';

// ignore: constant_identifier_names
const String S_PROMOTER = 'sales_promoter';
// ignore: constant_identifier_names
const String S_SUPERVISOR = 'sales_supervisor';
// ignore: constant_identifier_names
const String S_MANAGER = 'sales_manager';
// ignore: constant_identifier_names
const String S_H_MANAGER = 'sales_head_manager';

enum UserTeam { merchant, sales, marketing }

enum UserType {
  merchant(userTeam: UserTeam.merchant),
  marketingPromoter(userTeam: UserTeam.marketing),
  marketingSupervisor(userTeam: UserTeam.marketing),
  marketingManager(userTeam: UserTeam.marketing),
  marketingHeadManager(userTeam: UserTeam.marketing),
  salesPromoter(userTeam: UserTeam.sales),
  salesSupervisor(userTeam: UserTeam.sales),
  salesManager(userTeam: UserTeam.sales),
  salesHeadManager(userTeam: UserTeam.sales);

  final UserTeam userTeam;

  const UserType({required this.userTeam});
  String getServerString() {
    switch (this) {
      case UserType.merchant:
        return MERCHANT;
      case UserType.marketingPromoter:
        return M_PROMOTER;
      case UserType.marketingSupervisor:
        return M_SUPERVISOR;
      case UserType.marketingManager:
        return M_MANAGER;
      case UserType.marketingHeadManager:
        return M_H_MANAGER;
      case UserType.salesPromoter:
        return S_PROMOTER;
      case UserType.salesSupervisor:
        return S_SUPERVISOR;
      case UserType.salesManager:
        return S_MANAGER;
      case UserType.salesHeadManager:
        return S_H_MANAGER;
    }
  }

  static UserType fromStringKey(String key) {
    switch (key) {
      case MERCHANT:
        return UserType.merchant;
      case M_PROMOTER:
        return UserType.marketingPromoter;
      case M_SUPERVISOR:
        return UserType.marketingSupervisor;
      case M_MANAGER:
        return UserType.marketingManager;
      case M_H_MANAGER:
        return UserType.marketingHeadManager;
      case S_PROMOTER:
        return UserType.salesPromoter;
      case S_SUPERVISOR:
        return UserType.salesSupervisor;
      case S_MANAGER:
        return UserType.salesManager;
      case S_H_MANAGER:
        return UserType.salesHeadManager;
      default:
        return UserType.merchant;
    }
  }

  List<UserType> whoCanFollow() {
    List<UserType> list = <UserType>[];
    switch (this) {
      case UserType.marketingPromoter:
        return <UserType>[];
      case UserType.marketingSupervisor:
        return <UserType>[UserType.marketingPromoter];
      case UserType.marketingManager:
        return <UserType>[
          UserType.marketingPromoter,
          UserType.marketingSupervisor
        ];
      case UserType.marketingHeadManager:
        return <UserType>[
          UserType.marketingPromoter,
          UserType.marketingSupervisor,
          UserType.marketingManager
        ];
      case UserType.salesPromoter:
        return <UserType>[
          UserType.marketingPromoter,
        ];
      case UserType.salesSupervisor:
        return <UserType>[
          UserType.marketingPromoter,
          UserType.salesPromoter,
        ];
      case UserType.salesManager:
        return <UserType>[
          UserType.marketingPromoter,
          UserType.salesPromoter,
          UserType.salesSupervisor,
        ];
      case UserType.salesHeadManager:
        return <UserType>[
          UserType.marketingPromoter,
          UserType.salesPromoter,
          UserType.salesSupervisor,
          UserType.salesManager,
        ];

      default:
    }
    return list;
  }
}

class SignInResponse {
  final SignInData data;
  final int status;

  SignInResponse({
    required this.data,
    required this.status,
  });

  SignInResponse copyWith({
    SignInData? data,
    int? status,
  }) =>
      SignInResponse(
        data: data ?? this.data,
        status: status ?? this.status,
      );

  factory SignInResponse.fromRawJson(String str) =>
      SignInResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        data: SignInData.fromJson(json['data']),
        status: json['status'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data.toJson(),
        'status': status,
      };
}

class SignInData {
  final String accessToken;
  final User user;

  SignInData({
    required this.accessToken,
    required this.user,
  });

  SignInData copyWith({
    String? accessToken,
    User? user,
  }) =>
      SignInData(
        accessToken: accessToken ?? this.accessToken,
        user: user ?? this.user,
      );

  factory SignInData.fromRawJson(String str) =>
      SignInData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInData.fromJson(Map<String, dynamic> json) => SignInData(
        accessToken: json['access_token'],
        user: User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'access_token': accessToken,
      };
}

enum UserPermissions {
  regiserClient,
  acceptRegisterRequest,
  editCleintData,
  recordWorkingHours,
}

class User {
  final int id;
  final String name;
  final String avatar;
  final String? email;
  final String phone;
  final bool isVerified;

  User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phone,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'] ?? '',
      email: json['email'],
      phone: json['mobile'],
      isVerified: json['is_verified'],
    );
  }
  User copyWith({
    int? id,
    String? name,
    String? avatar,
    String? email,
    String? phone,
    bool? isVerified,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        isVerified: isVerified ?? this.isVerified,
      );
}
