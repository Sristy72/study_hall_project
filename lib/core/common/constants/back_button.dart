import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const CustomBackButton({
    super.key,
    this.onTap,
    this.size = 56,
    this.backgroundColor = const Color(0xFFFFFFFF), // light beige
    this.iconColor = const Color(0xFF1F2A44), // dark blue
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
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 22,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}


class CustomBackButton2 extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const CustomBackButton2({
    super.key,
    this.onTap,
    this.size = 40,
    this.backgroundColor = const Color(0xFFF3F4F6), // light beige
    this.iconColor = const Color(0xFF1F2A44), // dark blue
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
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

