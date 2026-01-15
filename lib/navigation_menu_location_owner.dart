import 'package:flutter/material.dart';
import 'package:study_hall_project/core/constants/assets_const.dart' hide Icons;
import 'package:study_hall_project/features/location_owner_flow/home/screens/owner_home_screen.dart';

import 'clipper.dart';
import 'core/constants/svg_image.dart';

class CustomBottomNavBarOwner extends StatefulWidget {
  const CustomBottomNavBarOwner({super.key});

  @override
  State<CustomBottomNavBarOwner> createState() => _CustomBottomNavBarOwnerState();
}

class _CustomBottomNavBarOwnerState extends State<CustomBottomNavBarOwner> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: OwnerHomeScreen(),),
    Center(child: Text("Income Screen", style: TextStyle(fontSize: 28))),
    Center(child: Text("Withdraw Screen", style: TextStyle(fontSize: 28))),
    Center(child: Text("Profile Screen", style: TextStyle(fontSize: 28))),
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

          // Clipped nav bar
          Container(
            //margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22), // ← main rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 90,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _navItem(Images.home, "Home", 0),
                    _navItem(Images.income, "Income", 1),
                    _navItem(Images.withdraw, "Withdraw", 2),
                    _navItem(Images.user, "Profile", 3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String svgAsset, String label, int index) {
    final isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: SizedBox(
        width: 80, // slightly wider for better spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              transform: Matrix4.translationValues(0, isActive ? 3 : 0, 0),
              padding: EdgeInsets.all(isActive ? 12 : 6),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFF4F4F6) : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: AppSvg(
                asset: svgAsset,
                width: 26,
                height: 26,
                color: isActive ? const Color(0xFF3B82F6) : null,
              ),
            ),

            SizedBox(height: isActive ? 2 : 0),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isActive
                  ? Container(
                key: ValueKey('indicator_$index'),
                width: 20,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(4),
                ),
              )
                  : Text(
                label,
                key: ValueKey('text_$index'),
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