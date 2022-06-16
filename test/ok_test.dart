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

  group('ok', () {
    test('should return value', () {
      expect(const Ok(1).ok, 1);
    });
  });

  group('err', () {
    test('should return null', () {
      expect(const Ok(1).err, null);
    });
  });

  group('inspectOk', () {
    test('should call given function', () {
      const value = Ok(1);
      final valueChanged = MockedValueChanged<int>();
      when(() => valueChanged.call(any())).thenReturn(null);

      final result = value.inspectOk(valueChanged.call);
      expect(result, value);
      verify(() => valueChanged.call(1)).called(1);
    });
  });

  group('inspectErr', () {
    test('should do nothing', () {
      const value = Ok(1);
      final valueChanged = MockedValueChanged();

      final result = value.inspectErr(valueChanged.call);
      expect(result, value);
      verifyNever(() => valueChanged.call(any));
    });
  });

  group('mapOk', () {
    test('should map int to string', () {
      const value = Ok(1);
      expect(value.mapOk((v) => v.toString()), const Ok('1'));
    });
  });

  group('mapErr', () {
    test('chould do nothing', () {
      const value = Ok(1);
      expect(value.mapErr((v) => v.toString()), value);
    });
  });

  group('iterator', () {
    test('should return iterable with one element', () {
      expect([...const Ok(1)], const [1]);
    });
  });

  group('and', () {
    test('should return value pased as method argument', () {
const value = Ok(1);
      expect(value.and(const Ok('2')), const Ok('2'));
      expect(value.and(const Err('2')), const Err('2'));

    });
  });
}
