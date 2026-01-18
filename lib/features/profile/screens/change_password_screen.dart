import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutx_core/core/validation/validators.dart';
import 'package:get/get.dart';

import '../../../../core/common/constants/back_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decorations.dart';
import '../../../../core/theme/input_decoration_extensions.dart';
import '../widget/password_change_dialog.dart';
import 'forgot_password_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _currentPassController =
      TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController =
      TextEditingController();

  final FocusNode _currentPassFocus = FocusNode();
  final FocusNode _newPassFocus = FocusNode();
  final FocusNode _confirmPassFocus = FocusNode();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    _currentPassFocus.dispose();
    _newPassFocus.dispose();
    _confirmPassFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showPasswordSuccessDialog(
      context,
      message: 'Your password has been updated successfully.',
      buttonText: 'Done',
      onTap: () => Get.back(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.translate(
                                offset: const Offset(0, -8),
                                child: CustomBackButton(),
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              'Your password must have 6-16 charctes',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF374151),
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Current Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: _currentPassController,
                              focusNode: _currentPassFocus,
                              obscureText: _obscureCurrent,
                              textInputAction: TextInputAction.next,
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF9CA3AF),
                                ),
                                hintText: 'Enter your current password',
                                filled: true,
                                fillColor: const Color(0xFFF3F4F6),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureCurrent
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscureCurrent = !_obscureCurrent,
                                  ),
                                ),
                              ),
                              validator: Validators.password,
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_newPassFocus),
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forgot Password',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2563EB),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(
                                        () => const ForgotPasswordScreen(),
                                      );
                                    },
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Enter your new password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: _newPassController,
                              focusNode: _newPassFocus,
                              obscureText: _obscureNew,
                              textInputAction: TextInputAction.next,
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF9CA3AF),
                                ),
                                hintText: 'Enter strong password',
                                filled: true,
                                fillColor: const Color(0xFFF3F4F6),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureNew
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscureNew = !_obscureNew,
                                  ),
                                ),
                              ),
                              validator: Validators.password,
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_confirmPassFocus),
                            ),
                            const SizedBox(height: 16),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Confirm Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: _confirmPassController,
                              focusNode: _confirmPassFocus,
                              obscureText: _obscureConfirm,
                              textInputAction: TextInputAction.done,
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF9CA3AF),
                                ),
                                hintText: 'Re-type your password',
                                filled: true,
                                fillColor: const Color(0xFFF3F4F6),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirm
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscureConfirm = !_obscureConfirm,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value != _newPassController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Change password',
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
