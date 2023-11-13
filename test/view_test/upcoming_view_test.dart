import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/src/core/util/ui_constants.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_movies.dart';
import 'package:themoviedb/src/presentation/view/upcoming_movies.dart';
import 'package:themoviedb/src/presentation/widget/list_grid_upcoming.dart';

import '../mock_classes/mock_bloc_movies.dart';

void main() {
  IBlocMovies blocUpcoSuccess = MockBlocMoviesSuccess();
  IBlocMovies blocUpcoEmpty = MockBlocMoviesEmpty();
  IBlocMovies blocUpcoError = MockBlocMoviesFailed();
  IBlocMovies blocUpcoLoading = MockBlocMoviesLoading();

  Widget buildWidget({required Widget child}) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  testWidgets('this test checks for a movie list when its a success state',
      (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
        create: (_) => blocUpcoSuccess,
        builder: (context, child) {
          return buildWidget(child: const UpcomingMovies());
        }));
    await tester.pump();
    expect(find.byType(GridListUpcoming), findsOneWidget);
  });
  testWidgets('this test checks for empty state', (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
        create: (_) => blocUpcoEmpty,
        builder: (context, child) {
          return buildWidget(child: const UpcomingMovies());
        }));
    await tester.pump();
    expect(find.text(Constants.noResultsFound), findsOneWidget);
  });
  testWidgets('this test checks for loading state',
      (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
        create: (_) => blocUpcoLoading,
        builder: (context, child) {
          return buildWidget(child: const UpcomingMovies());
        }));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  testWidgets('this test checks for error state', (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
        create: (_) => blocUpcoError,
        builder: (context, child) {
          return buildWidget(child: const UpcomingMovies());
        }));
    await tester.pump();
    expect(find.textContaining('mock error'), findsOneWidget);
  });
}
