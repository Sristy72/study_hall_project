import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/location_owner_flow/profile/screens/language_selection_screen.dart';
import 'package:study_hall_project/features/location_owner_flow/profile/screens/notification_screen.dart';
import 'package:study_hall_project/features/location_owner_flow/profile/screens/privacy_policy_screen.dart';
import 'package:study_hall_project/features/location_owner_flow/profile/screens/terms_and_condition_screen.dart';

import '../../../../core/common/constants/notification_button.dart';
import '../../../../core/theme/app_decorations.dart';
import '../widgets/refer_tutor_dialog.dart';
import '../widgets/show_dialog.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ===== Top Header =====
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profile Setting',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                    const Spacer(),
                    NotificationButton(
                      onTap: () {
                        Get.to(() => NotificationScreen());
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                /// ===== Profile Section =====
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    border: Border.all(color: Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // ⭐ FIX
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/cb1a2b0d21866a9ca96f2f09c68d61371e199ac9.jpg',
                            width: 76,
                            height: 76,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'John Steward',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      height: 22,
                                      width: 22,
                                      child: Image.asset('assets/images/Monotone edit.png'),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'john@gmail.com',
                                style: TextStyle(
                                  color: Color(0xFF374151),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 14,
                                    width: 14,
                                    child: Image.asset('assets/images/link-2.png'),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Facebook',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF2563EB),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                /// ===== Account Details =====
                _buildSectionHeader('Account Details'),
                _buildListTile(
                  image: 'assets/images/profile.png',
                  title: 'Personal Information',
                  onTap: () {},
                ),
                _buildListTile(
                  image: 'assets/images/currency-dollar.png',
                  title: 'Beneficiary Information',
                  onTap: () {},
                ),
                _buildListTile(
                  image: 'assets/images/graduation-cap.png',
                  title: 'Switch to Student account',
                  onTap: () {},
                ),
                _buildListTile(
                  image: 'assets/images/face-smile.png',
                  title: 'Refer a Tutor',
                  onTap: () {showDialog(
                    context: context,
                    builder: (context) => const ReferTutorDialog(),
                  );},
                ),

                const SizedBox(height: 24),

                /// ===== Application Settings =====
                _buildSectionHeader('Application Settings'),
                _buildListTile(
                  image: 'assets/images/bell.png',
                  title: 'Notification',
                  onTap: () {Get.to(() => NotificationScreen());},
                ),
                _buildListTile(
                  image: 'assets/images/globe.png',
                  title: 'Language',
                  onTap: () {Get.to(() => LanguageSelectionScreen());},
                ),

                const SizedBox(height: 24),

                /// ===== Help & Support =====
                _buildSectionHeader('Help & Support'),
                _buildListTile(
                  image: 'assets/images/phone-plus.png',
                  title: 'Contact Us',
                  onTap: () {},
                ),
                _buildListTile(
                  image: 'assets/images/file-lines.png',
                  title: 'Terms and Conditions',
                  onTap: () {Get.to(() => TermsAndConditionsScreen());},
                ),
                _buildListTile(
                  image: 'assets/images/eye.png',
                  title: 'Privacy Policy',
                  onTap: () {Get.to(() => PrivacyPolicyScreen());},
                ),

                const SizedBox(height: 40),

                /// ===== Logout =====
                  Material(
                    color: const Color(0xFFFCE4EC),
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () async {
                        final shouldLogout = await showLogoutDialog(context);

                        if (shouldLogout == true) {
                          // Perform logout logic here
                          // e.g. await authService.signOut();
                          // Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height:24, width:24, child: Image.asset('assets/images/box-arrow-left.png')),
                              SizedBox(width: 8,),
                              const Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFFE91E63),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF111827),
        fontSize: 18,
        fontWeight: FontWeight.w600,
        //letterSpacing: 0.8,
      ),
    );
  }

  Widget _buildListTile({
    required String image,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD1D5DB)),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(height: 22, width:22, child: Image.asset(image)),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            //contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
