import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CalculatorEvent { onMount, add, remove, clear }

@immutable
class BlocState {
  final int counter;

  const BlocState(this.counter);
}

class CalculatorBloc extends Bloc<CalculatorEvent, BlocState> {
  int _counter = 0;

  CalculatorBloc() : super(const BlocState(0)) {
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
      emit.call(BlocState(_counter));
    });
  }
}
