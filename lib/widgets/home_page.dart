import 'package:flutter/material.dart';

import '../constants.dart';
import '../custom_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Constants.titleApp,
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: MovieList(),
      ),
    );
  }
}
