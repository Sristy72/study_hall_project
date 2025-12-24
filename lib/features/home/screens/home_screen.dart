import 'package:flutter/material.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: Center(child: Text("Home screen")),
      ),
    );
  }
}
