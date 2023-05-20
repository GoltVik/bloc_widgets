import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock/test_widgets.dart';

void main() {
  Widget app({bool invokeOnMount = true}) {
    return MaterialApp(
      title: 'Widget tests',
      home: TestBlocSelectorWidget(invokeOnMount: invokeOnMount),
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

  group('onMount', () {
    testWidgets('is triggered', (tester) async {
      await tester.pumpWidget(app(invokeOnMount: true));
      await tester.pumpAndSettle();

      expect(find.text('Counter: -1'), findsOneWidget);
    });

    testWidgets('is dismissed', (tester) async {
      await tester.pumpWidget(app(invokeOnMount: false));
      await tester.pumpAndSettle();

      expect(find.text('Counter: 0'), findsOneWidget);
    });
  });
}
