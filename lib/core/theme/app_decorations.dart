import 'package:flutter/material.dart';

class AppDecorations {
  static const BoxDecoration backgroundGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFFFE0B2), Colors.white],
      stops: [0.0, 0.25],
    ),
  );
}