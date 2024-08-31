
import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Center(
          child: IconButton(
            icon: BaseIcon(
              icon: AppIcons.burger,
              color: context.theme.base.secondaryColor
            ),
            onPressed: () {},
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: BaseIcon(
              icon: AppIcons.bell,
              color: context.theme.base.secondaryColor
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}