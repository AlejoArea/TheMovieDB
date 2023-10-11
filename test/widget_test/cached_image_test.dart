import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/presentation/widget/cached_image.dart';

void main() {
  Widget buildWidget() {
    return const MaterialApp(
      home: Scaffold(body: CachedImageCustom(url: 'mockUrl')),
    );
  }

  testWidgets('This test verifies the url of cachedImage',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    final CachedNetworkImage cachedNetworkImage =
        tester.widget((find.byType(CachedNetworkImage)));
    expect(cachedNetworkImage.imageUrl, equals('mockUrl'));
  });
}
