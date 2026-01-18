import 'package:flutter/material.dart';
import 'package:flutx_core/core/validation/validators.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/theme/app_colors.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';
import 'package:study_hall_project/core/utils/debug_print.dart';
import 'package:study_hall_project/features/auth/screens/register_email_screen.dart';

import '../../../../core/common/widgets/button_widgets.dart';
import '../../../../core/theme/input_decoration_extensions.dart';
import '../../../../navigation_menu_student.dart';
import '../controller/auth_controller.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  final TextEditingController _passTextController = TextEditingController();
  final FocusNode _passFocusNode = FocusNode();

  // Controller
  final _authCtrl = Get.put(AuthController());

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    DPrint.log("message");
    await _authCtrl.login(
      email: _emailTextController.text.trim(),
      password: _passTextController.text,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 60), // Optional top spacing
                            // Logo
                            Image.asset(
                              'assets/images/logo.png',
                              width: 167.08,
                              height: 67,
                            ),
                            const SizedBox(height: 24),

                            // Title
                            const Text(
                              'Login To Study Hall',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 48),

                            // Email Label & Field
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
                              controller: _emailTextController,
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
                              onFieldSubmitted: (_) =>
                                  FocusScope.of(context).unfocus(),
                              autofillHints: const [AutofillHints.email],
                            ),

                            const SizedBox(height: 12),

                            // Password Label & Field
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Enter Your Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: _passTextController,
                              focusNode: _passFocusNode,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              obscureText: true, // You can add toggle later
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.textBlack,
                              ),
                              decoration: context.primaryInputDecoration
                                  .copyWith(
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                    hintText: "password",
                                    filled: true,
                                    fillColor: const Color(0xFFF3F4F6),
                                  ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) => _submit(),
                              autofillHints: const [AutofillHints.password],
                            ),

                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.to(() => ForgotPasswordScreen());
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    color: AppColors.primaryBlue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),

                            // Login Button
                            PrimaryButton(
                              height: 56,
                              onSimplePressed: () {
                                Get.to(() => CustomBottomNav());
                              },
                              text: 'Login',
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
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => RegisterEmailScreen());
                                  },
                                  child: const Text(
                                    'Register Now',
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
