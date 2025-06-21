import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/home/domain/entities/get_system_home_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, GetSystemHomeResponse>> getSystemHome(
      {required int systemId});
}
