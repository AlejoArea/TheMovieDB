import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/widget/title_text.dart';

void main() {
  Widget buildWidget() {
    return const MaterialApp(
        home: Scaffold(body: CustomTitleText(titleText: 'Test Title')));
  }

  testWidgets('This test verifies the title text', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.text('Test Title'), findsOneWidget);
  });
}
