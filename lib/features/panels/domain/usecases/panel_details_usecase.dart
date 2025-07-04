import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/panels/domain/entities/panel_details_response.dart';
import 'package:solari/features/panels/domain/repositories/panels_repository.dart';

class PanelDetailsUsecase extends UseCase<PanelDetailsResponse, int> {
  final PanelsRepository repository;

  PanelDetailsUsecase({required this.repository});
  @override
  Future<Either<Failure, PanelDetailsResponse>> call(int params) =>
      repository.getPanelDetails(params);
}
