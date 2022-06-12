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
}
