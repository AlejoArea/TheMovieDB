import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themoviedb/src/core/util/ui_constants.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_genres.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_upcoming.dart';
import 'package:themoviedb/src/presentation/view/upcoming_movies.dart';
import 'package:themoviedb/src/presentation/widget/list_grid_upcoming.dart';

import '../mock_classes/mock_bloc_genre.dart';
import '../mock_classes/mock_bloc_upcoming.dart';

void main() {
  IBlocGenres blocGenres = MockBlocGenres();
  IBlocUpcoming blocUpcoSuccess = MockBlocUpcomingSuccess();
  IBlocUpcoming blocUpcoEmpty = MockBlocUpcomingEmpty();
  IBlocUpcoming blocUpcoError = MockBlocUpcomingFailed();
  IBlocUpcoming blocUpcoLoading = MockBlocUpcomingLoading();

  Widget buildWidget({required Widget child}) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('this test checks for a movie list when its a success state',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget(
        child: UpcomingMovies(
      upcomingBloc: blocUpcoSuccess,
      genresBloc: blocGenres,
    )));
    await tester.pump();
    expect(find.byType(GridListUpcoming), findsOneWidget);
  });
  testWidgets('this test checks for empty state', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget(
        child: UpcomingMovies(
      upcomingBloc: blocUpcoEmpty,
      genresBloc: blocGenres,
    )));
    await tester.pump();
    expect(find.text(Constants.noResultsFound), findsOneWidget);
  });
  testWidgets('this test checks for loading state',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget(
        child: UpcomingMovies(
      upcomingBloc: blocUpcoLoading,
      genresBloc: blocGenres,
    )));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  testWidgets('this test checks for error state', (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget(
        child: UpcomingMovies(
      upcomingBloc: blocUpcoError,
      genresBloc: blocGenres,
    )));
    await tester.pump();
    expect(find.textContaining('mock error'), findsOneWidget);
  });
}
