import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:season_spot/core/theming/index.dart';

class DashboardInfoCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const DashboardInfoCard({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRounding.medium),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(
          AppRounding.medium,
        ),
        child: InkWell(
            borderRadius: BorderRadius.circular(
              AppRounding.medium,
            ),
            onTap: onPressed,
            child: _buildCardContent(context)),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: context.theme.base.primaryColor,
          height: 175,
        ),
        Positioned(
          top: -100,
          left: -50,
          right: -10,
          child: Transform.rotate(
            angle: 0.02,
            child: SvgPicture.asset(
              'assets/resources/card_background_lines.svg',
              fit: BoxFit.cover,
              height: 400,
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: child,
          ),
        ),
      ],
    );
  }
}
