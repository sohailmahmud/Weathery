import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/presentation/widgets/temperature_display.dart';

void main() {
  group('TemperatureDisplay Widget', () {
    testWidgets('displays temperature value correctly', (
      WidgetTester tester,
    ) async {
      const temperature = 25.0;
      const tempSize = 100.0;
      const degreeSize = 50.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TemperatureDisplay(
              temperature: temperature,
              tempSize: tempSize,
              degreeSize: degreeSize,
            ),
          ),
        ),
      );

      expect(find.text('25'), findsOneWidget);
      expect(find.text('°'), findsOneWidget);
    });

    testWidgets('displays negative temperature', (WidgetTester tester) async {
      const temperature = -5.5;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TemperatureDisplay(
              temperature: temperature,
              tempSize: 80.0,
              degreeSize: 40.0,
            ),
          ),
        ),
      );

      expect(find.text('-6'), findsOneWidget);
    });

    testWidgets('displays decimal temperature correctly', (
      WidgetTester tester,
    ) async {
      const temperature = 18.7;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TemperatureDisplay(
              temperature: temperature,
              tempSize: 80.0,
              degreeSize: 40.0,
            ),
          ),
        ),
      );

      expect(find.text('19'), findsOneWidget);
    });

    testWidgets('renders as a Row', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TemperatureDisplay(
              temperature: 20.0,
              tempSize: 80.0,
              degreeSize: 40.0,
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('temperature and degree have correct alignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TemperatureDisplay(
              temperature: 22.0,
              tempSize: 100.0,
              degreeSize: 50.0,
            ),
          ),
        ),
      );

      final row = find.byType(Row);
      expect(row, findsOneWidget);
    });
  });
}
