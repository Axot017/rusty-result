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
}
