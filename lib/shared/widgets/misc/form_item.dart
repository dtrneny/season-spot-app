
import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class FormItem extends StatelessWidget {
  final String label;
  final Widget child;
  
  const FormItem({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: context.theme.base.primaryColor,
            fontSize: AppTypographySizing.base,
          ),
        ),
        const SizedBox(height: AppPadding.p4),
        child,
      ],
    );
  }
}