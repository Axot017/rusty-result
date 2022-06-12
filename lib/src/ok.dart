part of 'result.dart';

class Ok<OK, ERR> implements Result<OK, ERR> {
  const Ok(this.value);

  final OK value;

  @override
  bool get isOk => true;
}
