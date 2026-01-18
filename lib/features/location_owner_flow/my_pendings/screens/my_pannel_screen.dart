import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/my_pannel_controller.dart';

class MyPanelScreen extends StatelessWidget {
  MyPanelScreen({super.key});

  final MyPannelController controller = Get.put(MyPannelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
            const SizedBox(height: 12),
            const Divider(
              height: 2,
              thickness: 4,
              color: Color(0xFFE5E7EB), // light grey (matches UI)
            ),
            const SizedBox(height: 16),
            _segmentedControl(),
            const SizedBox(height: 16.5),
            Expanded(
              child: Obx(() {
                if (controller.selectedTab.value == 0) {
                  return _locationList(); // My Location screen
                } else {
                  return _reviewSection(); // Review screen
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _locationList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5,
      itemBuilder: (_, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Row(
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/cafe.png', // replace with your image
                  height: 82,
                  width: 84,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "14 Klin Street, Los Angeles, CA",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9CA3AF),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Lucy’s Cafe",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Vector (1).png',
                          height: 9.33,
                          width: 15.33,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "44",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/images/star.png',
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "4.8",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "\$134.08",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3B82F6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _reviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ratingCard(),
        const SizedBox(height: 24),
        _allReviewsHeader(),
        const SizedBox(height: 12),
        Expanded(child: _reviewsList()),
      ],
    );
  }

  // ---------------- APP BAR ----------------
  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFF3F4F6)),
            ),
            child: const Icon(Icons.arrow_back_ios_new, size: 18),
          ),
          const SizedBox(width: 12),
          const Text(
            "My Panel",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- SEGMENTED CONTROL ----------------
  Widget _segmentedControl() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => Container(
          height: 44,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [_tabButton("My Location", 0), _tabButton("Review", 1)],
          ),
        ),
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.selectedTab.value = index,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: controller.selectedTab.value == index
                ? const Color(0xFF0F172A)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: controller.selectedTab.value == index
                  ? Colors.white
                  : Color(0xFF111827),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- RATING CARD ----------------
  Widget _ratingCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFFD1D5DB)),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "4.7",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "/5",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF9CA3AF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Based on 388 Review",
                  style: TextStyle(
                    color: Color(0xFF374151),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Image.asset(
                        'assets/images/star.png',
                        height: 16,
                        width: 16,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(child: _ratingBars()),
          ],
        ),
      ),
    );
  }

  Widget _ratingBars() {
    return Column(
      children: [
        _ratingRow("5 Star", 0.9),
        _ratingRow("4 Star", 0.75),
        _ratingRow("3 Star", 0.45),
        _ratingRow("2 Star", 0.25),
        _ratingRow("1 Star", 0.15),
      ],
    );
  }

  Widget _ratingRow(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 6,
                backgroundColor: const Color(0xFFE5E7EB),
                valueColor: const AlwaysStoppedAnimation(Color(0xFFFFB300)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- ALL REVIEWS HEADER ----------------
  Widget _allReviewsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "All Reviews",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF242E49),
            ),
          ),
          Text(
            "Most relevant ▾",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF9CA3AF),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- REVIEWS LIST ----------------
  Widget _reviewsList() {
    const itemCount = 3;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: itemCount,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Emily Johnson",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF111827),
                        ),
                      ),
                      Text(
                        "24 Aug 2025",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4B5563),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Image.asset(
                          'assets/images/star.png',
                          height: 16,
                          width: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Emily John made learning digital marketing an enjoyable experience. "
                    "Her course was thorough, and her teaching methods were interactive, "
                    "which kept me engaged. She was always willing to go the extra mile "
                    "to ensure I understood the material. Sarah’s enthusiasm and expertise "
                    "were evident throughout the course.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF111827),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            if (index != itemCount - 1)
              const Divider(height: 16, thickness: 2, color: Color(0xFFE5E7EB)),
          ],
        );
      },
    );
  }
}
