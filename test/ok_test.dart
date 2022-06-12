import 'package:rusty_result/rusty_result.dart';
import 'package:test/test.dart';

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
      expect(const Ok('a'), isNot(const Ok('abc')));
      expect(const Ok(true), isNot(const Ok(false)));
    });
  });

  group('hashCode', () {
    test('should return same hashCode as value', () {
      expect(const Ok(1).hashCode, 1.hashCode);
      expect(const Ok('abc').hashCode, 'abc'.hashCode);
    });

    test('should return same hashCode as value as other instance', () {
      expect(const Ok(1).hashCode, const Ok(1).hashCode);
      expect(const Ok('abc').hashCode, const Ok('abc').hashCode);
    });
  });
}
