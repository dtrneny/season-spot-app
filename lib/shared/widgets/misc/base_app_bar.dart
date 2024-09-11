import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leadingAction;
  final Widget trailingAction;

  const BaseAppBar({
    super.key,
    required this.leadingAction,
    required this.trailingAction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: leadingAction,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: trailingAction,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
