import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';
import 'become_tutor_otp_screen.dart';

class BecomeTutorExperienceScreen extends StatefulWidget {
  const BecomeTutorExperienceScreen({super.key});

  @override
  State<BecomeTutorExperienceScreen> createState() => _BecomeTutorExperienceScreenState();
}

class _BecomeTutorExperienceScreenState extends State<BecomeTutorExperienceScreen> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _majorController = TextEditingController();
  
  String? _selectedOccupation;
  String? _selectedEducationLevel;
  String? _selectedCategory;
  List<File> _documentImages = [];

  final List<String> _occupations = [
    'Teacher',
    'Professor',
    'Instructor',
    'Tutor',
    'Educator',
    'Other',
  ];

  final List<String> _educationLevels = [
    'High School',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'PhD',
    'Professional Certification',
  ];

  final List<String> _categories = [
    'Mathematics',
    'Science',
    'Language',
    'Arts',
    'Technology',
    'Business',
    'Music',
    'Sports',
  ];

  Future<void> _pickDocuments() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        setState(() {
          _documentImages.addAll(
            images
                .where((img) => img.path.isNotEmpty)
                .map((img) => File(img.path)),
          );
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick images: $e');
    }
  }

  void _removeDocument(int index) {
    setState(() {
      _documentImages.removeAt(index);
    });
  }

  void _navigateToNext() {
    if (_selectedOccupation == null ||
        _selectedEducationLevel == null ||
        _majorController.text.isEmpty ||
        _selectedCategory == null) {
      Get.snackbar('Required', 'Please fill all required fields');
      return;
    }
    Get.to(() => const BecomeTutorOtpScreen());
  }

  void _submit() {
    if (_documentImages.isEmpty) {
      Get.snackbar('Required', 'Please upload at least one document');
      return;
    }
    _navigateToNext();
  }

  @override
  void dispose() {
    _majorController.dispose();
    super.dispose();
  }

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
          'Become a Tutor',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // Step indicator
            Text(
              'Step 2/2',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            // Experience Information title
            const Text(
              'Experience Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 24),
            const Divider(color: AppColors.lightGrey),
            const SizedBox(height: 24),
            // Occupation Field
            const Text(
              'Occupation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 8),
            _buildDropdownField(
              value: _selectedOccupation,
              hint: 'Select',
              onTap: () => _showSelectionDialog('Occupation', _occupations, (value) {
                setState(() => _selectedOccupation = value);
              }),
            ),
            const SizedBox(height: 20),
            // Education Level Field
            const Text(
              'Education Level',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 8),
            _buildDropdownField(
              value: _selectedEducationLevel,
              hint: 'Select',
              onTap: () => _showSelectionDialog('Education Level', _educationLevels, (value) {
                setState(() => _selectedEducationLevel = value);
              }),
            ),
            const SizedBox(height: 20),
            // Major Field
            const Text(
              'Major',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _majorController,
              decoration: InputDecoration(
                hintText: 'Enter your Major',
                hintStyle: TextStyle(color: AppColors.greyText),
                filled: true,
                fillColor: AppColors.primaryWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primaryBlue, width: 1),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
            const SizedBox(height: 20),
            // Categories Field
            const Text(
              'Categories that you can teach',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 8),
            _buildDropdownField(
              value: _selectedCategory,
              hint: 'Select',
              onTap: () => _showSelectionDialog('Categories', _categories, (value) {
                setState(() => _selectedCategory = value);
              }),
            ),
            const SizedBox(height: 24),
            // Upload Documents Section
            const Text(
              'Upload Your Documents',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please upload/take a photo of your education certification and other certifications that relevant to categories that you can teach.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.greyText,
              ),
            ),
            const SizedBox(height: 16),
            // Document Upload Area
            GestureDetector(
              onTap: _pickDocuments,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.lightGrey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, color: AppColors.greyText, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      '+ Upload documents',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Display uploaded documents
            if (_documentImages.isNotEmpty) ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(_documentImages.length, (index) {
                  return Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            _documentImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => _removeDocument(index),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.primaryWhite,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
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
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _navigateToNext,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.lightGrey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryWhite,
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

  Widget _buildDropdownField({
    required String? value,
    required String hint,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightGrey, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? hint,
              style: TextStyle(
                fontSize: 16,
                color: value != null ? AppColors.textBlack : AppColors.greyText,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.greyText),
          ],
        ),
      ),
    );
  }

  void _showSelectionDialog(String title, List<String> options, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  return ListTile(
                    title: Text(option),
                    onTap: () {
                      onSelect(option);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
