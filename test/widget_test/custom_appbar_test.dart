import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/widget/custom_app_bar.dart';

void main() {
  const String title = 'Test title';
  Widget buildWidget() {
    return const MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(title: title),
        body: Placeholder(),
      ),
    );
  }

  testWidgets('This test finds 1 widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byType(CustomAppBar), findsOneWidget);
  });
  testWidgets('This test checks the appbar title', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    final CustomAppBar appBar = tester.widget(find.byType(CustomAppBar));
    expect(appBar.title, equals(title));
  });
}
