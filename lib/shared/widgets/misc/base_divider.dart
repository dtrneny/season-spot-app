
import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class BaseDivider extends StatelessWidget {
  final Color? color;
  final double? width;

  const BaseDivider({
    super.key,
    this.color = AppColors.neutral200,
    this.width
  });

  @override
  Widget build(BuildContext context){
    return Container(
      width: width ?? double.infinity,
      height: 1.5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1.5 / 2),
      ),
    );
  }
}