import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.8), // Overlay color
      child: Center(
        child: CircularProgressIndicator(
          color: context.theme.base.primaryColor,
        ),
      ),
    );
  }
}
