import 'package:mocktail/mocktail.dart';
import 'package:rusty_result/rusty_result.dart';
import 'package:rusty_result/src/errors.dart';
import 'package:test/test.dart';

import 'helpers.dart';

void main() {
  group('isOk', () {
    test('should return true', () {
      const Result<int, Exception> value = Ok(1);

      expect(value.isOk, true);
    });
  });

  group('isErr', () {
    test('should return false', () {
      const Result<int, Exception> value = Ok(1);

      expect(value.isErr, false);
    });
  });

  group('==', () {
    test('should be equal', () {
      expect(const Ok(1), const Ok(1));
      expect(const Ok('abc'), const Ok('abc'));
      expect(const Ok(false), const Ok(false));
    });

    test('should be not equal', () {
      expect(const Ok(1), isNot(const Ok(2)));
      expect(const Ok(1), isNot(1));
      expect(const Ok('a'), isNot(const Ok('abc')));
      expect(const Ok(true), isNot(const Ok(false)));
    });
  });

  group('hashCode', () {
    test('should return same hashCode as value as other instance', () {
      expect(const Ok(1).hashCode, const Ok(1).hashCode);
      expect(const Ok('abc').hashCode, const Ok('abc').hashCode);
    });
  });

  group('unwrap', () {
    test('should return unwrapped value', () {
      const value = Ok(1);

      expect(value.unwrap(), 1);
    });
  });

  group('unwrapOr', () {
    test('should return unwrapped value', () {
      const value = Ok(1);

      expect(value.unwrapOr(2), 1);
    });
  });

  group('unwrapOrElse', () {
    test('should return unwrapped value', () {
      const value = Ok(1);
      final mockedGetValue = MockedGetValue<int>();

      expect(value.unwrapOrElse(mockedGetValue.call), 1);

      verifyNever(() => mockedGetValue.call());
    });
  });

  group('unwrapErr', () {
    test('should throw OkUnwrappedError', () {
      const value = Ok(1);

      expect(value.unwrapErr, throwsA(isA<OkUnwrappedError>()));
    });
  });
}
