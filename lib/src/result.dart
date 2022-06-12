import 'package:rusty_result/src/errors.dart';

part 'ok.dart';
part 'err.dart';

const _magic = 2137;

/// Result<OK, ERR> is the type used for declarating return type of function that can resolve with error.
///
/// It has 2 variants:
///
/// - Ok - representing success and containing value of typ [OK]
/// - Err - representing failure and containing error of typ [ERR]
abstract class Result<OK, ERR> {
  /// Return true if Result is Ok and false if Result is Err
  bool get isOk;

  /// Return true if Result is Err end false if result is Ok
  bool get isErr;

  /// Returns value or throws a `ErrUnwrappedError` when type is Err
  OK unwrap();

  /// Returns value or [defaultValue] if type is Err
  OK unwrapOr(OK defaultValue);

  /// Returns value or executes [getValue] and returns it's result if type is Err
  OK unwrapOrElse(OK Function() getDefault);

  /// returns error or throws `OkUnwrappedError` if type is Ok
  ERR unwrapErr();
}
