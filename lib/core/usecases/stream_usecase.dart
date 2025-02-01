abstract class StreamUsecase<T, Params> {
  Stream<T> call(Params params);
}
