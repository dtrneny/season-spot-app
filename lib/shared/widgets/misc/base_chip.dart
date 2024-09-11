import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class BaseChip extends StatelessWidget {
  final String label;

  const BaseChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: const VisualDensity(horizontal: 0.0, vertical: -2),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: context.theme.base.primaryColor,
      shape: const StadiumBorder(
        side: BorderSide(style: BorderStyle.none),
      ),
    );
  }
}
