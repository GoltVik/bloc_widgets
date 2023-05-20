import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class CubitState {
  final int counter;

  const CubitState(this.counter);
}

class CalculatorCubit extends Cubit<CubitState> {
  int _counter = 0;

  CalculatorCubit() : super(const CubitState(0));

  void changeCounter(int value) {
    _counter = value;
    emit.call(CubitState(_counter));
  }
}
