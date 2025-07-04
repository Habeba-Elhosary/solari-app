import 'package:solari/core/enums/panel_status.dart';

class AllPanelsResponse {
  final int status;
  final String? message;
  final Data data;

  AllPanelsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllPanelsResponse.fromJson(Map<String, dynamic> json) =>
      AllPanelsResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final int id;
  final String activeCells;
  final String temperature;
  final String trackingStatus;
  final List<Panel> cells;

  Data({
    required this.id,
    required this.activeCells,
    required this.temperature,
    required this.trackingStatus,
    required this.cells,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        activeCells: json["active_cells"],
        temperature: json["temperature"],
        trackingStatus: json["tracking_status"],
        cells: List<Panel>.from(json["cells"].map((x) => Panel.fromJson(x))),
      );
}

class Panel {
  final int id;
  final String name;
  final String todayEnergy;
  final PanelStatus status;

  Panel({
    required this.id,
    required this.name,
    required this.todayEnergy,
    required this.status,
  });

  factory Panel.fromJson(Map<String, dynamic> json) => Panel(
        id: json["id"],
        name: json["name"],
        todayEnergy: json["today_energy"],
        status: PanelStatus.fromStringKey(json["status"] ?? "Healthy"),
      );
}
