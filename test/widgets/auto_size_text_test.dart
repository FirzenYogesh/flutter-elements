import 'package:elements/widgets/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget Contents (non-selectable)', (WidgetTester tester) async {
    String sampleText = "This is a sample text";
    await tester.pumpWidget(MaterialApp(home: AutoSizeText(sampleText)));
    final textFinder = find.text(sampleText);
    expect(textFinder, findsOneWidget);
  });

  testWidgets('Widget Contents (selectable)', (WidgetTester tester) async {
    String sampleText = "This is a sample text";
    await tester.pumpWidget(MaterialApp(
        home: AutoSizeText(
      sampleText,
      isSelectable: true,
    )));
    final textFinder = find.text(sampleText);
    expect(textFinder, findsOneWidget);
  });
}
