import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CalculatorEvent { onMount, add, remove, clear }

@immutable
class CalculatorState {
  final int counter;

  const CalculatorState(this.counter);
}

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  int _counter = 0;

  CalculatorBloc() : super(const CalculatorState(0)) {
    on<CalculatorEvent>((event, emit) {
      switch (event) {
        case CalculatorEvent.onMount:
          _counter = -1;
          break;

        case CalculatorEvent.add:
          _counter++;
          break;

        case CalculatorEvent.remove:
          _counter--;
          break;

        case CalculatorEvent.clear:
          _counter = 0;
          break;
      }
      emit.call(CalculatorState(_counter));
    });
  }
}
