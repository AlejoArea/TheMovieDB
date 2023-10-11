import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_drawer.dart';
import '../widget/home_page_button.dart';
import '../widget/title_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double sizedBoxHeight = 30;

  static const String popularButtonKey = 'popular_button';
  static const String topRatedButtonKey = 'top_rated_button';
  static const String upcomingButtonKey = 'upcoming_button';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: Constants.titleApp),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CustomTitleText(titleText: Constants.homePageTitle),
              SizedBox(height: sizedBoxHeight),
              CustomButtonHomepage(
                key: Key(popularButtonKey),
                navigationRoute: Constants.navigationRoutePopular,
                buttonText: Constants.popularMovieText,
              ),
              SizedBox(height: sizedBoxHeight),
              CustomButtonHomepage(
                key: Key(topRatedButtonKey),
                navigationRoute: Constants.navigationRouteTopRated,
                buttonText: Constants.topRatedMovieText,
              ),
              SizedBox(height: sizedBoxHeight),
              CustomButtonHomepage(
                key: Key(upcomingButtonKey),
                navigationRoute: Constants.navigationRouteUpcoming,
                buttonText: Constants.upcomingMovieText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
