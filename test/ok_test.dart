import 'package:rusty_result/rusty_result.dart';
import 'package:test/test.dart';

void main() {
  group('isOk', () {
    test('should return true', () {
        const Result<int, Exception> value = Ok(1);

        expect(value.isOk, true);
      });
  });
}
