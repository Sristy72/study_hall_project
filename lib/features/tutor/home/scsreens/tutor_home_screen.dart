import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/constants/assets_const.dart' hide Icons;
import 'package:study_hall_project/core/constants/svg_image.dart';
import 'package:study_hall_project/core/theme/app_colors.dart';
import 'package:study_hall_project/features/location_owner_flow/home/screens/notification_screen.dart';
import 'package:study_hall_project/features/location_owner_flow/home/screens/pannel_screen.dart';
import 'package:study_hall_project/features/tutor/home/scsreens/search_screen.dart';
import 'package:study_hall_project/features/tutor/home/scsreens/session_detail_screen.dart';

import '../../../location_owner_flow/my_pendings/screens/my_pannel_screen.dart';

class TutorHomeScreen extends StatelessWidget {
  const TutorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildAvailableSessions(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "To Do",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View",
                      style: TextStyle(color: Color(0xFF3B82F6)),
                    ),
                  ),
                ],
              ),
            ),
            _buildToDoSection(),
            const SizedBox(height: 20),
            _buildToDoSection(),
            const SizedBox(height: 20),
            _buildToDoSection(),
            const SizedBox(height: 20),
            _buildToDoSection(),
            const SizedBox(height: 100), // Bottom padding for scrolling
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 250,
          child: Container(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFFDE8BC), // Light yellow bg from design
            ),
          ),
        ),

        // Content
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/f6c33e5ec09e0bab5202dd03e736b34c0d9ba19c.jpg',
                        ),
                        // Assuming profile image exists
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Name and Rating
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi, tutor Kate!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              child: Image.asset('assets/images/star.png'),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '4.9',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.favorite, color: Colors.red, size: 16),
                            SizedBox(width: 4),
                            Text(
                              '500',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Action Buttons
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SearchScreen());
                        },
                        child: _headerActionButton(Icons.search),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => NotificationScreen());
                        },
                        child: _headerActionButton(
                          Icons.notifications_outlined,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ), // Gap to match visual design (Top 140 - Row Bottom ~110 = 30)
            // Stats Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _statsRow("My level", "Level 2"),
                    const Divider(
                      height: 24,
                      thickness: 0.5,
                      color: Color(0xFFE5E7EB),
                    ),
                    _statsRow("Rating:", "4.9"),
                    const Divider(
                      height: 24,
                      thickness: 0.5,
                      color: Color(0xFFE5E7EB),
                    ),
                    _statsRow("My Courses:", "2"),
                    const Divider(
                      height: 24,
                      thickness: 0.5,
                      color: Color(0xFFE5E7EB),
                    ),
                    _statsRow("Session:", "14"),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => MyPanelScreen());
                      },
                      child: Container(
                        height: 44,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBEAFE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppSvg(asset: Images.category),
                              SizedBox(width: 8),
                              Text(
                                'My Panel',
                                style: TextStyle(
                                  color: Color(0xFF3B82F6),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _headerActionButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: const Color(0xFF4B5563), size: 24),
    );
  }

  Widget _statsRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4B5563),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableSessions() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      // Top padding based on stack overlap
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Available Session",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => SessionDetailScreen());
                },
                child: const Text(
                  "See All",
                  style: TextStyle(color: Color(0xFF3B82F6)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _sessionCard(
            "How to write Cover Letter",
            "Lucy Coffee - 14 Kiln Street",
            "Thursday 10:00am - 11:00am",
            isOnline: false,
            priceRange: "\$50 to \$100",
          ),
          const SizedBox(height: 16),
          _sessionCard(
            "How to write Cover Letter",
            "Online",
            "Tuesday, Thursday 10:00am - 11:00am",
            isOnline: true,
            priceRange: "\$50 to \$100",
          ),
        ],
      ),
    );
  }

  Widget _sessionCard(
    String title,
    String location,
    String time, {
    required bool isOnline,
    required String priceRange,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SessionDetailScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Pricing range $priceRange",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF9CA3AF),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, thickness: 0.5, color: Color(0xFFE5E7EB)),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  child: Image.asset('assets/images/location.png'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    location,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF4B5563),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 16,
                  height: 16,
                  child: Image.asset('assets/images/calendar.png'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF4B5563),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToDoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDBEAFE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Ongoing",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF3B82F6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(Icons.more_horiz, color: Color(0xFF9CA3AF)),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "How to write Cover Letter",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/photo.png'),
                          // Assuming profile image exists
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Emily john",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("•", style: TextStyle(color: Color(0xFF9CA3AF))),
                    const SizedBox(width: 8),
                    const Text(
                      "Business",
                      style: TextStyle(fontSize: 14, color: Color(0xFF3B82F6)),
                    ),
                    const SizedBox(width: 8),
                    const Text("•", style: TextStyle(color: Color(0xFF9CA3AF))),
                    const SizedBox(width: 8),
                    const Text(
                      "S00001",
                      style: TextStyle(fontSize: 14, color: Color(0xFF3B82F6)),
                    ),
                  ],
                ),

                Divider(color: Color(0xFFE5E7EB)),

                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      child: Image.asset('assets/images/calendar.png'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Thursday 10:00am - 11:00am',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF4B5563),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
