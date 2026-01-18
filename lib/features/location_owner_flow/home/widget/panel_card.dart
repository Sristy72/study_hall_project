import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/constants/svg_image.dart';

class MyPanelCard extends StatelessWidget {
  const MyPanelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFE5E7EB)
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats rows
          _buildStatRow("Total Session:", "100"),
          const Divider(height: 24, thickness: 1, color: Color(0xFFE5E7EB)),
          _buildStatRow("Today Session:", "2/10"),
          const Divider(height: 24, thickness: 1, color: Color(0xFFE5E7EB)),
          _buildStatRow("Total Income:", "\$800.00"),
          const Divider(height: 24, thickness: 1, color: Color(0xFFE5E7EB)),
          _buildStatRow("Pending Payout:", "\$120.00"),

          const SizedBox(height: 20),

          // My Panel button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE), // light blue
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // You can replace with your own SVG/asset
                AppSvg(asset: Images.category),
                const SizedBox(width: 8),
                const Text(
                  "My Panel",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3B82F6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}