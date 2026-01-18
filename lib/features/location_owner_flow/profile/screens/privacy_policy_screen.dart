import 'package:flutter/material.dart';

import '../../../../core/common/constants/back_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                      'At Study Hall Apps, we are committed to protecting the privacy and security of our users. This Privacy Policy explains how we collect, use, and protect the personal information of our users.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280)
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

// Title
                  _buildSectionTitle('Collection of Personal Information'),
                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: const Text(
                      'We collect the following personal information from our users:',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildBulletList([
                    'Name',
                    'Email address',
                    'Payment information (if applicable)',
                    'User-generated content (e.g., posts in forums, community information)',
                  ]),

                  const SizedBox(height: 40),

// Second Section
                  _buildSectionTitle('Use of Personal Information'),
                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: const Text(
                      'We use the personal information we collect for the following purposes:',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildBulletList([
                    'To create and manage user accounts',
                    'To deliver the educational content and resources offered by our app',
                    'To improve the app and provide a personalized experience',
                    'To send periodic updates and promotions (if the user has opted in to receive such communications)',
                  ]),

                  const SizedBox(height: 40),

// Repeated part (as in your text)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: const Text(
                      'We use the personal information we collect for the following purposes:',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildBulletList([
                    'To create and manage user accounts',
                    'To deliver the educational content and resources',
                  ]),

                  const SizedBox(height: 48),
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
          fontWeight: FontWeight.bold,
          color: Color(0xFF6B7280)
        ),
      ),
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      children: items
          .map(
            (item) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "•  ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xFF6B7280)),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}
