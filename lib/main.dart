import 'package:flutter/material.dart';

import 'src/config/route/app_routes.dart';
import 'src/config/theme/app_themes.dart';
import 'src/core/parameter/init_values.dart';
import 'src/core/util/notify_service.dart';
import 'src/core/util/ui_constants.dart';
import 'src/domain/entity/movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Movie movie = Movie.mockMovie();

  late InitCore _initCore;

  late Routes _routes;

  @override
  void initState() {
    super.initState();
    _routes = Routes();
    _initCore = InitCore();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _initCore.initialize(),
      builder: (
        BuildContext context,
        AsyncSnapshot<bool> snapshot,
      ) {
        if (snapshot.hasData) {
          return MaterialApp(
            theme: CustomTheme.theme,
            initialRoute: Constants.navigationRouteHome,
            routes: _routes.getRoutes(initCore: _initCore),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
