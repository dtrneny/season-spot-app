import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class BaseIconButton extends StatelessWidget {
  final AppIcons icon;
  final VoidCallback onPressed;

  const BaseIconButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: context.theme.base.primaryColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(AppPadding.p16),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: BaseIcon(icon: icon, color: Colors.white),
    );
  }
}
