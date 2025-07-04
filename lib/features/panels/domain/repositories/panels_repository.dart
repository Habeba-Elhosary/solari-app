import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/panels/domain/entities/all_panels_response.dart';

abstract class PanelsRepository {
  Future<Either<Failure, AllPanelsResponse>> getAllPanels(int systemId);
}
