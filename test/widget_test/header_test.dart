import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/custom_widgets.dart';
import 'package:themoviedb/src/presentation/widget/cached_image.dart';

void main() {
  const String path = 'Mock MovieBackdrop';
  Widget buildWidget() {
    return const MaterialApp(
      home: Scaffold(body: Header(backdropPath: path)),
    );
  }

  testWidgets('This test verifies if Header has the correct backdrop path', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byType(CachedImageCustom), findsOneWidget);
    final Header header =
    tester.widget((find.byType(Header)));
    expect(header.backdropPath, equals(path));
  });
}
