part of 'result.dart';

class Ok<OK, ERR> implements Result<OK, ERR> {
  const Ok(this.value);

  final OK value;

  @override
  bool get isOk => true;

  @override
  bool get isErr => false;

  @override
  bool operator ==(Object other) {
    return other is Ok<OK, ERR> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode ^ _magic;

  @override
  OK unwrap() => value;

  @override
  OK unwrapOr(OK defaultValue) => value;

  @override
  OK unwrapOrElse(OK Function() getDefault) => value;

  @override
  ERR unwrapErr() => throw OkUnwrappedError(value);

  @override
  OK? get ok => value;

  @override
  ERR? get err => null;

  @override
  Result<OK, ERR> inspect(void Function(OK) f) {
    f(value);
    return this;
  }

  @override
  Result<OK, ERR> inspectErr(void Function(ERR) f) {
    return this;
  }

  @override
  Result<O, ERR> map<O>(O Function(OK) f) {
    return Ok(f(value));
  }
}
