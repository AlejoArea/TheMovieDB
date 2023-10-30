import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_genres.dart';
import 'package:themoviedb/src/presentation/custom_widgets.dart';

import '../mock_classes/mock_bloc_genre.dart';

void main() {
  const List<int> genresId = [1, 2, 3];
  IBlocGenres mockBlocGenre = MockBlocGenres();
  Widget buildWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Provider(
          create: (_) => mockBlocGenre,
          child: const Genres(genresId: genresId),
        ),
      ),
    );
  }

  testWidgets('This test verifies genres list length',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();
    expect(find.byType(GeneralText), findsNWidgets(genresId.length));
  });

  testWidgets('This test verifies genres text', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();
    for (var index = 0; index < genresId.length; index++) {
      expect(find.byKey(Key('genre_text_key$index')), findsOneWidget);
    }
  });
}
