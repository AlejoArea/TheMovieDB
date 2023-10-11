import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/util/ui_constants.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_genres.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_popular.dart';
import 'package:themoviedb/src/presentation/view/popular_movies.dart';
import 'package:themoviedb/src/presentation/widget/list_popular.dart';

import '../mock_classes/mock_bloc_genre.dart';
import '../mock_classes/mock_bloc_popular.dart';

void main() {
  IBlocGenres blocGenres = MockBlocGenres();
  IBlocPopular blocPopSuccess = MockBlocPopularSuccess();
  IBlocPopular blocPopEmpty = MockBlocPopularEmpty();
  IBlocPopular blocPopError = MockBlocPopularFailed();
  IBlocPopular blocPopLoading = MockBlocPopularLoading();

  Widget buildWidget({required Widget child}) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('this test checks for a movie list when its a success state',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget(
        child: PopularMovies(
      popularBloc: blocPopSuccess,
      genresBloc: blocGenres,
    )));
    await tester.pump();
    expect(find.byType(ListPopular), findsOneWidget);
  });
  testWidgets('this test checks for empty state', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget(
        child: PopularMovies(
      popularBloc: blocPopEmpty,
      genresBloc: blocGenres,
    )));
    await tester.pump();
    expect(find.text(Constants.noResultsFound), findsOneWidget);
  });
  testWidgets('this test checks for loading state',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget(
        child: PopularMovies(
      popularBloc: blocPopLoading,
      genresBloc: blocGenres,
    )));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  testWidgets('this test checks for error state', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget(
        child: PopularMovies(
      popularBloc: blocPopError,
      genresBloc: blocGenres,
    )));
    await tester.pump();
    expect(find.textContaining('mock error'), findsOneWidget);
  });
}
