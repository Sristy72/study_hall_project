import 'package:flutter/material.dart';
import 'package:flutx_core/flutx_core.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/common/widgets/app_logo.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';
import 'package:study_hall_project/features/auth/screens/register_info_screen.dart';


import '../../../../core/common/widgets/button_widgets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/input_decoration_extensions.dart';

class RegisterEmailScreen extends StatefulWidget {
  const RegisterEmailScreen({super.key});

  @override
  State<RegisterEmailScreen> createState() => _RegisterEmailScreenState();
}

class _RegisterEmailScreenState extends State<RegisterEmailScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    DPrint.log("message");
    Get.to(() => RegisterInfoScreen(email: _emailTEController.text.trim()));
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60), // Optional top spacing
                            // Logo
                            AppLogo(
                              height: 80,
                              width: 199,
                              images: "assets/images/logo.png",
                            ),

                            const SizedBox(height: 24),

                            // Title
                            Align(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Join Study Hall',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),

                            "Register your account to get started."
                                .text16w400()
                                .align(Alignment.topLeft),

                            Gap(h: 48),

                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Enter Your Email',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ),

                            const SizedBox(height: 4),

                            TextFormField(
                              controller: _emailTEController,
                              focusNode: _emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textBlack,
                              ),
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    hintText: "Ex. john@.com",
                                    filled: true,
                                    fillColor: const Color(0xFFF3F4F6),
                                  ),
                              validator: Validators.email,
                              onFieldSubmitted: (_) => _submit(),
                              autofillHints: const [AutofillHints.email],
                            ),

                            Gap(h: 24),

                            // Login Button
                            PrimaryButton(
                              height: 56,
                              onApiPressed: () {
                                return _submit();
                              },
                              text: 'Next',
                            ),

                            const SizedBox(height: 32),

                            // OR Divider
                            const Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(color: Color(0xFF5D6A85)),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 32),

                            // Social Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _socialButton('assets/images/fb.png'),
                                const SizedBox(width: 32),
                                _socialButton('assets/images/google.png'),
                                const SizedBox(width: 32),
                                _socialButton('assets/images/insta.png'),
                              ],
                            ),

                            const SizedBox(height: 60), // Bottom spacing
                            // Register Link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an Account? ",
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: AppColors.primaryBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 40),
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

  Widget _socialButton(String assetPath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF9CA3AF)),
        // shape: BoxShape.circle,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     blurRadius: 8,
        //     offset: const Offset(0, 4),
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset(assetPath),
      ),
    );
  }
}
