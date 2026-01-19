import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';

class EditCourseScreen extends StatefulWidget {
  const EditCourseScreen({super.key});

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  final TextEditingController _titleController = TextEditingController(text: 'How to write Cover Letter');
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  
  String _selectedCategory = 'art';
  String _selectedSubCategory = 'wall art';
  double _tuitionFee = 25.0;
  String _selectedStudent = '1';
  String _selectedDuration = '1 Hr';
  String _selectedTime = '2 Pm';
  String _selectedState = 'California';
  String _selectedCity = 'Los Angeles';
  String _selectedCancellationPolicy = 'Flexible';
  
  int _selectedDateIndex = 1;
  final List<String> _dates = ['Thu 26', 'Fri 27', 'Sat 28', 'Sun 29', 'Mon 30'];
  
  final List<String> _tags = ['Lifestyle'];
  final List<String> _categories = ['art', 'design', 'technology', 'business', 'science'];
  final List<String> _subCategories = ['wall art', 'digital art', 'painting', 'sculpture'];
  final List<String> _students = ['1', '2', '3', '4', '5'];
  final List<String> _durations = ['1 Hr', '2 Hr', '3 Hr', '4 Hr'];
  final List<String> _times = ['2 Pm', '3 Pm', '4 Pm', '5 Pm', '6 Pm'];
  final List<String> _states = ['California', 'New York', 'Texas', 'Florida'];
  final List<String> _cities = ['Los Angeles', 'San Francisco', 'San Diego'];
  final List<String> _cancellationPolicies = ['Flexible', 'Moderate', 'Strict'];

  void _showCancellationPolicyModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Cancelation Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 20),
            ..._cancellationPolicies.map((policy) {
              return RadioListTile<String>(
                title: Text(policy),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque.',
                  style: TextStyle(fontSize: 12, color: AppColors.greyText),
                ),
                value: policy,
                groupValue: _selectedCancellationPolicy,
                onChanged: (value) {
                  setState(() {
                    _selectedCancellationPolicy = value!;
                  });
                  Navigator.pop(context);
                },
              );
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _addTag() {
    if (_tagController.text.isNotEmpty && !_tags.contains(_tagController.text)) {
      setState(() {
        _tags.add(_tagController.text);
        _tagController.clear();
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textBlack),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Edit Course',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information
            const Text(
              'Basic information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 16),
            
            // Session Title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Session title',
                labelStyle: const TextStyle(color: AppColors.greyText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primaryBlue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Description
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: const TextStyle(color: AppColors.greyText),
                hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                hintStyle: TextStyle(color: AppColors.greyText, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primaryBlue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Add Cover Photo
            const Text(
              'Add cover photo',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.lightGrey,
                      child: const Center(
                        child: Icon(Icons.add_photo_alternate, size: 40, color: AppColors.greyText),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Session Category
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Session category',
                labelStyle: const TextStyle(color: AppColors.greyText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
              ),
              items: _categories.map((cat) => DropdownMenuItem(
                value: cat,
                child: Text(cat),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Session Sub-category
            DropdownButtonFormField<String>(
              initialValue: _selectedSubCategory,
              decoration: InputDecoration(
                labelText: 'Session sub-category',
                labelStyle: const TextStyle(color: AppColors.greyText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
              ),
              items: _subCategories.map((cat) => DropdownMenuItem(
                value: cat,
                child: Text(cat),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSubCategory = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Add Tags
            const Text(
              'Add Tags',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tagController,
                    decoration: InputDecoration(
                      hintText: 'Add tag',
                      hintStyle: const TextStyle(color: AppColors.greyText),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.lightGrey),
                      ),
                    ),
                    onSubmitted: (_) => _addTag(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add, color: AppColors.primaryBlue),
                  onPressed: _addTag,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  backgroundColor: Colors.yellow[100],
                  deleteIcon: const Icon(Icons.close, size: 18),
                  onDeleted: () => _removeTag(tag),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            
            // Tuition Fee
            const Text(
              'Tuition fee per hour per person',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Slider(
              value: _tuitionFee,
              min: 0,
              max: 100,
              divisions: 100,
              label: '\$${_tuitionFee.toStringAsFixed(0)}',
              activeColor: AppColors.primaryBlue,
              onChanged: (value) {
                setState(() {
                  _tuitionFee = value;
                });
              },
            ),
            Center(
              child: Text(
                '\$${_tuitionFee.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Student
            DropdownButtonFormField<String>(
              initialValue: _selectedStudent,
              decoration: InputDecoration(
                labelText: 'Student',
                labelStyle: const TextStyle(color: AppColors.greyText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
              ),
              items: _students.map((s) => DropdownMenuItem(
                value: s,
                child: Text(s),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStudent = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Duration
            DropdownButtonFormField<String>(
              initialValue: _selectedDuration,
              decoration: InputDecoration(
                labelText: 'Duration',
                labelStyle: const TextStyle(color: AppColors.greyText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
              ),
              items: _durations.map((d) => DropdownMenuItem(
                value: d,
                child: Text(d),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDuration = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Session Date
            const Text(
              'Session Date',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20, color: AppColors.greyText),
                const SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_dates.length, (index) {
                        final isSelected = _selectedDateIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDateIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primaryBlue : AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _dates[index],
                              style: TextStyle(
                                color: isSelected ? AppColors.primaryWhite : AppColors.textBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, color: AppColors.greyText),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Session Time
            DropdownButtonFormField<String>(
              initialValue: _selectedTime,
              decoration: InputDecoration(
                labelText: 'Session Time',
                labelStyle: const TextStyle(color: AppColors.greyText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
              ),
              items: _times.map((t) => DropdownMenuItem(
                value: t,
                child: Text(t),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTime = value!;
                });
              },
            ),
            const SizedBox(height: 24),
            
            // Location
            const Text(
              'State Location',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedState,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
              ),
              items: _states.map((s) => DropdownMenuItem(
                value: s,
                child: Text(s),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedState = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            
            const Text(
              'City Location',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedCity,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
              ),
              items: _cities.map((c) => DropdownMenuItem(
                value: c,
                child: Text(c),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value!;
                });
              },
            ),
            const SizedBox(height: 24),
            
            // Cancellation Policy
            Row(
              children: [
                const Text(
                  'Cancelation Policy',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: _showCancellationPolicyModal,
                  child: const Icon(Icons.info_outline, size: 18, color: AppColors.greyText),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGrey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedCancellationPolicy,
                    style: const TextStyle(color: AppColors.textBlack),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.greyText),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save Change',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tagController.dispose();
    super.dispose();
  }
}
