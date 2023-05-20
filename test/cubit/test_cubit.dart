import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class TestState {
  final int counter;

  const TestState(this.counter);
}

class TestCubit extends Cubit<TestState> {
  int _counter = 0;

  TestCubit() : super(const TestState(0));

  void increment() {
    _counter++;
    _notify();
  }

  void decrement() {
    _counter--;
    _notify();
  }

  void clear() {
    _counter = 0;
    _notify();
  }

  void mount() => decrement();

  _notify() => emit(TestState(_counter));
}
