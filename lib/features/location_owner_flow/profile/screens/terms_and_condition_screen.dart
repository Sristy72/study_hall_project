import 'package:flutter/material.dart';

import '../../../../core/common/constants/back_button.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        const CustomBackButton2(),
                        SizedBox(width: 16),
                        Text(
                          'Terms & Conditions',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Divider(
                    height: 1.5,
                    thickness: 1.5,
                    color: Color(0xFFE5E7EB),
                  ),

                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: const Text(
                      'Welcome to StudyHall Apps. By using our app, you agree to be bound by these Terms and Conditions ("Terms"). '
                          'If you do not agree to these Terms, please do not use the app.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

// Section 1
                  _buildSectionTitle('1. User Accounts'),
                  const SizedBox(height: 12),

                  _buildBulletPoint(
                    'a.',
                    'To access the content and resources offered by our app, you must create a user account.',
                  ),
                  _buildBulletPoint(
                    'b.',
                    'You agree to provide accurate, complete information when creating your account, '
                        'and to keep this information up to date.',
                  ),
                  _buildBulletPoint(
                    'c.',
                    'You are responsible for maintaining the confidentiality of your account and password, '
                        'and for all activities that occur under your account.',
                  ),
                  _buildBulletPoint(
                    'd.',
                    'If you suspect any unauthorized use of your account, you should immediately notify us.',
                  ),

                  const SizedBox(height: 32),

// Section 2
                  _buildSectionTitle('2. Content and Intellectual Property'),
                  const SizedBox(height: 12),

                  _buildBulletPoint(
                    'a.',
                    'The content and resources offered by our app are protected by copyright and other '
                        'intellectual property laws.',
                  ),
                  _buildBulletPoint(
                    'b.',
                    'You may use the content only for personal, non-commercial, non-reproducible purposes, '
                        'and may not reproduce, distribute, or modify it without our prior written consent.',
                  ),
                  _buildBulletPoint(
                    'c.',
                    'You acknowledge that Eduline Apps (or its licensors) own all right, title, '
                        'and interest in the content.',
                  ),

                  const SizedBox(height: 40)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF6B7280),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String prefix, String text) {
    return Padding(
      padding: const EdgeInsets.only(left:36, right:36, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Text(
              prefix,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


