
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:season_spot/core/theming/index.dart';

class BaseIcon extends StatelessWidget {
  final AppIcons icon;
  final Color color;

  const BaseIcon({ super.key, required this.icon, required this.color });

  @override
  Widget build(BuildContext context){
    return SvgPicture.asset(
      icon.path,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}