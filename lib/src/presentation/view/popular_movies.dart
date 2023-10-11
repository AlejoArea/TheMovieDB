import 'package:flutter/material.dart';

import '../../core/state/state.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../bloc/i_bloc_genres.dart';
import '../bloc/i_bloc_popular.dart';
import '../widget/back_button.dart';
import '../widget/custom_drawer.dart';
import '../widget/list_popular.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({
    super.key,
    required this.popularBloc,
    required this.genresBloc,
  });

  final IBlocPopular popularBloc;
  final IBlocGenres genresBloc;

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  void initState() {
    super.initState();
    widget.popularBloc.getPopularMovies();
  }

  late List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: const CustomBackButton(),
      appBar: AppBar(
        title: const Text(Constants.popularMovieText),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: StreamBuilder<DataState<List<Movie>>>(
          initialData: DataState(state: DataEvents.loading),
          stream: widget.popularBloc.movies,
          builder: (
            BuildContext context,
            AsyncSnapshot<DataState<List<Movie>>> snapshot,
          ) {
            switch (snapshot.data?.state) {
              case DataEvents.success:
                movieList = snapshot.data!.data!;
                return ListPopular(
                  movieList: movieList,
                  blocGenres: widget.genresBloc,
                );
              case DataEvents.error:
                return Center(
                    child: Text(
                        '${Constants.dataStateError}${snapshot.data?.error}'));
              case DataEvents.empty:
                return const Center(child: Text(Constants.noResultsFound));
              case DataEvents.loading:
                return const Center(child: CircularProgressIndicator());
              default:
                return const Center(child: Text(Constants.somethingWentWrong));
            }
          }),
    );
  }
}
