import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/panels/domain/entities/all_panels_response.dart';
import 'package:solari/features/panels/domain/repositories/panels_repository.dart';

class AllPanelsUsecase extends UseCase<AllPanelsResponse, int> {
  final PanelsRepository repository;

  AllPanelsUsecase({required this.repository});
  @override
  Future<Either<Failure, AllPanelsResponse>> call(int params) =>
      repository.getAllPanels(params);
}
