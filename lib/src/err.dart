part of 'result.dart';

class Err<OK, ERR> implements Result<OK, ERR> {
  const Err(this.error);

  final ERR error;

  @override
  bool get isOk => false;

  @override
  bool get isErr => true;

  @override
  bool operator ==(Object other) {
    return other is Err<OK, ERR> && other.error == error;
  }

  @override
  int get hashCode => error.hashCode ^ _magic;

  @override
  OK unwrap() => throw ErrUnwrappedError(error);

  @override
  OK unwrapOr(OK defaultValue) => defaultValue;

  @override
  OK unwrapOrElse(OK Function() getDefault) => getDefault();

  @override
  ERR unwrapErr() => error;

  @override
  OK? get ok => null;

  @override
  ERR? get err => error;

  @override
  Result<OK, ERR> inspect(void Function(OK) f) {
    return this;
  }

  @override
  Result<OK, ERR> inspectErr(void Function(ERR) f) {
    f(error);
    return this;
  }
}
