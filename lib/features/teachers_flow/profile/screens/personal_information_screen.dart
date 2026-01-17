import 'package:flutter/material.dart';
import 'package:study_hall_project/core/common/constants/back_button.dart';
import 'package:study_hall_project/core/theme/app_colors.dart';

class TeacherPersonalInformationScreen extends StatefulWidget {
  const TeacherPersonalInformationScreen({super.key});

  @override
  State<TeacherPersonalInformationScreen> createState() =>
      _TeacherPersonalInformationScreenState();
}

class _TeacherPersonalInformationScreenState
    extends State<TeacherPersonalInformationScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'John Steward');
  final TextEditingController _genderController =
      TextEditingController(text: 'Male');
  final TextEditingController _dobController =
      TextEditingController(text: '02 / 03 / 1980');
  int _selectedTab = 0;
  bool _isSaveEnabled = true;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateSaveState);
    _genderController.addListener(_updateSaveState);
    _dobController.addListener(_updateSaveState);
    _updateSaveState();
  }

  void _updateSaveState() {
    final isEnabled = _nameController.text.trim().isNotEmpty &&
        _genderController.text.trim().isNotEmpty &&
        _dobController.text.trim().isNotEmpty;
    if (isEnabled != _isSaveEnabled) {
      setState(() => _isSaveEnabled = isEnabled);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  CustomBackButton2(),
                  SizedBox(width: 16),
                  Text(
                    'Personal information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(
                height: 1.5,
                thickness: 1.5,
                color: Color(0xFFE5E7EB),
              ),
              const SizedBox(height: 24),
              _buildSegmentedControl(),
              const SizedBox(height: 30),
              _buildProfileSection(),
              const SizedBox(height: 24),
              _buildLabel('Enter Your Full Name'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: _fieldDecoration(
                  hintText: 'John Steward',
                  prefixIcon: Icons.person_outline,
                ),
              ),
              const SizedBox(height: 16),
              _buildLabel('Enter your Gender'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _genderController,
                readOnly: true,
                decoration: _fieldDecoration(
                  hintText: 'Male',
                  prefixIcon: Icons.male,
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                ),
              ),
              const SizedBox(height: 16),
              _buildLabel('Enter your Date of Birth'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _dobController,
                readOnly: true,
                decoration: _fieldDecoration(
                  hintText: '02 / 03 / 1980',
                  prefixIcon: Icons.calendar_today_outlined,
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaveEnabled ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    disabledBackgroundColor: const Color(0xFFD1D5DB),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildSegmentButton('General Information', 0),
          ),
          Expanded(
            child: _buildSegmentButton('Tutor KYC', 1),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentButton(String label, int index) {
    final bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF111827) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF111827),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/cb1a2b0d21866a9ca96f2f09c68d61371e199ac9.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -6,
              right: -6,
              child: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'john@gmail.com',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color(0xFF111827),
      ),
    );
  }

  InputDecoration _fieldDecoration({
    required String hintText,
    required IconData prefixIcon,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: const Color(0xFFF5F6F8),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      prefixIcon: Icon(prefixIcon, color: const Color(0xFF374151)),
      suffixIcon: suffixIcon != null
          ? Icon(suffixIcon, color: const Color(0xFF6B7280))
          : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF93C5FD)),
      ),
    );
  }
}
