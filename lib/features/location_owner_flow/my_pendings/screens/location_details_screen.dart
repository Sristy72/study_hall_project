import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/location_details_controller.dart';

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
  // ----------------- APPBAR -----------------
  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: _circleIcon(Icons.chevron_left),
          ),
          Obx(
            () => Text(
              controller.locationName.value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          // Replace edit icon with an image
          _circleImage("assets/images/edit_icon.png"),
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
          _buildCollapsibleSection("Description", true),
          const SizedBox(height: 10),
          Text(
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
          Text(
            "orem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Sed rhoncus, tortor sed eleifend tristique, tortor mauris molestie elit, et lacinia ipsum quam nec dui. Quisque nec mauris sit ",
            style: TextStyle(
              color: Color(0xFF374151),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
      ),
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
        Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
      ],
    );
  }
}
