import 'package:solari/core/widgets/single_drop_down_selector.dart';

class AllSystemsResponse {
  final int status;
  final String message;
  final List<System> data;

  AllSystemsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllSystemsResponse.fromJson(Map<String, dynamic> json) =>
      AllSystemsResponse(
        status: json["status"],
        message: json["message"],
        data: List<System>.from(json["data"].map((x) => System.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class System extends BaseSelectableEntity {
  const System({
    required super.id,
    required super.name,
  });
  factory System.fromJson(Map<String, dynamic> json) => System(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
