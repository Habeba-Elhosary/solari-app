import 'package:solari/features/panels/domain/entities/panel_details_response.dart';

class PanelFaultsResponse {
  final int status;
  final String? message;
  final List<Fault> data;

  PanelFaultsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PanelFaultsResponse.fromJson(Map<String, dynamic> json) =>
      PanelFaultsResponse(
        status: json["status"],
        message: json["message"],
        data: List<Fault>.from(json["data"].map((x) => Fault.fromJson(x))),
      );
}
