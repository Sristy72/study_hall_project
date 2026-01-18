import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';
import 'package:study_hall_project/features/student_flow/finding_tutor/screens/checkout_screen.dart';
import 'package:study_hall_project/features/student_flow/finding_tutor/widgets/finding_tutor_widgets.dart';

class TutorReviewScreen extends StatelessWidget {
  const TutorReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const TutorHeaderCard(
                        name: 'John De',
                        university: 'University of Ohio',
                        tag: 'Undergraduate',
                      ),
                      const SizedBox(height: 16),
                      TutorTabBar(
                        isCoursesActive: false,
                        onCoursesTap: () => Get.back(),
                        onReviewsTap: () {},
                      ),
                      const SizedBox(height: 16),
                      _ReviewSummary(),
                      const SizedBox(height: 12),
                      const _ReviewCard(),
                      const SizedBox(height: 12),
                      const _ReviewCard(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFEF4444),
                          side: const BorderSide(color: Color(0xFFFCA5A5)),
                          backgroundColor: const Color(0xFFFEE2E2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Reject'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const CheckoutScreen()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Accept offer'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '4.7/5',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              SizedBox(height: 6),
              Text(
                'Based on 388 Review',
                style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xFFF59E0B), size: 16),
                  Icon(Icons.star, color: Color(0xFFF59E0B), size: 16),
                  Icon(Icons.star, color: Color(0xFFF59E0B), size: 16),
                  Icon(Icons.star, color: Color(0xFFF59E0B), size: 16),
                  Icon(Icons.star_half, color: Color(0xFFF59E0B), size: 16),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: const [
              _RatingBar(label: '5 Star', value: 0.85),
              _RatingBar(label: '4 Star', value: 0.65),
              _RatingBar(label: '3 Star', value: 0.3),
              _RatingBar(label: '2 Star', value: 0.2),
              _RatingBar(label: '1 Star', value: 0.1),
            ],
          ),
        ],
      ),
    );
  }
}

class _RatingBar extends StatelessWidget {
  const _RatingBar({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Row(
        children: [
          SizedBox(
            width: 44,
            child: Text(
              label,
              style: const TextStyle(fontSize: 10, color: Color(0xFF6B7280)),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value,
              minHeight: 6,
              backgroundColor: const Color(0xFFE5E7EB),
              valueColor: const AlwaysStoppedAnimation(Color(0xFFF59E0B)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/tutor.png'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Emily Johnson',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                      Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                      Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                      Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                      Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                '24 Aug 2024',
                style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Emily helped me learn digital marketing in an enjoyable experience. '
            'Her course was well-structured, and her teaching methods were engaging. '
            'She was always willing to go the extra mile to ensure I understood the material.',
            style: TextStyle(fontSize: 12, color: Color(0xFF4B5563)),
          ),
        ],
      ),
    );
  }
}
