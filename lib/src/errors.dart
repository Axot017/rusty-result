/// Error thrown when `.unwrap()` is called on Err type
class ErrUnwrappedError<T> extends Error {
  ErrUnwrappedError(this.error);

  final T error;
}
