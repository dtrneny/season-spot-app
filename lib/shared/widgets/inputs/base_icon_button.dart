import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class BaseIconButton extends StatelessWidget {
  const BaseIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: context.theme.base.primaryColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(AppPadding.p16),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: const BaseIcon(icon: AppIcons.search, color: Colors.white),
    );
  }
}
