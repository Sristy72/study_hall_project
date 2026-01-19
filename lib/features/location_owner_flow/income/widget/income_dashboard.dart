import 'package:flutter/material.dart';

class IncomeDashboard extends StatelessWidget {
  const IncomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Total Income Card (Purple)
        Expanded(
          child: _buildIncomeCard(
            title: "Total Income",
            amount: "\$1200",
            percentage: "3.56%",
            colour1: const Color(0xFF615CFA), // Purple-ish
            colour2: const Color(0xFF9280FD), // Purple-ish
            isTotal: true,
          ),
        ),
        const SizedBox(width: 12),
        // This Month Card (Pink)
        Expanded(
          child: _buildIncomeCard(
            title: "This Month's",
            amount: "\$800",
            percentage: "3.56%",
            colour1: const Color(0xFFFC5EA1), // Pink-ish
            colour2: const Color(0xFFFD6EB3), // Pink-ish
            showDropdown: true,
          ),
        ),
      ],
    );
  }

  Widget _buildIncomeCard({
    required String title,
    required String amount,
    required String percentage,
    required Color colour1,
    required Color colour2,
    bool isTotal = false,
    bool showDropdown = false,
  }) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
          colour1, colour2
        ]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title + icon row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (showDropdown)
                SizedBox(height: 37, width:37,child: Image.asset('assets/images/angle-down.png')),
              if (isTotal)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: SizedBox(height: 26, width:26,child: Image.asset('assets/images/circle-dollar.png')),
                ),
            ],
          ),

          // Big amount
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 32,),

          // Percentage row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.trending_up_rounded,
                  color: Color(0xFF43A047),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  "+ $percentage",
                  style: const TextStyle(
                    color: Color(0xFF43A047),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}