import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/panels/domain/entities/all_panels_response.dart';
import 'package:solari/features/panels/domain/entities/panel_details_response.dart';
import 'package:solari/features/panels/domain/entities/panel_faults_response.dart';

abstract class PanelsRepository {
  Future<Either<Failure, AllPanelsResponse>> getAllPanels(int systemId);
  Future<Either<Failure, PanelDetailsResponse>> getPanelDetails(int panelId);
  Future<Either<Failure, PanelFaultsResponse>> getPanelFaults(int panelId);
}
