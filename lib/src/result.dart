import 'dart:collection';

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
abstract class Result<OK, ERR> with IterableMixin<OK> {
  const Result();
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

  /// returns value if type is Ok or null if type is Err
  OK? get ok;

  /// returns error if type is Err or null if type is Ok
  ERR? get err;

  /// calls given [f] if type is Ok. Returns `this`
  Result<OK, ERR> inspectOk(void Function(OK) f);

  /// calls given [f] if type is Err. Returns `this`
  Result<OK, ERR> inspectErr(void Function(ERR) f);

  /// Transforms Result<T, E> into Result<U, E> by applying the provided function to the contained value of Ok and leaving Err unchanged
  Result<O, ERR> mapOk<O>(O Function(OK) f);

  /// Transforms Result<T, E> into Result<T, F> by applying the provided function to the contained value of Err and leaving Ok values unchanged
  Result<OK, E> mapErr<E>(E Function(ERR) f);

  /// Returns [other] if the result is Ok, otherwise returns the Err value of self
  Result<O, ERR> and<O>(Result<O, ERR> other);

  /// Returns [other] if the result is Err, otherwise returns the Ok value of self
  Result<OK, E> or<E>(Result<OK, E> other);

  /// Calls [f] if the result is Ok, otherwise returns the Err value of self
  Result<O, ERR> andThen<O>(Result<O, ERR> Function(OK) f);

  /// Calls [f] if the result is Err, otherwise returns the Ok value of self
  Result<OK, E> orElse<E>(Result<OK, E> Function(ERR) f);
}
