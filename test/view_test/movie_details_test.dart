import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/domain/entity/movie.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_genres.dart';
import 'package:themoviedb/src/presentation/custom_widgets.dart';
import 'package:themoviedb/src/presentation/widget/title_text.dart';

import '../mock_classes/mock_bloc_genre.dart';

void main() {
  IBlocGenres blocGenres = MockBlocGenres();
  Movie movie = Movie.mockMovie();
  Widget buildWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MovieDetails(
          movie: movie,
          blocGenres: blocGenres,
        ),
      ),
    );
  }

  testWidgets('this test checks for every widget needed in the view',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());
    expect(find.byType(Genres), findsOneWidget);
    expect(find.byType(Rate), findsOneWidget);
    expect(find.byType(CustomTitleText), findsOneWidget);
    expect(find.byType(GeneralText), findsWidgets);
    expect(find.byType(SubHeader), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
