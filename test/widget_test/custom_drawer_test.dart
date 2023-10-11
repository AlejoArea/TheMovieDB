import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/widget/custom_drawer.dart';

void main() {
  const numberOfDrawerTiles = 4;
  Widget buildWidget() {
    return const MaterialApp(
      home: Scaffold(body: CustomDrawer()),
    );
  }

  testWidgets('This test finds 4 widgets', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byType(ListTile), findsNWidgets(numberOfDrawerTiles));
  });
}
