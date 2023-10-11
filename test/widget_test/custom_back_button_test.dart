import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/widget/back_button.dart';

void main() {
  Widget buildWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: Placeholder(),
        floatingActionButton: CustomBackButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      ),
    );
  }

  testWidgets('This test looks for 1 widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byType(CustomBackButton), findsOneWidget);
  });
}
