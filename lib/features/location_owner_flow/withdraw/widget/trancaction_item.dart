import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String id;
  final double amount;
  final String time;
  final String date;
  final String status; // "Completed", "Pending", "Rejected"
  final VoidCallback onTap;

  const TransactionItem({
    super.key,
    required this.id,
    required this.amount,
    required this.time,
    required this.date,
    required this.status,
    required this.onTap,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'completed':
        return const Color(0xFF4CAF50); // Green
      case 'pending':
        return const Color(0xFFFBBF24); // Orange/Amber
      case 'rejected':
        return const Color(0xFFE91E63); // Red
      default:
        return Colors.grey.shade600;
    }
  }

  Widget _buildStatusIcon() {
    final color = _getStatusColor();

    switch (status.toLowerCase()) {
      case 'completed':
        return Image.asset(
          'assets/images/arrow-up-right.png',
          width: 24,
          height: 24,
           // optional: tint the icon
        );
      case 'pending':
        return Image.asset(
          'assets/images/pending.png',
          width: 24,
          height: 24,
        );
      case 'rejected':
        return Image.asset(
          'assets/images/cancel.png',
          width: 24,
          height: 24,
        );
      default:
        return Icon(
          Icons.help_outline_rounded,
          size: 24,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status circle with custom image/icon
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: _buildStatusIcon(),
                  ),
                ),
            
                const SizedBox(width: 16),
            
                // Main content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            id,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                            ),
                          ),
                          Text(
                            '\$${amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$time • $date',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6B7280),
                            ),
                          ),
            
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: statusColor.withOpacity(0.3), width: 1),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: statusColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
        ),
      ],
    );
  }
}