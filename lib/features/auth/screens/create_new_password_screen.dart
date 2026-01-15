import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutx_core/core/validation/validators.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../core/common/constants/back_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decorations.dart';
import '../../../../core/theme/input_decoration_extensions.dart';
import '../widget/password_change_dialog.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _passTextController = TextEditingController();
  final TextEditingController _confirmPassTextController = TextEditingController();

  final FocusNode _passTextFocus = FocusNode();
  final FocusNode _confirmPassTextFocus = FocusNode();

  // Password visibility
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
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

                            SizedBox(height: 32,),
                            Text('Create New Password', textAlign: TextAlign.start, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),),

                            Text(
                              'Your password must have 6-16 charctes',
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF374151)),),

                            SizedBox(height: 32,),

                            // Password
                            Align(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Enter your Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1F2937),
                                ),
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Confirm Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1F2937),
                                ),
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
                              //onFieldSubmitted: (_) => _submit(),
                            ),

                            SizedBox(height: 32,),

                            SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){showPassSuccessDialog(context);},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Reset Password',
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
