import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/constants/back_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decorations.dart';
import '../../../../core/theme/input_decoration_extensions.dart';
import '../../student_flow/widget/add_minor_image.dart';

class EditMinorScreen extends StatefulWidget {
  const EditMinorScreen({super.key});

  @override
  State<EditMinorScreen> createState() => _EditMinorScreenState();
}

class _EditMinorScreenState extends State<EditMinorScreen> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  // Gender & DOB
  String? _selectedGender;
  DateTime? _selectedDate;

  final List<String> _genders = ['Male', 'Female', 'Other'];

  String? _formatDate(DateTime? date) {
    if (date == null) return null;
    return DateFormat('dd / MM / yyyy').format(date);
  }

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
              offset: const Offset(0, -4), // 👈 shadow goes UP
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // submit logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0, //  important (avoid double shadow)
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
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
                              child: Row(
                                children: [
                                  CustomBackButton(),
                                  SizedBox(width: 24,),
                                  Text('Add Minor',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),)
                                ],
                              ),
                            ),


                            const SizedBox(height: 32),
                            ThinkingGirlWidget(),
                            SizedBox(height: 34,),

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
                              controller: _nameController,
                              focusNode: _nameFocus,
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
                              ).requestFocus(_nameFocus),
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
                              value: _selectedGender,
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
