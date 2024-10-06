import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class FullScreenOverlay extends StatelessWidget {
  final VoidCallback onBackButtonTap;
  final Widget child;

  const FullScreenOverlay({
    super.key,
    required this.onBackButtonTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 63.0,
        left: AppPadding.p4,
        right: AppPadding.p4,
        bottom: AppPadding.p60,
      ),
      color: context.theme.base.neutral100,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildBackHeader(context),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: child,
    );
  }

  Widget _buildBackHeader(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: BaseIcon(
          icon: AppIcons.arrowLeft,
          color: context.theme.base.secondaryColor,
        ),
        onPressed: onBackButtonTap,
      ),
    );
  }
}
