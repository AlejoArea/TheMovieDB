import 'package:flutter/cupertino.dart';

class MockRoutes {
  MockRoutes();

  Map<String, Widget Function(BuildContext)> getRoutes() {
    return <String, Widget Function(BuildContext)>{
      '/home_page': (context) => const Text('mock homepage navigation'),
      '/popular': (context) => const Text('mock popular navigation'),
      '/top_rated': (context) => const Text('mock top rated navigation'),
      '/upcoming': (context) => const Text('mock upcoming navigation'),
    };
  }
}
