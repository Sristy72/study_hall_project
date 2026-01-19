import 'package:flutter/material.dart';
import 'package:study_hall_project/core/constants/assets_const.dart' hide Icons;
import 'package:study_hall_project/features/student_flow/message/screen/message_screen.dart';

import 'clipper.dart';
import 'core/constants/svg_image.dart';
import 'features/student_flow/home/screens/home_screen.dart';

import 'features/student_flow/my_courses/screens/my_courses_wrapper.dart';
import 'features/student_flow/profile/screens/main_profile_screen.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),           // index 0 → Home
    MyCoursesWrapper(),     // index 1 → Learning (shows empty or courses)
    MessageScreen(),
    MainProfileScreen(),    // index 3 → Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Shadow layer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 25,
                    spreadRadius: 5,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
            ),
          ),

          // Actual nav bar
          ClipPath(
            clipper: BottomNavClipper(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              height: 90,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _navItem(Images.home, "Home", 0),
                  _navItem(Images.bookmark, "Learning", 1),
                  const SizedBox(width: 40),
                  _navItem(Images.message, "Chat", 2),
                  _navItem(Images.user, "Profile", 3),
                ],
              ),
            ),
          ),

          // Floating Add Button (unchanged)
          Positioned(
            bottom: 57,
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFFC9A28),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFC7C39).withOpacity(0.4),
                    blurRadius: 18,
                    spreadRadius: 5,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 32),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String images, String label, int index) {
    final isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              transform: Matrix4.translationValues(
                0,
                isActive ? 3 : 0,
                0,
              ),
              padding: EdgeInsets.all(isActive ? 12 : 6),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFFF4F4F6)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: AppSvg(
                asset: images,
                width: 26,
                height: 26,
                color: isActive
                    ? const Color(0xFF3B82F6)
                    : null,
              ),
            ),

            SizedBox(height: isActive ? 2 : 0),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isActive
                  ? Container(
                key: const ValueKey('indicator'),
                width: 20,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(4),
                ),
              )
                  : Text(
                label,
                key: const ValueKey('text'),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF4B5563),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
