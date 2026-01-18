import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import 'course_detail_screen.dart';

class MyPanelScreen extends StatefulWidget {
  const MyPanelScreen({super.key});

  @override
  State<MyPanelScreen> createState() => _MyPanelScreenState();
}

class _MyPanelScreenState extends State<MyPanelScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['My Courses', 'Availability', 'Review'];

  final List<Map<String, dynamic>> _courses = [
    {
      'title': 'Principles of Industrial Design',
      'category': 'Design',
      'modules': '12 module',
      'hours': '86 hours',
      'price': '\$134.08',
      'image': 'assets/images/logo.png',
    },
    {
      'title': 'Advanced Web Development',
      'category': 'Technology',
      'modules': '15 module',
      'hours': '120 hours',
      'price': '\$199.99',
      'image': 'assets/images/logo.png',
    },
    {
      'title': 'Data Science Fundamentals',
      'category': 'Science',
      'modules': '10 module',
      'hours': '75 hours',
      'price': '\$149.50',
      'image': 'assets/images/logo.png',
    },
    {
      'title': 'Digital Marketing Mastery',
      'category': 'Business',
      'modules': '8 module',
      'hours': '60 hours',
      'price': '\$99.99',
      'image': 'assets/images/logo.png',
    },
    {
      'title': 'Creative Writing Workshop',
      'category': 'Arts',
      'modules': '6 module',
      'hours': '45 hours',
      'price': '\$79.99',
      'image': 'assets/images/logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: AppColors.textBlack),
            onPressed: () => Get.back(),
          ),
        ),
        title: const Text(
          'My Panel',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlack,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: List.generate(_tabs.length, (index) {
                final isSelected = _selectedTab == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.textBlack : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _tabs[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? AppColors.primaryWhite : AppColors.greyText,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          // Course List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                final course = _courses[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => const CourseDetailScreen());
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.lightGrey, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Thumbnail
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              course['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppColors.lightGrey,
                                  child: const Icon(Icons.image, color: AppColors.greyText),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Course Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course['category'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.blueText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                course['title'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textBlack,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.description, size: 14, color: AppColors.textBlack),
                                  const SizedBox(width: 4),
                                  Text(
                                    course['modules'],
                                    style: const TextStyle(fontSize: 12, color: AppColors.textBlack),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: const BoxDecoration(
                                      color: AppColors.textBlack,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    course['hours'],
                                    style: const TextStyle(fontSize: 12, color: AppColors.textBlack),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                course['price'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blueText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(Icons.home, 'Home', true),
                    _buildNavItem(Icons.bookmark, 'Learning', false),
                    const SizedBox(width: 40), // Space for center button
                    _buildNavItem(Icons.chat_bubble_outline, 'Chat', false),
                    _buildNavItem(Icons.person_outline, 'Profile', false),
                  ],
                ),
              ),
            ),
            // Center Floating Button
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.orangeAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.orangeAccent.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.primaryWhite,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? AppColors.primaryBlue : AppColors.greyText,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? AppColors.primaryBlue : AppColors.greyText,
          ),
        ),
      ],
    );
  }
}
