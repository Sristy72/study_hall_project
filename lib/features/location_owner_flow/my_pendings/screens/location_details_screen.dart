import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/location_owner_flow/my_pendings/model/edit_location_model.dart';

import '../controller/location_details_controller.dart';
import 'edit_screen.dart';

class LocationDetailScreen extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Use Column to place AppBar, Header Image, and Body
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [_buildHeaderImage(), _buildBody()]),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------- APPBAR -----------------
  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: _circleIcon(Icons.chevron_left),
          ),
          Obx(
            () => Text(
              controller.locationName.value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          // Replace edit icon with an image
          GestureDetector(
            onTap: () {
              final workspace = EditWorkspaceData(
                name: controller.locationName.value,
                description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...", // ← get real value
                rule:
                "orem ipsum dolor sit amet, consectetur adipiscing elit. ...", // ← get real value
                noiseLevel: "Low", // ← from your model
                maxReservationsPerDay: 10, // ← from your model
              );

              Get.to(() => WorkspaceEditScreen(initialWorkspace: workspace));
            },
            child: _circleImage("assets/images/edit_icon.png"),
          ),
        ],
      ),
    );
  }

  // ----------------- HELPER: CIRCLE IMAGE -----------------
  Widget _circleImage(String imagePath) => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Image.asset(imagePath, height: 24, width: 24, fit: BoxFit.contain),
  );

  // ----------------- HEADER IMAGE -----------------
  Widget _buildHeaderImage() {
    return Container(
      width: double.infinity,
      height: 220,
      child: Image.asset('assets/images/Header.png', fit: BoxFit.cover),
    );
  }

  // ----------------- BODY -----------------
  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoGrid(),
          const SizedBox(height: 25),
          _buildTabSwitcher(),
          const SizedBox(height: 25),
          Obx(() {
            switch (controller.selectedTab.value) {
              case 0:
                return _buildDescriptionTab();
              case 1:
                return _buildAvailabilityTab();
              case 2:
                return _reviewSection();
              default:
                return _buildDescriptionTab();
            }
          }),

          // _buildCollapsibleSection("Description", true),
          // const SizedBox(height: 10),

          // const SizedBox(height: 20),
          // _buildCollapsibleSection("Rule", true),
        ],
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCollapsibleSection("Description", true),
        const SizedBox(height: 10),
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Sed rhoncus, tortor sed eleifend tristique, tortor mauris molestie elit, et lacinia ipsum quam nec dui. Quisque nec mauris sit amet elit iaculis pretium sit amet quis magna. Aenean velit odio, elementum in tempus ut, vehicula eu diam. ",
          style: TextStyle(
            color: Color(0xFF374151),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        _buildCollapsibleSection("Rule", true),
        const SizedBox(height: 10),
        const Text(
          "orem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Sed rhoncus, tortor sed eleifend tristique, tortor mauris molestie elit, et lacinia ipsum quam nec dui. Quisque nec mauris sit ",
          style: TextStyle(
            color: Color(0xFF374151),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildAvailabilityTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Available Days",
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        // ),
        // const SizedBox(height: 12),
        //
        // _availabilityRow("Monday", true),
        // _availabilityRow("Tuesday", true),
        // _availabilityRow("Wednesday", false),
        // _availabilityRow("Thursday", true),
        // _availabilityRow("Friday", false),
      ],
    );
  }

  // Widget _availabilityRow(String day, bool available) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(day, style: const TextStyle(fontSize: 14)),
  //         Text(
  //           available ? "Available" : "Not Available",
  //           style: TextStyle(
  //             color: available ? Colors.green : Colors.red,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _reviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ratingCard(),
        const SizedBox(height: 24),
        _allReviewsHeader(),
        //const SizedBox(height: 12),
        _reviewsList(),
      ],
    );
  }

  // ----------------- INFO GRID -----------------
  Widget _buildInfoGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _infoTile(
            imagePath: "assets/images/location.png",
            val: "14 Kiln Street",
            label: "Location",
          ),
          _infoTile(
            imagePath: "assets/images/star.png",
            val: "4.6",
            label: "Review",
          ),
          _infoTile(
            imagePath: "assets/images/noise.png",
            val: "Low",
            label: "Noise level",
            hasInfo: true,
          ),
          _infoTile(
            imagePath: "assets/images/price.png",
            val: "12 person",
            label: "Price",
          ),
        ],
      ),
    );
  }

  // ----------------- TAB SWITCHER -----------------
  Widget _buildTabSwitcher() {
    List<String> tabs = ["Description", "Availability", "Reviews"];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          return Expanded(
            child: Obx(
              () => GestureDetector(
                onTap: () => controller.selectedTab.value = index,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: controller.selectedTab.value == index
                        ? const Color(0xFF131722)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: controller.selectedTab.value == index
                            ? Colors.white
                            : Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _ratingCard() {
    return Container(
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
                    padding: const EdgeInsets.only(right: 5),
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

  Widget _allReviewsHeader() {
    return Row(
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
    );
  }

  // ---------------- REVIEWS LIST ----------------
  Widget _reviewsList() {
    const itemCount = 3;

    return ListView.builder(
      shrinkWrap: true,
      // ✅ important
      physics: const NeverScrollableScrollPhysics(),

      // ✅ important
      padding: const EdgeInsets.only(top: 16),
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
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
                    "Emily John made learning digital marketing an enjoyable experience...",
                    style: TextStyle(fontSize: 12, color: Color(0xFF111827)),
                  ),
                ],
              ),
            ),
            if (index != itemCount - 1) const Divider(height: 16, thickness: 2),
          ],
        );
      },
    );
  }

  // ----------------- UI HELPERS -----------------
  Widget _circleIcon(IconData icon) => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Icon(icon, size: 22, color: Colors.black87),
  );

  Widget _infoTile({
    IconData? icon,
    String? imagePath,
    required String val,
    required String label,
    Color color = Colors.blue,
    bool hasInfo = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(imagePath, height: 16, width: 16, fit: BoxFit.contain)
            else if (icon != null)
              Icon(icon, size: 16, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF1F2937),
                fontWeight: FontWeight.w400,
              ),
            ),
            if (hasInfo)
              const Icon(Icons.info_outline, size: 10, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          val,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCollapsibleSection(String title, bool isExpanded) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
