import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutx_core/core/validation/validators.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:study_hall_project/features/auth/screens/otp_verify_forget_pass.dart';
import 'package:study_hall_project/features/auth/screens/verification_code_screen.dart';

import '../../../core/common/constants/back_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/theme/input_decoration_extensions.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
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
                            Text('Forgot Password', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),),

                            Text(
                              'Please enter your email address to receive a verification code',
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF374151)),),

                            SizedBox(height: 32,),

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
                              focusNode: _emailFocus,
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
                              //onFieldSubmitted: (_) => _submit(),
                              autofillHints: const [AutofillHints.email],
                            ),

                            SizedBox(height: 32,),

                            SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){Get.to(() => OtpVerifyForgetPass());},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Submit',
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
