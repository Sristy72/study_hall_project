import 'package:flutter/material.dart';
class OngoingCard extends StatelessWidget {
  const OngoingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFD1D5DB)
        ),
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
          // Ongoing badge + menu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Ongoing',
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.more_horiz_rounded,
                color: Colors.grey,
                size: 24,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Cafe name
          const Text(
            "Lucy's Cafe",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 6),

          Divider(color: Color(0xFFE5E7EB),),

          const SizedBox(height: 10),

          // Location & Time row
          Row(
            children: [
              Container(height: 16,width: 16,child: Image.asset('assets/images/location.png')),
              const SizedBox(width: 8),
              const Text(
                "14 Kiln Street, LA, CA",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF374151),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(height: 16,width: 16,child: Image.asset('assets/images/calendar.png')),
              const SizedBox(width: 6),
              const Text(
                "Thursday 10:00am - 11:00am",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF374151),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}