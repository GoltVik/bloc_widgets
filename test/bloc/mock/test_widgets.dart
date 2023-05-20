import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';

import 'test_bloc.dart';

class TestBlocBuilderWidget extends BlocBuilderWidget<TestBloc, TestState> {
  final bool invokeOnMount;
  final bool showOnlyPositive;

  const TestBlocBuilderWidget({
    super.key,
    this.invokeOnMount = true,
    this.showOnlyPositive = false,
  });

  @override
  TestBloc? bloc(BuildContext context) => TestBloc();

  @override
  void onMount(TestBloc bloc) {
    if (invokeOnMount) bloc.add(TestEvent.onMount);
  }

  @override
  bool buildWhen(TestState prev, TestState next) {
    return showOnlyPositive ? next.counter >= 0 : true;
  }

  @override
  Widget buildWithState(BuildContext context, TestBloc bloc, TestState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlocWidget counter')),
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

class TestBlocConsumerWidget extends BlocConsumerWidget<TestBloc, TestState> {
  final bool invokeOnMount;
  final bool showOnlyPositive;
  final bool ignoreListener;

  const TestBlocConsumerWidget({
    super.key,
    this.invokeOnMount = true,
    this.showOnlyPositive = false,
    this.ignoreListener = false,
  });

  @override
  TestBloc? bloc(BuildContext context) => TestBloc();

  @override
  void onMount(TestBloc bloc) {
    if (invokeOnMount) bloc.add(TestEvent.onMount);
  }

  @override
  bool buildWhen(TestState prev, TestState next) {
    return showOnlyPositive ? next.counter >= 0 : true;
  }

  @override
  bool listenWhen(TestState prev, TestState next) {
    return !ignoreListener;
  }

  @override
  void listener(BuildContext context, TestBloc bloc, TestState state) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text('Updated: ${state.counter}')));
  }

  @override
  Widget buildWithState(BuildContext context, TestBloc bloc, TestState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlocWidget counter')),
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

class TestBlocSelectorWidget
    extends BlocSelectorWidget<TestBloc, TestState, int> {
  final bool invokeOnMount;

  const TestBlocSelectorWidget({super.key, this.invokeOnMount = true});

  @override
  TestBloc? bloc(BuildContext context) => TestBloc();

  @override
  void onMount(TestBloc bloc) {
    if (invokeOnMount) bloc.add(TestEvent.onMount);
  }

  @override
  Widget buildWithState(BuildContext context, TestBloc bloc, int state) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlocWidget counter')),
      body: Center(child: Text('Counter: $state')),
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

  @override
  int selector(TestBloc cubit, TestState state) => state.counter;
}
