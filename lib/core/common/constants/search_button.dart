import 'package:flutter/material.dart';
import 'package:study_hall_project/core/constants/svg_image.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final Color backgroundColor;


  const SearchButton({
    super.key,
    this.onTap,
    this.size = 48,
    this.backgroundColor = const Color(0xFFFFFFFF), // light beige
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1,
                color: Color(0xFFE5E7EB)
            )
        ),
        child:  Center(
      child: AppSvg(
      asset: 'assets/icon/search.svg',
        width: 18,     // or 24-32, depending on your design
        height: 18,
        color: Color(0xFF6B7280),  // Important: dark color on white background
      ),
    ),
      ),
    );
  }
}
