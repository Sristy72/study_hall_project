import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/edit_controller.dart';
import '../model/edit_location_model.dart';

class WorkspaceEditScreen extends StatelessWidget {
  final EditWorkspaceData initialWorkspace;

  const WorkspaceEditScreen({super.key, required this.initialWorkspace});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(
      WorkspaceEditController(initialWorkspace),
      tag: "edit_${initialWorkspace.name}",
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Edit",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover image area
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: Container(
                height: 162,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFBBBBBB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/edit.png',
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Photos row
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: Row(
                children: [
                  _buildPhotoWithRemove(),
                  const SizedBox(width: 12),
                  _buildPhotoWithRemove(),
                  const SizedBox(width: 12),
                  Container(
                    width: 111.33,
                    height: 105,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFDDDDDD),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.add_rounded,
                      size: 36,
                      color: Color(0xFF0066FF),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Workspace name
            Row(
              children: [
                _buildLabel("ABC Workspace"),

                const Spacer(), // ✅ spacing

                Obx(
                      () => GestureDetector(
                    onTap: ctrl.toggleEditDetails,
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ctrl.isEditingDetails.value
                          ? const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0066FF),
                        ),
                      )
                          : Image.asset(
                        "assets/images/pencil-line.png",
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ─── Description Section ─────────────────────────────────────
            _buildSectionTitle("Description"),
            const SizedBox(height: 8),
            _buildContentContainer(
              child: Obx(
                    () => TextField(
                  enabled: ctrl.isEditingDetails.value, // 👈 control editing
                  controller: TextEditingController(
                    text: ctrl.description.value,
                  ),
                  maxLines: 6,
                  minLines: 4,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter description here...",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (v) => ctrl.description.value = v,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ─── Rule Section ────────────────────────────────────────────
            _buildSectionTitle("Rule"),
            const SizedBox(height: 8),
            _buildContentContainer(
              child: Obx(
                    () => TextField(
                  enabled: ctrl.isEditingDetails.value, // 👈 control editing
                  controller: TextEditingController(text: ctrl.rule.value),
                  maxLines: 6,
                  minLines: 4,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter rules here...",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (v) => ctrl.rule.value = v,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Noise Level - Checkbox style
            Row(
              children: [
                _buildSectionTitle("Noise Level"),
                const SizedBox(width: 8),
                Image.asset(
                  "assets/images/info-circle.png", // 👈 your image
                  width: 16,
                  height: 16,
                  color: const Color(0xFF9CA3AF), // optional
                ),
              ],
            ),

            const SizedBox(height: 12),

            Obx(
                  () => Row(
                children: [
                  _buildNoiseCheckbox(
                    label: "Low",
                    checked: ctrl.noiseLow.value,
                    onTap: () => ctrl.selectNoise("Low"),
                  ),

                  const SizedBox(width: 24),

                  _buildNoiseCheckbox(
                    label: "Moderate",
                    checked: ctrl.noiseModerate.value,
                    onTap: () => ctrl.selectNoise("Moderate"),
                  ),

                  const SizedBox(width: 24),

                  _buildNoiseCheckbox(
                    label: "High",
                    checked: ctrl.noiseHigh.value,
                    onTap: () => ctrl.selectNoise("High"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Max reservations
            _buildSectionTitle("Maximum number of reservation per day"),
            const SizedBox(height: 8),

            Obx(
                  () => SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  showValueIndicator: ShowValueIndicator.always, // 👈 key point
                  valueIndicatorColor: const Color(0xFF3B82F6),
                  valueIndicatorTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Slider(
                  value: ctrl.maxReservations.value,
                  min: 1,
                  max: 30,
                  activeColor: const Color(0xFF3B82F6),
                  inactiveColor: Colors.grey.shade300,
                  label: ctrl.maxReservations.value
                      .round()
                      .toString(), // 👈 follows thumb
                  onChanged: (v) => ctrl.maxReservations.value = v,
                ),
              ),
            ),

            const SizedBox(height: 48),

            // Save button
            // ── Bottom Container (footer) ─────────────
            Container(
              width: double.infinity,

              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ctrl.saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Save Change",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0XFF1F2937),
      ),
    );
  }

  Widget _buildContentContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0XFFD1D5DB), width: 1),
      ),
      child: child,
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Color(0xFF111827),
      ),
    );
  }

  Widget _buildTextField({
    required String initial,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: TextEditingController(text: initial),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0XFFD1D5DB)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildPhotoWithRemove() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 111.3,
          height: 105,
          decoration: BoxDecoration(
            color: const Color(0xFFDDDDDD),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: const Icon(
            Icons.close_rounded,
            color: Colors.redAccent,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildNoiseCheckbox({
    required String label,
    required bool checked,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: checked ? const Color(0xFF0066FF) : Colors.grey.shade400,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6),
              color: checked ? const Color(0xFF0066FF) : Colors.white,
            ),
            child: checked
                ? const Icon(Icons.check_rounded, size: 18, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}