import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/src/core/util/ui_constants.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_genres.dart';
import 'package:themoviedb/src/presentation/bloc/i_bloc_top_rated.dart';
import 'package:themoviedb/src/presentation/custom_widgets.dart';
import 'package:themoviedb/src/presentation/widget/list_top_rated.dart';

import '../mock_classes/mock_bloc_genre.dart';
import '../mock_classes/mock_bloc_top_rated.dart';

void main() {
  IBlocTopRated blocTopSuccess = MockBlocTopRatedSuccess();
  IBlocTopRated blocTopEmpty = MockBlocTopRatedEmpty();
  IBlocTopRated blocTopError = MockBlocTopRatedFailed();
  IBlocTopRated blocTopLoading = MockBlocTopRatedLoading();

  Widget buildWidget({required Widget child}) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }

  testWidgets('this test checks for a movie list when its a success state',
      (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
        create: (_) => blocTopSuccess,
        builder: (context, child) {
          return buildWidget(child: buildWidget(child: MovieList()));
        }));
    await tester.pump();
    expect(find.byType(ListTopRated), findsOneWidget);
  });
  testWidgets('this test checks for empty state', (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
        create: (_) => blocTopEmpty,
        builder: (context, child) {
          return buildWidget(child: buildWidget(child: MovieList()));
        }));
    await tester.pump();
    expect(find.text(Constants.noResultsFound), findsOneWidget);
  });
  testWidgets('this test checks for loading state',
      (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
        create: (_) => blocTopLoading,
        builder: (context, child) {
          return buildWidget(child: buildWidget(child: MovieList()));
        }));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  testWidgets('this test checks for error state', (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
        create: (_) => blocTopError,
        builder: (context, child) {
          return buildWidget(child: buildWidget(child: MovieList()));
        }));
    await tester.pump();
    expect(find.textContaining('mock error'), findsOneWidget);
  });
}
