import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/tutor/home/scsreens/confirm_apply_session.dart';

class SessionDetailScreen extends StatelessWidget {
  const SessionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroImage(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitleSection(),
                          const SizedBox(height: 20),
                          _buildInfoRow(),
                          const SizedBox(height: 24),
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Sed rhoncus, tortor sed eleifend tristique, tortor mauris molestie elit, et lacinia ipsum quam nec dui. Quisque",
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildLocationCard(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          const Text(
            'Session Detail',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.share_outlined,
                  size: 20,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Color(0xFF1F2937),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: const BoxDecoration(
        color: Color(0xFFF3F4F6), // Placeholder color
        image: DecorationImage(
          image: AssetImage('assets/images/7e12a1c92474d4c007d5bc917d3af6d2d0c2316f.png'),
          // Assuming a meeting image exists or placeholder
          // If not, it will just show the color or error logs, but
          // usually we'd use a network image for a real app.
          // For now using a likely placeholder name or just color.
          // I will use a network image placeholder if asset not sure?
          // I'll stick to a color container with an icon if asset is risky,
          // but let's try to match the design style.
          // I'll use a container with a color for now to be safe,
          // or comments indicating asset path.
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How to write Cover Letter",
          style: TextStyle(
            fontSize: 22,
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
                  image: AssetImage('assets/images/photo.png'),
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
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          "#Life Style  #Business  #Growth",
          style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
        ),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoItem(
            Icons.coffee_outlined,
            "Offline",
            "",
            isLabelBottom: true,
          ),
          _buildVerticalDivider(),
          _buildInfoItem(Icons.access_time, "Duration", "1 Hour"),
          _buildVerticalDivider(),
          _buildInfoItem(Icons.attach_money, "Tuition fee range", "50 to 100"),
          _buildVerticalDivider(),
          _buildInfoItem(Icons.school_outlined, "Student", "Sara Lim"),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(height: 30, width: 1, color: const Color(0xFFE5E7EB));
  }

  Widget _buildInfoItem(
    IconData icon,
    String label,
    String value, {
    bool isLabelBottom = false,
  }) {
    // The design has Label then Value for most, but "Offline" has Icon then "Offline" label as the main text?
    // Actually looking closely:
    // 1st: Icon (Cup) -> Text "Offline"
    // 2nd: Icon (Clock) -> Text "Duration" (small) -> Text "1 Hour" (bold)
    // 3rd: Icon ($) -> Text "Tuition fee..." (small) -> Text "50 to 100" (bold)
    // 4th: Icon (Cap) -> Text "Student" (small) -> Text "Sara Lim" (bold)

    // For the first one, it looks like just Icon and Text.
    // I will handle the first one specifically or use a flexible layout.

    if (value.isEmpty) {
      // Special case for "Offline"
      return Column(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF4B5563)),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: const Color(0xFF6B7280)),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: Color(0xFF6B7280)),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLocationCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFE5E7EB),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/65d018e4e7c0c0287b5628eac01ca4ffb40f217b.png',
                ), // Placeholder
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Icon(Icons.location_on, color: Colors.blue, size: 30),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Lucy's Cafe",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Color(0xFF6B7280),
              ),
              const SizedBox(width: 6),
              const Expanded(
                child: Text(
                  "14 Kiln Street California",
                  style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                ),
              ),
              const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: Color(0xFF6B7280),
              ),
              const SizedBox(width: 6),
              const Text(
                "14 August 2025",
                style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5E7EB),
                foregroundColor: const Color(0xFF4B5563),
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Back",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {Get.to(() => ConfirmApplySession());},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Apply",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
