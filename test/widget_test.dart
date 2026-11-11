import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lim_calculator/main.dart';

void main() {
  testWidgets('Calculator initial UI smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    expect(find.text('My Calculator'), findsOneWidget);
    expect(find.text('BASIC CALCULATOR'), findsOneWidget);
    expect(find.text('Enter two numbers'), findsOneWidget);
    expect(find.text('RESULT'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Clear'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('−'), findsOneWidget);
    expect(find.text('×'), findsOneWidget);
    expect(find.text('÷'), findsOneWidget);
  });

  testWidgets('Performs addition, subtraction, multiplication, and division', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CalculatorApp());

    final firstField = find.widgetWithText(TextField, 'First Number');
    final secondField = find.widgetWithText(TextField, 'Second Number');

    // Test Addition: 12 + 8 = 20.0
    await tester.enterText(firstField, '12');
    await tester.enterText(secondField, '8');
    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('20.0'), findsOneWidget);
    expect(find.text('12.0 + 8.0'), findsOneWidget);

    // Test Subtraction: 12 - 8 = 4.0
    await tester.tap(find.text('−'));
    await tester.pump();

    expect(find.text('4.0'), findsOneWidget);
    expect(find.text('12.0 - 8.0'), findsOneWidget);

    // Test Multiplication: 12 * 8 = 96.0
    await tester.tap(find.text('×'));
    await tester.pump();

    expect(find.text('96.0'), findsOneWidget);
    expect(find.text('12.0 × 8.0'), findsOneWidget);

    // Test Division: 12 / 8 = 1.5
    await tester.tap(find.text('÷'));
    await tester.pump();

    expect(find.text('1.5'), findsOneWidget);
    expect(find.text('12.0 ÷ 8.0'), findsOneWidget);
  });

  testWidgets('Handles invalid input correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    final firstField = find.widgetWithText(TextField, 'First Number');
    final secondField = find.widgetWithText(TextField, 'Second Number');

    await tester.enterText(firstField, 'abc');
    await tester.enterText(secondField, '5');
    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('Invalid input'), findsOneWidget);
    expect(find.text('Please enter two valid numbers'), findsOneWidget);
  });

  testWidgets('Handles division by zero correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CalculatorApp());

    final firstField = find.widgetWithText(TextField, 'First Number');
    final secondField = find.widgetWithText(TextField, 'Second Number');

    await tester.enterText(firstField, '10');
    await tester.enterText(secondField, '0');
    await tester.tap(find.text('÷'));
    await tester.pump();

    expect(find.text('Cannot divide by zero'), findsOneWidget);
    expect(find.text('Please change the second number'), findsOneWidget);
  });

  testWidgets('Clears inputs and resets state', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    final firstField = find.widgetWithText(TextField, 'First Number');
    final secondField = find.widgetWithText(TextField, 'Second Number');

    await tester.enterText(firstField, '25');
    await tester.enterText(secondField, '5');
    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('30.0'), findsOneWidget);

    // Ensure Clear button is visible within scrollview and tap
    final clearButton = find.text('Clear');
    await tester.ensureVisible(clearButton);
    await tester.pumpAndSettle();

    await tester.tap(clearButton);
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Enter two numbers'), findsOneWidget);

    final firstFieldWidget = tester.widget<TextField>(firstField);
    final secondFieldWidget = tester.widget<TextField>(secondField);
    expect(firstFieldWidget.controller?.text, isEmpty);
    expect(secondFieldWidget.controller?.text, isEmpty);
  });

  testWidgets(
    'Renders properly without overflow on a narrow screen with long result',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(320 * 2.0, 600 * 2.0);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const CalculatorApp());

      final firstField = find.widgetWithText(TextField, 'First Number');
      final secondField = find.widgetWithText(TextField, 'Second Number');

      // Divide 10 by 3 gives 3.3333333333333335 (long result string)
      await tester.enterText(firstField, '10');
      await tester.enterText(secondField, '3');
      await tester.tap(find.text('÷'));
      await tester.pumpAndSettle();

      expect(find.text('3.3333333333333335'), findsOneWidget);
      expect(
        find.text('Created by: Earth Justin Lim\nCourse/Code: CCE106L(3447)'),
        findsOneWidget,
      );
    },
  );
}
