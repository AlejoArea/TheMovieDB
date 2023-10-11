import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../custom_widgets.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({
    super.key,
    required this.releaseDate,
    required this.title,
    required this.originalTitle,
    required this.posterPath,
  });

  final String releaseDate;
  final String title;
  final String originalTitle;
  final String posterPath;
  static const String releaseDateText = 'Release date:';
  static const double subHeaderPadding = 30.0;

  @override
  Widget build(BuildContext context) {
    String date = releaseDate;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(subHeaderPadding),
      child: Row(
        children: [
          Expanded(
            flex: Constants.flexConst,
            child: TitleImage(posterPath: posterPath),
          ),
          Expanded(
            flex: Constants.flexConst,
            child: Column(
              children: [
                CustomTitle(movieTitle: title),
                GeneralText(
                    generalText: '$releaseDateText $date',
                    fontSize: Constants.smallTextFont),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
