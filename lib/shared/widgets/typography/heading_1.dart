
import 'package:flutter/widgets.dart';
import 'package:season_spot/core/theming/index.dart';

class Heading1 extends StatelessWidget {
  final String title;

  const Heading1({ super.key, required this.title });

  @override
  Widget build(BuildContext context){
    return Text(
      title,
      style: TextStyle(
        fontSize: AppTypographySizing.large,
        color: context.theme.base.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
