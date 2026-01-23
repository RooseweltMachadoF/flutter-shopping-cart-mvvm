sealed class Result<S, E extends Exception> {
  const Result();
}

class Success<S, E extends Exception> extends Result<S, E> {
  final S value;
  const Success(this.value);
}

class Failure<S, E extends Exception> extends Result<S, E> {
  final E exception;
  const Failure(this.exception);
}