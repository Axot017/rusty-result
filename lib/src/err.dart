part of 'result.dart';

class Err<OK, ERR> implements Result<OK, ERR> {
  const Err(this.error);

  final ERR error;

  @override
  bool get isOk => false;

  @override
  bool get isErr => true;
}
