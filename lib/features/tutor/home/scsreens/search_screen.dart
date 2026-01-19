import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:study_hall_project/features/tutor/home/scsreens/session_detail_screen.dart';
import 'package:study_hall_project/features/tutor/home/widget/filter_bottom_sheet.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildResultCount(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                itemCount: 4,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return _buildResultCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Color(0xFF1F2937),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(width: 20),
          const Text(
            'Search',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Cover Letter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1F2937),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF9CA3AF)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                const FilterBottomSheet(),
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
              );
            },

            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: const Icon(Icons.tune, color: Color(0xFF6B7280)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultCount() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '34 Result for ',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '“Cover latter”',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultCard(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SessionDetailScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    index == 1
                        ? "Pricing range \$20 to \$40"
                        : "Pricing range \$50 to \$100",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF9CA3AF),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'How to write Cover Letter',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/photo.png',
                      ), // Using placeholder as seen in home screen
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Emily john',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(width: 6),
                const Text('•', style: TextStyle(color: Color(0xFF9CA3AF))),
                const SizedBox(width: 6),
                const Text(
                  'Personal Development',
                  style: TextStyle(fontSize: 13, color: Color(0xFF3B82F6)),
                ),
                const SizedBox(width: 6),
                const Text('•', style: TextStyle(color: Color(0xFF9CA3AF))),
                const SizedBox(width: 6),
                const Text(
                  'S00001',
                  style: TextStyle(fontSize: 13, color: Color(0xFF3B82F6)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            const SizedBox(height: 12),
            if (index == 1) // Online case
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    child: const Icon(
                      Icons.language,
                      size: 16,
                      color: Color(0xFF6B7280),
                    ), // Placeholder for online icon if asset missing
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Online',
                    style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 16,
                    height: 16,
                    child: Image.asset('assets/images/calendar.png'),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Tuesday, Thursday 10:00am - 11:00am',
                    style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                  ),
                ],
              )
            else
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    child: Image.asset('assets/images/location.png'),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Lucy Coffee - 14 Kiln Street',
                    style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 16,
                    height: 16,
                    child: Image.asset('assets/images/calendar.png'),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Thursday 10:00am - 11:00am',
                      style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                      overflow: TextOverflow.ellipsis,
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
