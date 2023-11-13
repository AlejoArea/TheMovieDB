import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/notify_service.dart';
import '../../core/util/ui_constants.dart';
import '../../core/util/widget_keys.dart';
import '../bloc/i_bloc_movies.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.id,
    required this.movieTitle,
  });

  final int id;
  final String movieTitle;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late Future<bool?> favorite;
  late bool favoriteValue;
  late String bodyText;
  late String titleText;

  void changeFavorites(bool value) {
    bodyText = !value
        ? Constants.notificationAddFavoriteBodyText
        : Constants.notificationRemoveFavoriteBodyText;
    titleText = !value
        ? Constants.notificationAddFavoriteTitle
        : Constants.notificationRemoveFavoriteTitle;
    NotificationService().showNotification(
        title: titleText, body: '${widget.movieTitle}$bodyText');
    setState(() {
      Provider.of<IBlocMovies>(
        context,
        listen: false,
      ).changeFavoriteValue(
        widget.id,
        !value,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<IBlocMovies>(
          context,
          listen: false,
        ).isFavorite(widget.id),
        builder: (
          BuildContext build,
          AsyncSnapshot<bool?> snapshot,
        ) {
          favoriteValue = snapshot.data ?? false;
          return snapshot.hasData
              ? FloatingActionButton(
                  key: const Key(ConstantsKeys.floatingActionButtonKey),
                  onPressed: () => changeFavorites(favoriteValue),
                  backgroundColor: Colors.black,
                  child: Center(
                    child: Icon(
                      Icons.favorite_rounded,
                      color: favoriteValue ? Colors.red : Colors.white,
                      size: Constants.favButtonSize,
                    ),
                  ),
                )
              : const CircularProgressIndicator();
        });
  }
}
