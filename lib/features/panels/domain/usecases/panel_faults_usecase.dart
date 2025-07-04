import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/panels/domain/entities/panel_faults_response.dart';
import 'package:solari/features/panels/domain/repositories/panels_repository.dart';

class PanelFaultsUsecase extends UseCase<PanelFaultsResponse, int> {
  final PanelsRepository repository;
  PanelFaultsUsecase({required this.repository});

  @override
  Future<Either<Failure, PanelFaultsResponse>> call(int params) =>
      repository.getPanelFaults(params);
}
