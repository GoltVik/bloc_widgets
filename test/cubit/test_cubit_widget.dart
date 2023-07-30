import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';

import 'test_cubit.dart';

class TestCubitWidget extends BlocConsumerWidget<TestCubit, TestState> {
  const TestCubitWidget({super.key});

  @override
  TestCubit bloc(BuildContext context) => TestCubit();

  @override
  void onMount(TestCubit bloc) => bloc.mount();

  @override
  Widget build(BuildContext context, TestCubit bloc, TestState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlocWidget counter')),
      body: Center(child: Text('Counter: ${state.counter}')),
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(onPressed: bloc.increment, child: const Text('+')),
          ElevatedButton(onPressed: bloc.decrement, child: const Text('-')),
          ElevatedButton(onPressed: bloc.clear, child: const Text('Clear'))
        ],
      ),
    );
  }
}
