import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';

class AddPanel extends UseCase<Unit, AddPanelParams> {
  final ProfileRepository repository;

  AddPanel({required this.repository});
  @override
  Future<Either<Failure, Unit>> call(AddPanelParams params) =>
      repository.addPanel(params);
}
