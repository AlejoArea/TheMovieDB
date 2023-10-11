import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import 'cached_image.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  static const String theMovieDBPoster =
      'https://play-lh.googleusercontent.com/XXqfqs9irPSjphsMPcC-c6Q4-FY5cd8klw4IdI2lof_Ie-yXaFirqbNDzK2kJ808WXJk';
  static const String popularText = 'Popular';
  static const String upcomingText = 'Upcoming';
  static const String topRatedText = 'Top rated';
  static const double opacity = 0.7;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(Constants.generalPadding),
          children: const [
            DrawerHeader(child: CachedImageCustom(url: theMovieDBPoster)),
            DrawerTile(
              title: Constants.homePageTitle,
              navigationRoute: Constants.navigationRouteHome,
              icon: Icons.home,
            ),
            DrawerTile(
              title: popularText,
              navigationRoute: Constants.navigationRoutePopular,
              icon: Icons.star,
            ),
            DrawerTile(
              title: upcomingText,
              navigationRoute: Constants.navigationRouteUpcoming,
              icon: Icons.upcoming,
            ),
            DrawerTile(
              title: topRatedText,
              navigationRoute: Constants.navigationRouteTopRated,
              icon: Icons.movie_creation_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
