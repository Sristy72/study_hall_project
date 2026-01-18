import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final double amount;
  final String place;
  final String date;
  final int count;

  const TransactionItem({
    required this.amount,
    required this.place,
    required this.date,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    const SizedBox(height: 10);
    return Row(
      children: [
        // Left icon area
        // Container(
        //   width: 48,
        //   height: 48,
        //   decoration: BoxDecoration(
        //     color: const Color(0xFFF0F2FF),
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   child: const Icon(
        //     Icons.coffee_rounded,
        //     color: Color(0xFF5B67FE),
        //     size: 26,
        //   ),
        // ),
        const SizedBox(width: 14),

        // Middle content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '+\$${amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF34C759),
                ),
              ),
              Text(
                place,
                style: const TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),

        // Right side - amount + count
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(date, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            const SizedBox(height: 3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFEBF1FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '×$count',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF5B67FE),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
