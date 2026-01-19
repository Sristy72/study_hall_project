import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';
import 'become_tutor_experience_screen.dart';

class BecomeTutorKycScreen extends StatefulWidget {
  const BecomeTutorKycScreen({super.key});

  @override
  State<BecomeTutorKycScreen> createState() => _BecomeTutorKycScreenState();
}

class _BecomeTutorKycScreenState extends State<BecomeTutorKycScreen> {
  final ImagePicker _picker = ImagePicker();
  String? _selectedIdType = 'Social Security Number';
  File? _frontSideImage;
  File? _backSideImage;
  File? _selfieImage;

  final List<String> _idTypes = [
    'Social Security Number',
    'Driver License',
    'Passport',
    'National ID',
  ];

  Future<void> _pickImage(ImageSource source, String type) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          if (type == 'front') {
            _frontSideImage = File(image.path);
          } else if (type == 'back') {
            _backSideImage = File(image.path);
          } else if (type == 'selfie') {
            _selfieImage = File(image.path);
          }
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void _showImageSourceDialog(String type) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera, type);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery, type);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNext() {
    if (_frontSideImage == null || _backSideImage == null || _selfieImage == null) {
      Get.snackbar('Required', 'Please upload all required images');
      return;
    }
    Get.to(() => const BecomeTutorExperienceScreen());
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
              'Step 1/2',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            // KYC Documents title
            const Text(
              'KYC Documents',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please upload/take photos as a instruction below',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.greyText,
              ),
            ),
            const SizedBox(height: 24),
            // ID Type Selection
            const Text(
              'Select ID Type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _idTypes.map((type) {
                        return ListTile(
                          title: Text(type),
                          onTap: () {
                            setState(() {
                              _selectedIdType = type;
                            });
                            Navigator.pop(context);
                          },
                          trailing: _selectedIdType == type
                              ? const Icon(Icons.check, color: AppColors.primaryBlue)
                              : null,
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
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
                      _selectedIdType ?? 'Select',
                      style: TextStyle(
                        fontSize: 16,
                        color: _selectedIdType != null
                            ? AppColors.textBlack
                            : AppColors.greyText,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: AppColors.greyText),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Upload ID Proof Section
            const Text(
              'Upload Your ID Proof',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Upload Your Government-Issued Identification Document',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.greyText,
              ),
            ),
            const SizedBox(height: 16),
            // Front and Back Side Upload
            Row(
              children: [
                Expanded(
                  child: _buildImageUploadBox(
                    'Front Side',
                    _frontSideImage,
                    () => _showImageSourceDialog('front'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildImageUploadBox(
                    'Back Side',
                    _backSideImage,
                    () => _showImageSourceDialog('back'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Take a Selfie Section
            const Text(
              'Take a Selfie',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _showImageSourceDialog('selfie'),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add, color: AppColors.primaryBlue, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Add a Selfie',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_selfieImage != null) ...[
              const SizedBox(height: 12),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.lightGrey),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    _selfieImage!,
                    fit: BoxFit.cover,
                  ),
                ),
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
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _navigateToNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploadBox(String label, File? image, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.lightGrey,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, color: AppColors.greyText, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    '+',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.file(
                      image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (label == 'Front Side') {
                              _frontSideImage = null;
                            } else {
                              _backSideImage = null;
                            }
                          });
                        },
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
                ),
              ),
      ),
    );
  }
}
