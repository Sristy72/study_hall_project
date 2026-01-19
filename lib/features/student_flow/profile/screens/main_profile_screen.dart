import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';
import 'package:study_hall_project/features/student_flow/become_tutor/screens/become_tutor_popup_dialog.dart';
import 'package:study_hall_project/features/student_flow/profile/screens/personal_information_screen.dart';
import 'package:study_hall_project/features/student_flow/profile/screens/transaction_screen.dart';

import '../../become_tutor/screens/become_tutor_success_dialog.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile setting',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.notifications_outlined, size: 24),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // Profile Card
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/course_perticipate.png',
                              fit: BoxFit.cover,
                              errorBuilder: (c, e, s) =>
                                  Icon(Icons.person, size: 40),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sara Lim',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'saralim@gmail.com',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.link,
                                    size: 16,
                                    color: Color(0xFF3B82F6),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Facebook',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF3B82F6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.edit_outlined, color: Colors.grey.shade600),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),

                  // Account Details
                  Text(
                    'Account Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 16),

                  _buildMenuItem(
                    Icons.person_outline,
                    'Personal Information',
                    () {
                      Get.to(() => PersonalInformationScreen());
                    },
                  ),
                  _buildMenuItem(Icons.attach_money, 'Transaction', () {
                    Get.to(() => TransactionScreen());
                  }),
                  _buildMenuItem(
                    Icons.menu_book_outlined,
                    'Become a Tutor',
                    () {
                      Get.to(() => BecomeTutorPopupDialog());
                    },
                  ),
                  _buildMenuItem(
                    Icons.business_outlined,
                    'Register your business',
                    () {},
                  ),
                  _buildMenuItem(Icons.send_outlined, 'Invite Friend', () {}),
                  _buildMenuItem(
                    Icons.emoji_emotions_outlined,
                    'Refer a Tutor',
                    () {},
                  ),
                  _buildMenuItem(
                    Icons.favorite_outline,
                    'Favourite Tutor',
                    () {},
                  ),
                  _buildMenuItem(Icons.lock_outline, 'Change Password', () {}),

                  SizedBox(height: 32),

                  // Application Settings
                  Text(
                    'Application Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 16),

                  _buildMenuItem(
                    Icons.notifications_outlined,
                    'Notification',
                    () {},
                  ),
                  _buildMenuItem(Icons.language_outlined, 'Language', () {}),

                  SizedBox(height: 32),

                  // Help & Support
                  Text(
                    'Help & Support',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 16),

                  _buildMenuItem(Icons.phone_outlined, 'Contact Us', () {}),
                  _buildMenuItem(
                    Icons.description_outlined,
                    'Term and Conditions',
                    () {},
                  ),
                  _buildMenuItem(
                    Icons.remove_red_eye_outlined,
                    'Privacy Policy',
                    () {},
                  ),

                  SizedBox(height: 24),

                  // Logout Button
                  Container(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFE5E5),
                        foregroundColor: Color(0xFFEF4444),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Icon(icon, size: 24, color: Colors.black),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
