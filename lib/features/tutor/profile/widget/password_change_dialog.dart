import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';

void showPasswordSuccessDialog(
  BuildContext context, {
  required String message,
  required String buttonText,
  required VoidCallback onTap,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => PasswordChangeDialog(
      isSuccess: true,
      title: 'Congratulation!',
      message: message,
      imagePath: 'assets/images/Frame.png',
      buttonText: buttonText,
      onTap: onTap,
    ),
  );
}

void showPasswordFailDialog(
  BuildContext context, {
  String message = 'Create new password has failed. Please try again.',
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => PasswordChangeDialog(
      isSuccess: false,
      title: 'Opps...',
      message: message,
      imagePath: 'assets/images/pass_fail_dialog.png',
      buttonText: 'Try Again',
      onTap: () => Get.back(),
    ),
  );
}

class PasswordChangeDialog extends StatelessWidget {
  final bool isSuccess;
  final String title;
  final String message;
  final String buttonText;
  final String imagePath;
  final VoidCallback onTap;

  const PasswordChangeDialog({
    super.key,
    required this.isSuccess,
    required this.title,
    required this.message,
    required this.imagePath,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 28),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: isSuccess ? Colors.black87 : Colors.red.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 54,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.close_rounded,
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
