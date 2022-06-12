/// Error thrown when `.unwrap()` is called on Err type
class ErrUnwrappedError<T> extends Error {
  ErrUnwrappedError(this.error);

  final T error;
}

/// Error thrown when `.unwrapErr()` is called on Ok type
class OkUnwrappedError<T> extends Error {
  OkUnwrappedError(this.value);

  final T value;
}
