import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class IndicatorDots extends StatelessWidget {
  final int dotsCount;
  final int activeIndex;

  const IndicatorDots({
    super.key,
    required this.dotsCount,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotsCount, (index) {
        bool isActive = index == activeIndex;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: isActive ? 16.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: isActive
                ? context.theme.base.primaryColor
                : context.theme.base.neutral600,
            borderRadius: isActive ? BorderRadius.circular(8.0) : null,
            shape: isActive ? BoxShape.rectangle : BoxShape.circle,
          ),
        );
      }),
    );
  }
}
