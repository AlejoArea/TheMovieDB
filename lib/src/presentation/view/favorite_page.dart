import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/state/state.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../bloc/i_bloc_movies.dart';
import '../custom_widgets.dart';
import '../widget/favorite_list.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late List<Movie> movieList;
  static const String titleFavorite = 'Favorite Page';

  @override
  void didChangeDependencies() {
    Provider.of<IBlocMovies>(
      context,
      listen: false,
    ).getFavorite();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: const CustomBackButton(),
      appBar: const CustomAppBar(title: titleFavorite),
      drawer: const CustomDrawer(),
      body: StreamBuilder<DataState<List<Movie>>>(
        initialData: DataState(state: DataEvents.loading),
        stream: Provider.of<IBlocMovies>(context).movies,
        builder: (
          BuildContext context,
          AsyncSnapshot<DataState<List<Movie>>> snapshot,
        ) {
          switch (snapshot.data?.state) {
            case DataEvents.success:
              movieList = snapshot.data!.data!;
              return ListFavorite(movieList: movieList);
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
