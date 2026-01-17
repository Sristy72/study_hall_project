import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/location_owner_flow/home/screens/notification_screen.dart';

import '../../../../core/common/constants/notification_button.dart';
import '../../../../core/theme/app_decorations.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/cb1a2b0d21866a9ca96f2f09c68d61371e199ac9.jpg',
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,           // usually looks best with rounded corners
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
                                Spacer(),
                                IconButton(
                                  icon: Container(height: 22,width:22,child: Image.asset('assets/images/Monotone edit.png')),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'john@gmail.com',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Row(
                              children: [
                                Container(height: 14, width:14,child: Image.asset('assets/images/link-2.png')),
                                SizedBox(width: 8,),
                                Text('Facebook', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF2563EB)),)
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 32),

                /// ===== Account Details =====
                _buildSectionHeader('Account Details'),
                _buildListTile(
                  icon: Icons.person_outline_rounded,
                  title: 'Personal Information',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Beneficiary Information',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.school_outlined,
                  title: 'Switch to Student account',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.person_add_alt_1_outlined,
                  title: 'Refer a Tutor',
                  onTap: () {},
                ),

                const SizedBox(height: 24),

                /// ===== Application Settings =====
                _buildSectionHeader('Application Settings'),
                _buildListTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notification',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.language,
                  title: 'Language',
                  onTap: () {},
                ),

                const SizedBox(height: 24),

                /// ===== Help & Support =====
                _buildSectionHeader('Help & Support'),
                _buildListTile(
                  icon: Icons.phone_outlined,
                  title: 'Contact Us',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.description_outlined,
                  title: 'Terms and Conditions',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  onTap: () {},
                ),

                const SizedBox(height: 40),

                /// ===== Logout =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Material(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Color(0xFFE57373),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700], size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      onTap: onTap,
    );
  }
}
