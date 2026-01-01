import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/auth/widget/dialog.dart';

import '../../../core/common/constants/back_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_decorations.dart';
import '../widget/pincode.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController otpController = TextEditingController();

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

                            SizedBox(height: 32,),
                            Text('Verification Code', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),),
                            
                            Text(
                              'Please enter the 4 digit code We Sent to your Email Address',
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF374151)),),

                            SizedBox(height: 32,),

                            PinCode(otpController: otpController),

                            SizedBox(height: 32,),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6B7280), // default grey text
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Didn’t see any OTP code? ",
                                  ),
                                  TextSpan(
                                    text: "Resend",
                                    style: const TextStyle(
                                      color: Color(0xFF2563EB), // blue resend text
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // 🔁 Resend OTP logic here
                                        print("Resend OTP tapped");
                                      },
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 24,),

                            SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  showSuccessDialog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Verify',
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
