import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';

import 'calculator_bloc.dart';
import 'calculator_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const MyHomePage(title: 'BlocWidget Demo'),
      home: const MySelectorHomePage(title: 'BlocSelectorWidget Demo'),
    );
  }
}

class MyConsumerHomePage extends BlocConsumerWidget<CalculatorBloc, BlocState> {
  const MyConsumerHomePage({super.key, required this.title});

  final String title;

  @override
  CalculatorBloc bloc(BuildContext context) => CalculatorBloc();

  @override
  void onMount(CalculatorBloc bloc) => bloc.add(CalculatorEvent.onMount);

  @override
  void listener(context, bloc, state) {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (state.counter == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Counter cleared')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Counter changed')),
    );
  }

  @override
  Widget build(context, bloc, state) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Counter value:'),
            Text('${state.counter}', style: textTheme.headlineMedium),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () => bloc.add(CalculatorEvent.remove),
              tooltip: 'Decrement',
              child: const Icon(Icons.exposure_minus_1),
            ),
            TextButton(
              onPressed: () => bloc.add(CalculatorEvent.clear),
              child: const Text('Clear counter'),
            ),
            FloatingActionButton(
              onPressed: () => bloc.add(CalculatorEvent.add),
              tooltip: 'Increment',
              child: const Icon(Icons.exposure_plus_1),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBuilderHomePage extends BlocBuilderWidget<CalculatorBloc, BlocState> {
  const MyBuilderHomePage({super.key, required this.title});

  final String title;

  @override
  CalculatorBloc bloc(BuildContext context) => CalculatorBloc();

  @override
  void onMount(CalculatorBloc bloc) => bloc.add(CalculatorEvent.onMount);

  @override
  Widget build(context, bloc, state) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Counter value:'),
            Text('${state.counter}', style: textTheme.headlineMedium),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () => bloc.add(CalculatorEvent.remove),
              tooltip: 'Decrement',
              child: const Icon(Icons.exposure_minus_1),
            ),
            TextButton(
              onPressed: () => bloc.add(CalculatorEvent.clear),
              child: const Text('Clear counter'),
            ),
            FloatingActionButton(
              onPressed: () => bloc.add(CalculatorEvent.add),
              tooltip: 'Increment',
              child: const Icon(Icons.exposure_plus_1),
            ),
          ],
        ),
      ),
    );
  }
}

class MySelectorHomePage
    extends BlocSelectorWidget<CalculatorCubit, CubitState, int> {
  const MySelectorHomePage({super.key, required this.title});

  final String title;

  @override
  CalculatorCubit bloc(BuildContext context) => CalculatorCubit();

  @override
  void onMount(CalculatorCubit bloc) => bloc.changeCounter(-1);

  @override
  int selector(CubitState state) => state.counter;

  @override
  Widget build(context, bloc, selector) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Counter value:'),
            Text('$selector', style: textTheme.headlineMedium),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () => bloc.changeCounter(selector - 1),
              tooltip: 'Decrement',
              child: const Icon(Icons.exposure_minus_1),
            ),
            TextButton(
              onPressed: () => bloc.changeCounter(0),
              child: const Text('Clear counter'),
            ),
            FloatingActionButton(
              onPressed: () => bloc.changeCounter(selector + 1),
              tooltip: 'Increment',
              child: const Icon(Icons.exposure_plus_1),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListenerHomePage
    extends BlocListenerWidget<CalculatorCubit, CubitState> {
  const MyListenerHomePage({super.key, required this.title});

  final String title;

  @override
  CalculatorCubit bloc(BuildContext context) => CalculatorCubit();

  @override
  void onMount(CalculatorCubit bloc) => bloc.changeCounter(-1);

  @override
  void listener(BuildContext context, CalculatorCubit bloc, CubitState state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Counter value: ${state.counter}')),
    );
  }

  @override
  Widget build(BuildContext context, CalculatorCubit bloc) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Click to show SnackBar with value')),
    );
  }
}
