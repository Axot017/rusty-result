import 'package:mocktail/mocktail.dart';

abstract class GetValue<T>{
  T call();
}

class MockedGetValue<T> extends Mock implements GetValue<T> {}
