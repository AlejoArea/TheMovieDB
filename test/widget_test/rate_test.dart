import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/custom_widgets.dart';
import 'package:themoviedb/src/presentation/widget/star_icon.dart';

void main() {
  Widget buildWidget() {
    return const MaterialApp(home: Scaffold(body: Rate(rate: 5)));
  }

  testWidgets('This test finds 5 widgets', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byType(StarIcon), findsNWidgets(5));
  });
  testWidgets('This test finds 2 full stars, 1 half star and 2 empty stars',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byIcon(Icons.star), findsNWidgets(2));
    expect(find.byIcon(Icons.star_border), findsNWidgets(2));
    expect(find.byIcon(Icons.star_half), findsOneWidget);
  });
}
