
import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class BaseSidebarLink extends StatelessWidget {
  final AppIcons icon;
  final String label;
  final VoidCallback onPressed;
  final bool? isActive;

  const BaseSidebarLink({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRounding.base),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: context.theme.base.secondaryColor.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.only(left: AppPadding.p16, right: AppPadding.p16, top: 12, bottom: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                BaseIcon(
                  icon: icon,
                  color: isActive != null && isActive!
                    ? context.theme.base.primaryColor
                    : context.theme.base.secondaryColor,
                  width: 20.0,
                ),
                const SizedBox(width: AppPadding.p16),
                Text(
                  label,
                  style: TextStyle(
                    color: isActive != null && isActive!
                      ? context.theme.base.primaryColor
                      : context.theme.base.secondaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: AppTypographySizing.base
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}