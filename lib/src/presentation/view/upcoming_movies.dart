import 'package:flutter/material.dart';

import '../../core/state/state.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../bloc/i_bloc_genres.dart';
import '../bloc/i_bloc_upcoming.dart';
import '../widget/back_button.dart';
import '../widget/list_grid_upcoming.dart';

class UpcomingMovies extends StatefulWidget {
  const UpcomingMovies({
    super.key,
    required this.upcomingBloc,
    required this.genresBloc,
  });

  final IBlocUpcoming upcomingBloc;
  final IBlocGenres genresBloc;

  @override
  State<UpcomingMovies> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  late List<Movie> movieList;

  @override
  void initState() {
    super.initState();
    widget.upcomingBloc.getUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: StreamBuilder<DataState<List<Movie>>>(
        stream: widget.upcomingBloc.movies,
        initialData: DataState(state: DataEvents.loading),
        builder: (
          BuildContext context,
          AsyncSnapshot<DataState<List<Movie>>> snapshot,
        ) {
          switch (snapshot.data?.state) {
            case DataEvents.success:
              movieList = snapshot.data!.data!;
              return GridListUpcoming(
                movieList: movieList,
                blocGenres: widget.genresBloc,
              );
            case DataEvents.error:
              return Center(child: Text('${Constants.dataStateError} ${snapshot.data?.error}'));
            case DataEvents.empty:
              return const Center(child: Text(Constants.noResultsFound));
            case DataEvents.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return const Center(child: Text(Constants.somethingWentWrong));
          }
        },
      ),
    );
  }
}
