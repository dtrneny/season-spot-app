import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class PageFromLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const PageFromLayout({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        leading: IconButton(
          icon: BaseIcon(
            icon: AppIcons.arrowLeft,
            color: context.theme.base.secondaryColor,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppTypographySizing.medium,
                  color: context.theme.base.primaryColor),
            ),
            const SizedBox(height: AppPadding.p20),
            child,
          ],
        ),
      ),
    );
  }
}
