import 'package:bloc_consumer_widget/bloc_consumer_widget.dart';
import 'package:flutter/material.dart';

import 'calculator_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'BlocHookedWidget Demo'),
    );
  }
}

class MyHomePage extends BlocConsumerWidget<CalculatorBloc, CalculatorState> {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  CalculatorBloc? bloc(BuildContext context) => CalculatorBloc();

  @override
  void onMount(CalculatorBloc bloc) {
    bloc.add(CalculatorEvent.onMount);
  }

  @override
  Widget buildWithState(context, bloc, state) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${state.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
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
