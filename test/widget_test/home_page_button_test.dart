import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/widget/home_page_button.dart';

void main() {
  Widget buildWidget() {
    return const MaterialApp(
      home: Scaffold(
          body: CustomButtonHomepage(
              navigationRoute: '/test_route', buttonText: 'Test button')),
    );
  }

  testWidgets('This test looks for 1 widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byType(CustomButtonHomepage), findsOneWidget);
  });
  testWidgets('This test checks navigation route and button text',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byType(CustomButtonHomepage), findsOneWidget);
    final CustomButtonHomepage buttonHomepage =
        tester.widget((find.byType(CustomButtonHomepage)));
    expect(buttonHomepage.navigationRoute, equals('/test_route'));
    expect(buttonHomepage.buttonText, equals('Test button'));
  });
}
