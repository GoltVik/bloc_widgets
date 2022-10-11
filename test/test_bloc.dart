import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TestEvent { onMount, add, remove, clear }

@immutable
class TestState {
  final int counter;

  const TestState(this.counter);
}

class TestBloc extends Bloc<TestEvent, TestState> {
  int _counter = 0;

  TestBloc() : super(const TestState(0)) {
    on<TestEvent>((event, emit) {
      switch (event) {
        case TestEvent.onMount:
          _counter = -1;
          break;

        case TestEvent.add:
          _counter++;
          break;

        case TestEvent.remove:
          _counter--;
          break;

        case TestEvent.clear:
          _counter = 0;
          break;
      }
      emit.call(TestState(_counter));
    });
  }
}
