import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_bloc_widget.dart';

void main() {
  Widget app() {
    return MaterialApp(
      title: 'Widget tests',
      home: TestBlocWidget(),
    );
  }

  testWidgets('Add +1', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    expect(find.text('Counter: -1'), findsOneWidget);

    await tester.tap(find.text('+'));
    await tester.pumpAndSettle();

    expect(find.text('Counter: 0'), findsOneWidget);
  });

  testWidgets('Add multiple +3', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    expect(find.text('Counter: -1'), findsOneWidget);

    await tester.tap(find.text('+'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('+'));
    await tester.pumpAndSettle();

    expect(find.text('Counter: 3'), findsOneWidget);
  });

  testWidgets('Reduce -1', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    expect(find.text('Counter: -1'), findsOneWidget);

    await tester.tap(find.text('-'));
    await tester.pumpAndSettle();

    expect(find.text('Counter: -2'), findsOneWidget);
  });

  testWidgets('Reduce multiple -3', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    expect(find.text('Counter: -1'), findsOneWidget);

    await tester.tap(find.text('-'));
    await tester.tap(find.text('-'));
    await tester.pumpAndSettle();

    expect(find.text('Counter: -3'), findsOneWidget);
  });

  testWidgets('Clear counter', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    expect(find.text('Counter: -1'), findsOneWidget);

    await tester.tap(find.text('Clear'));
    await tester.pumpAndSettle();

    expect(find.text('Counter: 0'), findsOneWidget);
  });
}
