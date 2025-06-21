import 'package:solari/core/enums/panel_status.dart';

class GetSystemHomeResponse {
  final int status;
  final String? message;
  final HomeSystemData data;

  GetSystemHomeResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetSystemHomeResponse.fromJson(Map<String, dynamic> json) =>
      GetSystemHomeResponse(
        status: json["status"],
        message: json["message"],
        data: HomeSystemData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class HomeSystemData {
  final String totalPower;
  final String totalDailyGeneration;
  final List<Cell> cells;
  final num temperature;
  final String systemTemperatureLabel;

  HomeSystemData({
    required this.totalPower,
    required this.totalDailyGeneration,
    required this.cells,
    required this.temperature,
    required this.systemTemperatureLabel,
  });

  factory HomeSystemData.fromJson(Map<String, dynamic> json) => HomeSystemData(
        totalPower: json["total_power"],
        totalDailyGeneration: json["total_daily_generation"],
        cells: List<Cell>.from(json["cells"].map((x) => Cell.fromJson(x))),
        temperature: json["temperature"],
        systemTemperatureLabel: json["system_temperature_label"],
      );

  Map<String, dynamic> toJson() => {
        "total_power": totalPower,
        "total_daily_generation": totalDailyGeneration,
        "cells": List<dynamic>.from(cells.map((x) => x.toJson())),
        "temperature": temperature,
        "system_temperature_label": systemTemperatureLabel,
      };
}

class Cell {
  final String name;
  final PanelStatus status;

  Cell({
    required this.name,
    required this.status,
  });

  factory Cell.fromJson(Map<String, dynamic> json) => Cell(
        name: json["name"],
        status: PanelStatus.fromStringKey(json["status"] ?? "Healthy"),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
      };
}
