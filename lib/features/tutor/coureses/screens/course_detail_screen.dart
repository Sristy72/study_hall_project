import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import 'edit_course_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  bool _isCancellationExpanded = true;
  bool _isTutorNoteExpanded = false;

  void _showActionSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Action',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBlack,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textBlack),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildActionItem(Icons.edit, 'Edit Course', () {
              Navigator.pop(context);
              Get.to(() => const EditCourseScreen());
            }),
            _buildActionItem(Icons.copy, 'Duplicate Course', () {
              Navigator.pop(context);
              // Handle duplicate
            }),
            _buildActionItem(Icons.block, 'Deactivate Course', () {
              Navigator.pop(context);
              // Handle deactivate
            }),
            _buildActionItem(Icons.delete_outline, 'Delete Course', () {
              Navigator.pop(context);
              // Handle delete
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textBlack, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textBlack),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Course Detail',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlack,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.textBlack),
            onPressed: _showActionSheet,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.lightGrey,
                        child: const Icon(Icons.image, size: 60, color: AppColors.greyText),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.orangeAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: AppColors.primaryWhite,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Cultivate calm & creativity with fun drawing',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Instructor Info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.lightGrey,
                        child: const Icon(Icons.person, size: 18, color: AppColors.greyText),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Emily john',
                        style: TextStyle(fontSize: 14, color: AppColors.textBlack),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Business',
                          style: TextStyle(fontSize: 12, color: AppColors.blueText),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Tags
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildTag('#Life Style'),
                      _buildTag('#Business'),
                      _buildTag('#Growth'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Metadata
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMetadata(Icons.location_on, 'Los Angeles'),
                      _buildMetadata(Icons.access_time, '1 Hour'),
                      _buildMetadata(Icons.attach_money, '\$83.4/Student'),
                      _buildMetadata(Icons.people, '3 Students'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Course Content
                  const Text(
                    'Course Content',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Unlock your inner artist and discover the joy of mindful creation! Cultivate Calm & Creativity with Fun Drawing is a relaxing, beginner-friendly course designed to help you slow down, focus, and express yourself through playful drawing exercises. You\'ll explore simple yet powerful techniques that reduce stress, spark imagination, and improve your artistic confidence — no prior experience required.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyText,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Cancellation Policy
                  _buildExpandableSection(
                    'Cancelation Policy',
                    _isCancellationExpanded,
                    () {
                      setState(() {
                        _isCancellationExpanded = !_isCancellationExpanded;
                      });
                    },
                    const Text(
                      'You may cancel your enrollment within 7 days of purchase for a full refund, provided the course has not been completed or significantly accessed. After 7 days, cancellations are non-refundable, but you will retain lifetime access to the course materials.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyText,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tutor Note
                  _buildExpandableSection(
                    'Tutor Note',
                    _isTutorNoteExpanded,
                    () {
                      setState(() {
                        _isTutorNoteExpanded = !_isTutorNoteExpanded;
                      });
                    },
                    const Text(
                      'Welcome to the course! I\'m excited to guide you through this learning journey.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyText,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        tag,
        style: const TextStyle(fontSize: 12, color: AppColors.textBlack),
      ),
    );
  }

  Widget _buildMetadata(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: AppColors.textBlack, size: 20),
        const SizedBox(height: 4),
        SizedBox(
          width: 70,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: AppColors.textBlack),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildExpandableSection(
    String title,
    bool isExpanded,
    VoidCallback onTap,
    Widget content,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.textBlack,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: content,
            ),
        ],
      ),
    );
  }
}
