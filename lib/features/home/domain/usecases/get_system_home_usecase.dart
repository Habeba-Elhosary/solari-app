import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/home/domain/entities/get_system_home_response.dart';
import 'package:solari/features/home/domain/repositories/home_repository.dart';

class GetSystemHome extends UseCase<GetSystemHomeResponse, int> {
  final HomeRepository repository;

  GetSystemHome({required this.repository});
  @override
  Future<Either<Failure, GetSystemHomeResponse>> call(int params) =>
      repository.getSystemHome(systemId: params);
}
