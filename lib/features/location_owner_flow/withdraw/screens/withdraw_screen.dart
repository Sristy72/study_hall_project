import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/location_owner_flow/withdraw/screens/withdrawal_screen.dart';

import '../../../../core/common/constants/back_button.dart';
import '../../../auth/widget/password_change_dialog.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: const [
                        CustomBackButton2(),
                        SizedBox(width: 16),
                        Text(
                          'Withdrawal Management',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Divider(
                    height: 1.5,
                    thickness: 1.5,
                    color: Color(0xFFE5E7EB),
                  ),

                  const SizedBox(height: 40),

                  // Available Amount Section
                  const Center(
                    child: Text(
                      'Available Amount',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Center(
                    child: Text(
                      '\$12,000.00',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3B82F6),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Amount Input Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        // You can add NumberFormatter later if you want comma separation
                      ],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter amount',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        prefixStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 20,
                        ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12),
                        //   borderSide: BorderSide(
                        //     color: Colors.grey[300]!,
                        //     width: 1.2,
                        //   ),
                        // ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12),
                        //   borderSide: BorderSide(
                        //     color: Colors.grey[300]!,
                        //     width: 1.2,
                        //   ),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12),
                        //   borderSide: const BorderSide(
                        //     color: Color(0xFF3B82F6),
                        //     width: 2,
                        //   ),
                        // ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Withdraw Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {showPasswordSuccessDialog(
                              context,
                              message:
                                  'This course will opeYour withdrawal request has been submitted successfully',
                              buttonText: 'Go to home', onTap: () { Get.offAll(()=> WithdrawalScreen()); });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Withdraw',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
