import 'package:solari/core/enums/panel_status.dart';

class PanelDetailsResponse {
  final int status;
  final String? message;
  final Data data;

  PanelDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PanelDetailsResponse.fromJson(Map<String, dynamic> json) =>
      PanelDetailsResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final int id;
  final int systemId;
  final String name;
  final PanelStatus status;
  final String current;
  final String voltage;
  final String power;
  final String todayEnergy;
  final List<Fault>? faults;
  final num waterLevel;
  final DateTime nextCleaningTime;

  Data({
    required this.id,
    required this.systemId,
    required this.name,
    required this.status,
    required this.current,
    required this.voltage,
    required this.power,
    required this.todayEnergy,
    required this.faults,
    required this.waterLevel,
    required this.nextCleaningTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        systemId: json["system_id"],
        name: json["name"],
        status: PanelStatus.fromStringKey(json["status"] ?? "Healthy"),
        current: json["current"],
        voltage: json["voltage"],
        power: json["power"],
        todayEnergy: json["today_energy"],
        faults: json["faults"] == null
            ? null
            : List<Fault>.from(json["faults"].map((x) => Fault.fromJson(x))),
        waterLevel: json["water_level"],
        nextCleaningTime: DateTime.parse(json["next_cleaning_time"]),
      );
}

class Fault {
  final String title;
  final String desc;

  Fault({
    required this.title,
    required this.desc,
  });

  factory Fault.fromJson(Map<String, dynamic> json) => Fault(
        title: json["title"],
        desc: json["desc"],
      );
}
