import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/custom_widgets.dart';

import '../mock_classes/mock_routes.dart';

void main() {
  MockRoutes mockRoutes = MockRoutes();
  Widget buildWidget() {
    return MaterialApp(
      routes: mockRoutes.getRoutes(),
      home: const Scaffold(body: HomePage()),
    );
  }

  testWidgets('This test navigation to popular in the homepage',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    await tester.tap(find.byKey(const Key('popular_button')));
    await tester.pumpAndSettle();
    expect(find.text('mock popular navigation'), findsOneWidget);
  });
  testWidgets('This test navigation to top rated in the homepage',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    await tester.tap(find.byKey(const Key('top_rated_button')));
    await tester.pumpAndSettle();
    expect(find.text('mock top rated navigation'), findsOneWidget);
  });
  testWidgets('This test navigation to upcoming in the homepage',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    await tester.tap(find.byKey(const Key('upcoming_button')));
    await tester.pumpAndSettle();
    expect(find.text('mock upcoming navigation'), findsOneWidget);
  });
}
