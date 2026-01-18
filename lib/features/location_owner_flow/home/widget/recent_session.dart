import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../screens/booking_details_screen.dart';
import 'booking.dart';
class OngoingCard extends StatelessWidget {
  final BookingStatus status;

  const OngoingCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final statusConfig = getStatusConfig(status);

    return GestureDetector(
      onTap: (){
        Get.to(
              () => BookingDetailsScreen(status: status),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD1D5DB)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status badge + menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusConfig.bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    statusConfig.label,
                    style: TextStyle(
                      color: statusConfig.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Icon(Icons.more_horiz_rounded,
                    color: Colors.grey, size: 24),
              ],
            ),

            const SizedBox(height: 12),

            const Text(
              "Lucy's Cafe",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),
            const Divider(color: Color(0xFFE5E7EB)),
            const SizedBox(height: 10),

            Row(
              children: [
                SizedBox(
                    height: 16,
                    width: 16,
                    child: Image.asset('assets/images/location.png')),
                const SizedBox(width: 8),
                const Text(
                  "14 Kiln Street, LA, CA",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 12),
                SizedBox(
                    height: 16,
                    width: 16,
                    child: Image.asset('assets/images/calendar.png')),
                const SizedBox(width: 6),
                const Text(
                  "Thursday 10:00am - 11:00am",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
