
import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  
  const PrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: context.theme.base.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRounding.base),
        ),
        minimumSize: const Size.fromHeight(50),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppTypographySizing.base,
          fontWeight: FontWeight.w500,
        ),
        elevation: 0,
      ),
      child: child,
    );
  }
}