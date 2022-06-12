part 'ok.dart';
part 'err.dart';

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
}
