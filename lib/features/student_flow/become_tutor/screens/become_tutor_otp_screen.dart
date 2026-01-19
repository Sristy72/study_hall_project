import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/theme/app_colors.dart';
import 'become_tutor_success_dialog.dart';

class BecomeTutorOtpScreen extends StatefulWidget {
  const BecomeTutorOtpScreen({super.key});

  @override
  State<BecomeTutorOtpScreen> createState() => _BecomeTutorOtpScreenState();
}

class _BecomeTutorOtpScreenState extends State<BecomeTutorOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  int _remainingSeconds = 133; // 2:13 in seconds
  bool _isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _isTimerRunning) {
        setState(() {
          if (_remainingSeconds > 0) {
            _remainingSeconds--;
            _startTimer();
          } else {
            _isTimerRunning = false;
          }
        });
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  void _verifyOtp() {
    if (_otpController.text.length == 4) {
      // Show success dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const BecomeTutorSuccessDialog(),
      );
    } else {
      Get.snackbar('Error', 'Please enter complete OTP code');
    }
  }

  void _resendCode() {
    if (!_isTimerRunning) {
      setState(() {
        _remainingSeconds = 133;
        _isTimerRunning = true;
        _startTimer();
      });
      Get.snackbar('Success', 'OTP code resent to your email');
    }
  }

  @override
  void dispose() {
    // _otpController.dispose();
    _isTimerRunning = false;
    super.dispose();
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
          children: [
            const SizedBox(height: 40),
            // Illustration
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background circle
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Card illustration
                  Container(
                    width: 140,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhite,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Profile icon
                        Positioned(
                          left: 16,
                          top: 20,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: AppColors.primaryWhite,
                              size: 24,
                            ),
                          ),
                        ),
                        // Text lines
                        Positioned(
                          right: 16,
                          top: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 40,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Checkmark
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: AppColors.primaryWhite,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // OTP Verification Title
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Enter the verification code we just sent on your email address.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.greyText,
              ),
            ),
            const SizedBox(height: 40),
            // OTP Input Fields
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: _otpController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: AppColors.primaryWhite,
                inactiveFillColor: AppColors.primaryWhite,
                selectedFillColor: AppColors.primaryWhite,
                activeColor: AppColors.primaryBlue,
                inactiveColor: AppColors.lightGrey,
                selectedColor: AppColors.primaryBlue,
              ),
              cursorColor: AppColors.primaryBlue,
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
              onCompleted: (value) {
                _verifyOtp();
              },
            ),
            const SizedBox(height: 24),
            // Resend Code Timer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resend code in ',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.greyText,
                  ),
                ),
                GestureDetector(
                  onTap: _isTimerRunning ? null : _resendCode,
                  child: Text(
                    _formatTime(_remainingSeconds),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _isTimerRunning
                          ? AppColors.primaryBlue
                          : AppColors.primaryBlue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
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
              onPressed: _verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Verify',
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
}
