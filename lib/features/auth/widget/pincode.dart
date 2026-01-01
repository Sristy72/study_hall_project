import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key, required this.otpController});
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: otpController,
      appContext: context,
      length: 4,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      autoFocus: false,

      obscureText: true,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      cursorColor: Colors.black,
      //enableActiveFill: true, // 🔴 REQUIRED

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(16),
        fieldHeight: 80,
        fieldWidth: 80,

        borderWidth: 1,

        inactiveColor: Color(0xFFD1D5DB),
        activeColor: Color(0xFFD1D5DB),
        selectedColor: Color(0xFFD1D5DB),

        inactiveFillColor: const Color(0xFFE8ECF1),
        activeFillColor: const Color(0xFFE8ECF1),
        selectedFillColor: const Color(0xFFE8ECF1),
      ),
    );
  }
}

