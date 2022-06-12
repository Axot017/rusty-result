import 'package:rusty_result/rusty_result.dart';
import 'package:test/test.dart';

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
      expect(const Err(1), isNot(const Err(2)));
      expect(const Err('a'), isNot(const Err('abc')));
      expect(const Err(true), isNot(const Err(false)));
    });
  });

  group('hashCode', () {
    test('should return same hashCode as value', () {
      expect(const Err(1).hashCode, 1.hashCode);
      expect(const Err('abc').hashCode, 'abc'.hashCode);
    });

    test('should return same hashCode as value as other instance', () {
      expect(const Err(1).hashCode, const Err(1).hashCode);
      expect(const Err('abc').hashCode, const Err('abc').hashCode);
    });
  });
}
