import 'package:bloc_hooked_widget/bloc_hooked_widget.dart';
import 'package:flutter/material.dart';

import 'test_bloc.dart';

class TestBlocWidget extends BlocHookedWidget<TestBloc, TestState> {
  TestBlocWidget({Key? key}) : super(key: key);

  @override
  TestBloc? bloc(BuildContext context) => TestBloc();

  @override
  void onMount(TestBloc bloc) => bloc.add(TestEvent.onMount);

  @override
  Widget buildWithState(BuildContext context, TestBloc bloc, TestState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlocHookedWidget counter')),
      body: Center(child: Text('Counter: ${state.counter}')),
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(
            onPressed: () => bloc.add(TestEvent.add),
            child: const Text('+'),
          ),
          ElevatedButton(
            onPressed: () => bloc.add(TestEvent.remove),
            child: const Text('-'),
          ),
          ElevatedButton(
            onPressed: () => bloc.add(TestEvent.clear),
            child: const Text('Clear'),
          )
        ],
      ),
    );
  }
}
