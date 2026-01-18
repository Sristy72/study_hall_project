import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';
import 'package:study_hall_project/features/student_flow/finding_tutor/screens/tutor_for_you_screen.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'My Courses',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu_book_outlined),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_today_outlined, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: const Icon(Icons.tune),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    _CourseTab(label: 'On Going', isActive: false),
                    SizedBox(width: 10),
                    _CourseTab(label: 'Finding Tutor', isActive: true),
                    SizedBox(width: 10),
                    _CourseTab(label: 'History', isActive: false),
                  ],
                ),
                const SizedBox(height: 16),
                _CourseFindingCard(
                  statusLabel: 'We found a tutor for you please check!',
                  statusColor: Color(0xFFE6F4EA),
                  statusTextColor: Color(0xFF16A34A),
                  courseTitle: 'How to write Cover Letter',
                  tutorName: 'Emily john',
                  courseTag: 'Business',
                  courseCode: 'S00001',
                  onTap: () => Get.to(() => const TutorForYouScreen()),
                ),
                const SizedBox(height: 12),
                _CourseFindingCard(
                  statusLabel: 'Finding a tutor',
                  statusColor: Color(0xFFF3F4F6),
                  statusTextColor: Color(0xFF6B7280),
                  courseTitle: 'How to write Cover Letter',
                  tutorName: 'Emily john',
                  courseTag: 'Business',
                  courseCode: 'S00001',
                  onTap: () => Get.to(() => const TutorForYouScreen()),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CourseTab extends StatelessWidget {
  const _CourseTab({required this.label, required this.isActive});

  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF111827) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.white : const Color(0xFF6B7280),
        ),
      ),
    );
  }
}

class _CourseFindingCard extends StatelessWidget {
  const _CourseFindingCard({
    required this.statusLabel,
    required this.statusColor,
    required this.statusTextColor,
    required this.courseTitle,
    required this.tutorName,
    required this.courseTag,
    required this.courseCode,
    required this.onTap,
  });

  final String statusLabel;
  final Color statusColor;
  final Color statusTextColor;
  final String courseTitle;
  final String tutorName;
  final String courseTag;
  final String courseCode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    statusLabel,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: statusTextColor,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.more_horiz, color: Color(0xFF9CA3AF)),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              courseTitle,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage('assets/images/tutor.png'),
                ),
                const SizedBox(width: 8),
                Text(
                  tutorName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '• $courseTag',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '• $courseCode',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.location_on_outlined, size: 16, color: Color(0xFF6B7280)),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Lucy Coffee • 14 Kln Street',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
                Icon(Icons.access_time, size: 16, color: Color(0xFF6B7280)),
                SizedBox(width: 4),
                Text(
                  'Thursday 10:00am - 11:00am',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
