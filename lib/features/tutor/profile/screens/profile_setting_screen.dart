import 'package:flutter/material.dart';
import 'package:study_hall_project/core/common/constants/notification_button.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';

import 'change_password_screen.dart';
import 'personal_information_screen.dart';

class TeacherProfileSettingScreen extends StatelessWidget {
  const TeacherProfileSettingScreen({super.key});

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
                Row(
                  children: [
                    const Text(
                      'Profile setting',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    NotificationButton(onTap: () {}),
                  ],
                ),
                const SizedBox(height: 20),
                _buildProfileCard(),
                const SizedBox(height: 28),
                _buildSectionHeader('Account Details'),
                _buildListTile(
                  leading: _leadingAsset('assets/images/profile.png'),
                  title: 'Personal Information',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            const TeacherPersonalInformationScreen(),
                      ),
                    );
                  },
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/currency-dollar.png'),
                  title: 'Beneficiary Information',
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/graduation-cap.png'),
                  title: 'Switch to Student account',
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/business.png'),
                  title: 'Register your business as a lea.....',
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/arrow-up-right.png'),
                  title: 'Invite Friend',
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/face-smile.png'),
                  title: 'Refer a Tutor',
                ),
                _buildListTile(
                  leading: _leadingIcon(Icons.lock_outline),
                  title: 'Change Password',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ChangePasswordScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionHeader('Financial Management'),
                _buildListTile(
                  leading: _leadingAsset('assets/images/circle-dollar.png'),
                  title: 'Income Management',
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/arrow-up-right.png'),
                  title: 'Withdraw Management',
                ),
                const SizedBox(height: 24),
                _buildSectionHeader('Application Settings'),
                _buildListTile(
                  leading: _leadingAsset('assets/images/bell.png'),
                  title: 'Notification',
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/globe.png'),
                  title: 'Language',
                ),
                const SizedBox(height: 24),
                _buildSectionHeader('Help & Support'),
                _buildListTile(
                  leading: _leadingAsset('assets/images/phone-plus.png'),
                  title: 'Contact Us',
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/file-lines.png'),
                  title: 'Term and Conditions',
                ),
                _buildListTile(
                  leading: _leadingAsset('assets/images/eye.png'),
                  title: 'Privacy Policy',
                ),
                const SizedBox(height: 32),
                _buildLogoutButton(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        height: 22,
                        width: 22,
                        child: Image.asset('assets/images/Monotone edit.png'),
                      ),
                    ],
                  ),
                  const Text(
                    'john@gmail.com',
                    style: TextStyle(
                      color: Color(0xFF374151),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
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
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF111827),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildListTile({
    required Widget leading,
    required String title,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD1D5DB)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _leadingAsset(String asset) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(12),
      child: SizedBox(height: 20, width: 20, child: Image.asset(asset)),
    );
  }

  Widget _leadingIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(12),
      child: Icon(icon, size: 20, color: const Color(0xFF111827)),
    );
  }

  Widget _buildLogoutButton() {
    return Material(
      color: const Color(0xFFFCE4EC),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset('assets/images/box-arrow-left.png'),
                ),
                const SizedBox(width: 8),
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
    );
  }
}
