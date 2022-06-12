import 'package:mocktail/mocktail.dart';

abstract class GetValue<T> {
  T call();
}

class MockedGetValue<T> extends Mock implements GetValue<T> {}

abstract class ValueChanged<T> {
  void call(T value);
}

class MockedValueChanged<T> extends Mock implements ValueChanged<T> {}
