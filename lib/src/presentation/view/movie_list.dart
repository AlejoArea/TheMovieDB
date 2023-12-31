import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/state/state.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../bloc/i_bloc_top_rated.dart';
import '../widget/back_button.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_drawer.dart';
import '../widget/list_top_rated.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late List<Movie> movieList;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<IBlocTopRated>(context).getTopRated();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: const CustomBackButton(),
      appBar: const CustomAppBar(title: Constants.topRatedMovieText),
      drawer: const CustomDrawer(),
      body: StreamBuilder<DataState<List<Movie>>>(
        initialData: DataState(state: DataEvents.loading),
        stream: Provider.of<IBlocTopRated>(context).movies,
        builder: (
          BuildContext context,
          AsyncSnapshot<DataState<List<Movie>>> snapshot,
        ) {
          switch (snapshot.data?.state) {
            case DataEvents.success:
              movieList = snapshot.data!.data!;
              return ListTopRated(movieList: movieList);
            case DataEvents.error:
              return Center(
                  child: Text(
                      '${Constants.dataStateError} ${snapshot.data?.error}'));
            case DataEvents.empty:
              return const Center(child: Text(Constants.noResultsFound));
            case DataEvents.loading:
              return const Center(child: CircularProgressIndicator());
            default:
              return const Center(child: Text(Constants.somethingWentWrong));
          }
        },
      ),
    );
  }
}
