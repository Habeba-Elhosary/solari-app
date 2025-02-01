import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';

class DeleteAccountUseCase extends UseCase<Unit, NoParams> {
  final AuthRepository authRepository;
  DeleteAccountUseCase({required this.authRepository});

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await authRepository.deleteAccount();
  }
}
