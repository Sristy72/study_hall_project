import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:flutx_core/flutx_core.dart';
import 'package:study_hall_project/core/common/constants/back_button.dart';
import 'package:study_hall_project/core/theme/app_colors.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';
import 'package:study_hall_project/core/theme/input_decoration_extensions.dart';
import 'package:study_hall_project/features/auth/screens/verification_code_screen.dart';


import '../widget/minor_profile_card.dart';
import 'add_minor_screen.dart';

class RegisterInfoScreen extends StatefulWidget {
  final String email;
  const RegisterInfoScreen({super.key, required this.email});

  @override
  State<RegisterInfoScreen> createState() => _RegisterInfoScreenState();
}

class _RegisterInfoScreenState extends State<RegisterInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailTextController;
  final TextEditingController _nameTextController = TextEditingController();
  final FocusNode _nameTextFocus = FocusNode();

  final TextEditingController _passTextController = TextEditingController();
  final FocusNode _passTextFocus = FocusNode();

  final TextEditingController _confirmPassTextController =
      TextEditingController();
  final FocusNode _confirmPassTextFocus = FocusNode();

  // Gender & DOB
  String? _selectedGender;
  DateTime? _selectedDate;

  // Password visibility
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final List<String> _genders = ['Male', 'Female', 'Other'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(
        const Duration(days: 365 * 18),
      ), // Default: 18 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: AppColors.primaryBlue),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String? _formatDate(DateTime? date) {
    if (date == null) return null;
    return DateFormat('dd / MM / yyyy').format(date);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    // Additional checks
    if (_selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your gender')),
      );
      return;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your date of birth')),
      );
      return;
    }

    if (_passTextController.text != _confirmPassTextController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    // All good → proceed with registration
    debugPrint('Registration Data:');
    debugPrint('Email: ${widget.email}');
    debugPrint('Name: ${_nameTextController.text}');
    debugPrint('Gender: $_selectedGender');
    debugPrint('DOB: ${_formatDate(_selectedDate)}');
    debugPrint('Password: ${_passTextController.text}');
  }

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _nameTextController.dispose();
    _passTextController.dispose();
    _confirmPassTextController.dispose();
    _nameTextFocus.dispose();
    _passTextFocus.dispose();
    _confirmPassTextFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, -4), // 👈 top shadow
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MinorProfileCard(
                    photoUrl: 'assets/images/add_minor.jpg', // Replace with your actual image URL or use AssetImage
                    label: 'Minor 1',
                    name: 'Sara Lim',
                    isFemale: true, // true for female icon, false for male
                    birthDate: '13 / 05 / 2010',
                  ),
                  SizedBox(height: 8,),
                  // + Add Minors Button
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const AddMinorScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDBEAFE),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0, // important
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '+',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3B82F6),
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Add Minors',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 13),

                  // Register Button
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){Get.to(() => VerificationCodeScreen());},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                      minWidth: 300,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -8), // move up by 6px
                              child: CustomBackButton(),
                            ),


                            const SizedBox(height: 20),
                            Center(
                              child: const Text(
                                'Register Your Account',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            const SizedBox(height: 32),

                            // Email (Read-only)
                            TextFormField(
                              controller: _emailTextController,
                              readOnly: true,
                              style: const TextStyle(color: Color(0xFF9CA3AF)),
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF3F4F6),
                                  ),
                            ),

                            const SizedBox(height: 16),

                            // Full Name
                            const Text(
                              'Enter Your Full Name',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: _nameTextController,
                              focusNode: _nameTextFocus,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                    prefixIcon: const Icon(
                                      Icons.person_outline,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    hintText: "Ex. John de",
                                    filled: true,
                                    fillColor: const Color(0xFFF3F4F6),
                                  ),
                              validator: (value) =>
                                  value?.trim().isEmpty == true
                                  ? 'Please enter your name'
                                  : null,
                              onFieldSubmitted: (_) => FocusScope.of(
                                context,
                              ).requestFocus(_passTextFocus),
                            ),

                            const SizedBox(height: 16),

                            // Gender Dropdown
                            const Text(
                              'Enter your Gender',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 4),
                            DropdownButtonFormField<String>(
                              initialValue: _selectedGender,
                              hint: const Text(
                                'Ex. male',
                                style: TextStyle(color: Color(0xFF9CA3AF)),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFF9CA3AF),
                              ),
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                    prefixIcon: const Icon(
                                      Icons.wc_outlined,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF3F4F6),
                                  ),
                              items: _genders.map((gender) {
                                return DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                );
                              }).toList(),
                              onChanged: (value) =>
                                  setState(() => _selectedGender = value),
                              validator: (value) =>
                                  value == null ? 'Please select gender' : null,
                            ),

                            const SizedBox(height: 16),

                            // Date of Birth
                            const Text(
                              'Enter your Date of Birth',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 4),
                            InkWell(
                              onTap: () => _selectDate(context),
                              child: InputDecorator(
                                decoration: context.primaryInputDecoration
                                    .copyWith(
                                      prefixIcon: const Icon(
                                        Icons.calendar_today_outlined,
                                        color: Color(0xFF9CA3AF),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFF3F4F6),
                                      hintText: "Ex. 20 / 03 / 2001",
                                    ),
                                child: Text(
                                  _selectedDate == null
                                      ? 'Ex. 20 / 03 / 2001'
                                      : _formatDate(_selectedDate)!,
                                  style: TextStyle(
                                    color: _selectedDate == null
                                        ? const Color(0xFF9CA3AF)
                                        : Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Password
                            const Text(
                              'Enter your Password',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: _passTextController,
                              focusNode: _passTextFocus,
                              obscureText: _obscurePassword,
                              textInputAction: TextInputAction.next,
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    hintText: "Enter strong password",
                                    filled: true,
                                    fillColor: const Color(0xFFF3F4F6),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () => setState(
                                        () => _obscurePassword =
                                            !_obscurePassword,
                                      ),
                                    ),
                                  ),
                              validator: Validators.password,
                              onFieldSubmitted: (_) => FocusScope.of(
                                context,
                              ).requestFocus(_confirmPassTextFocus),
                            ),

                            const SizedBox(height: 16),

                            // Confirm Password
                            const Text(
                              'Confirm Password',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: _confirmPassTextController,
                              focusNode: _confirmPassTextFocus,
                              obscureText: _obscureConfirmPassword,
                              textInputAction: TextInputAction.done,
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    hintText: "Re-type your password",
                                    filled: true,
                                    fillColor: const Color(0xFFF3F4F6),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureConfirmPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () => setState(
                                        () => _obscureConfirmPassword =
                                            !_obscureConfirmPassword,
                                      ),
                                    ),
                                  ),
                              validator: (value) {
                                if (value != _passTextController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) => _submit(),
                            ),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
