import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/auth/screens/login_screen.dart';

import '../../../core/theme/app_colors.dart';

void showPassSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const PasswordChangeSuccessDialog();
    },
  );
}

class PasswordChangeSuccessDialog extends StatelessWidget {
  const PasswordChangeSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Main dialog content
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(18.0),
            constraints: const BoxConstraints(maxWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/Frame.png', // Replace with your actual path
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 32),

                const Text(
                  'Congratulation !',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),
                const Text(
                  'Your Password has been updated Successfully',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Back to Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30), // Extra space to prevent overlap with the cross button
              ],
            ),
          ),
        ),

        // Cross button at the bottom
        Positioned(
          bottom: 10, // Adjust this value to fine-tune the position
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 64,
              height: 64,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black26,
                //     blurRadius: 10,
                //     offset: Offset(0, 4),
                //   ),
                // ],
              ),
              child: const Icon(
                Icons.close,
                color: Color(0xFF07335B),
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class PasswordChangeFailDialog extends StatelessWidget {
  const PasswordChangeFailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Main dialog content
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(18.0),
            constraints: const BoxConstraints(maxWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/pass_fail_dialog.png', // Replace with your actual path
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 32),

                const Text(
                  'Opps...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),
                const Text(
                  'Create new password has failed please try again',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Back to Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30), // Extra space to prevent overlap with the cross button
              ],
            ),
          ),
        ),

        // Cross button at the bottom
        Positioned(
          bottom: 10, // Adjust this value to fine-tune the position
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 64,
              height: 64,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black26,
                //     blurRadius: 10,
                //     offset: Offset(0, 4),
                //   ),
                // ],
              ),
              child: const Icon(
                Icons.close,
                color: Color(0xFF07335B),
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}