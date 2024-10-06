import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:season_spot/core/theming/index.dart';

class BaseIcon extends StatelessWidget {
  final AppIcons icon;
  final Color color;
  final double? size;

  const BaseIcon({
    super.key,
    required this.icon,
    required this.color,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        icon.path,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        width: size,
        height: size,
      ),
    );
  }
}
