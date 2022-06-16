import 'package:mocktail/mocktail.dart';
import 'package:rusty_result/rusty_result.dart';
import 'package:rusty_result/src/errors.dart';
import 'package:test/test.dart';

import 'helpers.dart';

void main() {
  group('isOk', () {
    test('shoud return false', () {
      final e = Exception('error');
      final Result<int, Exception> err = Err(e);

      expect(err.isOk, false);
    });
  });

  group('isErr', () {
    test('shoud return true', () {
      final e = Exception('error');
      final Result<int, Exception> err = Err(e);

      expect(err.isErr, true);
    });
  });

  group('==', () {
    test('should be equal', () {
      expect(const Err(1), const Err(1));
      expect(const Err('abc'), const Err('abc'));
      expect(const Err(false), const Err(false));
    });

    test('should be not equal', () {
      expect(const Err(1) != const Err(2), true);
      expect(const Err('a') != const Err('abc'), true);
      expect(const Err(true) != const Err(false), true);
    });
  });

  group('hashCode', () {
    test('should return same hashCode as value as other instance', () {
      expect(const Err(1).hashCode, const Err(1).hashCode);
      expect(const Err('abc').hashCode, const Err('abc').hashCode);
    });
  });

  group('unwrap', () {
    test('should throw', () {
      final value = Err(Exception(''));

      expect(value.unwrap, throwsA(isA<ErrUnwrappedError>()));
    });
  });

  group('unwrapOr', () {
    test('should return unwrapped value', () {
      final value = Err(Exception(''));

      expect(value.unwrapOr(2), 2);
    });
  });

  group('unwrapOrElse', () {
    test('should return unwrapped value', () {
      final value = Err(Exception(''));
      final mockedGetValue = MockedGetValue<int>();
      when(() => mockedGetValue.call()).thenReturn(2);

      expect(value.unwrapOrElse(mockedGetValue.call), 2);

      verify(() => mockedGetValue.call()).called(1);
    });
  });

  group('unwrapErr', () {
    test('should return error', () {
      expect(const Err(1).unwrapErr(), 1);
    });
  });

  group('ok', () {
    test('should return null', () {
      expect(const Err(1).ok, null);
    });
  });

  group('err', () {
    test('should return error', () {
      expect(const Err(1).err, 1);
    });
  });

  group('inspectOk', () {
    test('should do nothing', () {
      const value = Err(1);
      final valueChanged = MockedValueChanged();

      final result = value.inspectOk(valueChanged.call);
      expect(result, value);
      verifyNever(() => valueChanged.call(any));
    });
  });

  group('inspectErr', () {
    test('should call given function', () {
      const value = Err(1);
      final valueChanged = MockedValueChanged<int>();
      when(() => valueChanged.call(any())).thenReturn(null);

      final result = value.inspectErr(valueChanged.call);
      expect(result, value);
      verify(() => valueChanged.call(1)).called(1);
    });
  });

  group('mapOn', () {
    test('chould do nothing', () {
      const error = Err(1);
      expect(error.mapOk((v) => v.toString()), error);
    });
  });

  group('mapErr', () {
    test('should map int to string', () {
      const error = Err(1);
      expect(error.mapErr((v) => v.toString()), const Err('1'));
    });
  });

  group('iterator', () {
    test('should return empty iterator', () {
      expect([...const Err<int, int>(1)], const <int>[]);
    });
  });

  group('and', () {
    test('should return error', () {
      const error = Err('1');
      expect(error.and(const Ok(1)), error);
    });
  });

  group('or', () {
    test('should return value pased as method argument', () {
      const error = Err(1);
      expect(error.or(const Ok('2')), const Ok('2'));
      expect(error.or(const Err('2')), const Err('2'));
    });
  });
}
