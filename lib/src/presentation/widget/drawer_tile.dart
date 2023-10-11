import 'package:flutter/material.dart';

import '../custom_widgets.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.title,
    required this.navigationRoute,
    required this.icon,
  });

  final String title;
  final String navigationRoute;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: GeneralText(generalText: title),
      onTap: () {
        Navigator.pushNamed(
          context,
          navigationRoute,
        );
      },
    );
  }
}
