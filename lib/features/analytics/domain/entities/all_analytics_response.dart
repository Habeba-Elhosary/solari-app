class AllAnalyticsResponse {
  final int status;
  final String message;
  final Data data;

  AllAnalyticsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllAnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      AllAnalyticsResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final List<dynamic> energiesChart;
  final num totalEnergyToday;
  final num precentageChange;
  final PowerChart powerChart;

  Data({
    required this.energiesChart,
    required this.totalEnergyToday,
    required this.precentageChange,
    required this.powerChart,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        energiesChart: List<dynamic>.from(json["energies_chart"].map((x) => x)),
        totalEnergyToday: json["total_energy_today"],
        precentageChange: json["precentage_change"],
        powerChart: PowerChart.fromJson(json["power_chart"]),
      );

  Map<String, dynamic> toJson() => {
        "energies_chart": List<dynamic>.from(energiesChart.map((x) => x)),
        "total_energy_today": totalEnergyToday,
        "precentage_change": precentageChange,
        "power_chart": powerChart.toJson(),
      };
}

class PowerChart {
  final List<Actual> actual;
  final List<Actual> expected;

  PowerChart({
    required this.actual,
    required this.expected,
  });

  factory PowerChart.fromJson(Map<String, dynamic> json) => PowerChart(
        actual:
            List<Actual>.from(json["actual"].map((x) => Actual.fromJson(x))),
        expected:
            List<Actual>.from(json["expected"].map((x) => Actual.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "actual": List<dynamic>.from(actual.map((x) => x.toJson())),
        "expected": List<dynamic>.from(expected.map((x) => x.toJson())),
      };
}

class Actual {
  final String x;
  final int y;

  Actual({
    required this.x,
    required this.y,
  });

  factory Actual.fromJson(Map<String, dynamic> json) => Actual(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
