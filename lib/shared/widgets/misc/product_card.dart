import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/misc/base_chip.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String category;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRounding.medium),
        child: Stack(
          children: [
            _buildBackground(),
            _buildCardContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppTypographySizing.medium,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppTypographySizing.small,
            ),
          ),
          const SizedBox(height: AppPadding.p16),
          BaseChip(label: category),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return ShaderMask(
      shaderCallback: (bound) => LinearGradient(
          end: FractionalOffset.topCenter,
          begin: FractionalOffset.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.transparent,
          ],
          stops: const [
            0.0,
            1
          ]).createShader(bound),
      blendMode: BlendMode.srcOver,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.maxFinite,
        height: double.maxFinite,
      ),
    );
  }
}
