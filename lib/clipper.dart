import 'dart:ui';
import 'package:flutter/material.dart';

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double dipHeight = 42; // increased from 26
    const double dipWidth = 120;

    final double centerX = size.width / 2;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(centerX - dipWidth / 2, 0);

    path.cubicTo(
      centerX - dipWidth / 5, 4,
      centerX - dipWidth / 2, dipHeight,
      centerX, dipHeight,
    );

    path.cubicTo(
      centerX + dipWidth / 2.2, dipHeight,
      centerX + dipWidth / 4, 2,
      centerX + dipWidth / 2, 0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

