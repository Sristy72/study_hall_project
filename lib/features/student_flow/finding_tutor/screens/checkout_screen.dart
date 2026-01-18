import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';
import 'package:study_hall_project/features/student_flow/finding_tutor/screens/checkout_summary_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    const Expanded(
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 6),
                      _ApplePayButton(onPressed: () {}),
                      const SizedBox(height: 10),
                      const Text(
                        'OR Pay with Card',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _CheckoutField(label: 'Enter your email'),
                      const SizedBox(height: 10),
                      _CheckoutField(label: '1234 4321 1234 4321', suffix: _CardIcons()),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Expanded(child: _CheckoutField(label: 'MM / YY')),
                          SizedBox(width: 10),
                          Expanded(child: _CheckoutField(label: 'CVC')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const _CheckoutField(label: 'Name on Card'),
                      const SizedBox(height: 10),
                      _CheckoutField(
                        label: 'Country',
                        suffix: const Icon(Icons.keyboard_arrow_down),
                      ),
                      const SizedBox(height: 10),
                      const _CheckoutField(label: 'ZIP'),
                      const SizedBox(height: 16),
                      _TotalRow(
                        label: 'Service Fee:',
                        value: '\$179.31 USD',
                      ),
                      const SizedBox(height: 6),
                      _TotalRow(
                        label: 'Order amount:',
                        value: '\$179.31 USD',
                        bold: true,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        // onTap: () => Get.to(() => const CheckoutSummaryScreen()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'More Details',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.keyboard_arrow_down, size: 18),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3B82F6),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Pay Now'),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApplePayButton extends StatelessWidget {
  const _ApplePayButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        icon: const Icon(Icons.apple, size: 18),
        label: const Text('Pay'),
      ),
    );
  }
}

class _CheckoutField extends StatelessWidget {
  const _CheckoutField({required this.label, this.suffix});

  final String label;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffix == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: suffix,
              ),
        suffixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
    );
  }
}

class _CardIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.credit_card, size: 18, color: Color(0xFF9CA3AF)),
        SizedBox(width: 6),
        Icon(Icons.credit_card, size: 18, color: Color(0xFF9CA3AF)),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.label, required this.value, this.bold = false});

  final String label;
  final String value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final fontWeight = bold ? FontWeight.w700 : FontWeight.w500;
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: const Color(0xFF6B7280))),
        const Spacer(),
        Text(
          value,
          style: TextStyle(fontWeight: fontWeight, fontSize: 12),
        ),
      ],
    );
  }
}
