import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/presentation/widgets/white_text.dart';

void main() {
  group('WhiteText Widget', () {
    testWidgets('displays text correctly', (WidgetTester tester) async {
      const testText = 'Test Weather';

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: WhiteText(testText))),
      );

      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('applies correct styling', (WidgetTester tester) async {
      const testText = 'London';
      const testSize = 32.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WhiteText(testText, size: testSize, bold: true, opacity: 0.8),
          ),
        ),
      );

      final textWidget = find.byType(Text);
      expect(textWidget, findsOneWidget);

      final Text text = tester.widget(textWidget);
      expect(text.style?.fontSize, testSize);
      expect(text.style?.fontWeight, FontWeight.w600);
    });

    testWidgets('renders with default opacity', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: WhiteText('Test'))),
      );

      final textWidget = find.byType(Text);
      expect(textWidget, findsOneWidget);
    });

    testWidgets('supports both bold and non-bold text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                WhiteText('Bold Text', bold: true),
                WhiteText('Normal Text', bold: false),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(WhiteText), findsWidgets);
    });
  });
}
