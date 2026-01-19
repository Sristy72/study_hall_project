import 'package:flutter/material.dart';

import '../../../../core/common/constants/back_button.dart';
import '../widget/booking.dart';
import '../widget/booking_detail.dart';
import '../widget/video_header.dart';

class BookingDetailsScreen extends StatelessWidget {
  final BookingStatus status;

  const BookingDetailsScreen({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final statusStyle = getStatusStyle(status);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        CustomBackButton2(),
                        SizedBox(width: 16),
                        Text(
                          'Session Detail',
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

                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/7e12a1c92474d4c007d5bc917d3af6d2d0c2316f.png',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 6,
                        right: 16,
                        child: Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(height:40, width: 40,child: Image.asset('assets/images/play-circle.png'))
                        ),
                      ),
                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Row(
                          children: [
                            const Text(
                              "Lucy's Cafe",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: statusStyle.bg,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                statusStyle.label,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: statusStyle.text,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 12),

                        Divider(color: Color(0xFFD1D5DB),),
                        SizedBox(height: 4,),
                        /// INFO ROW
                        _infoRow(),

                        SizedBox(height: 6,),
                        Divider(color: Color(0xFFD1D5DB),),


                        const SizedBox(height: 20),

                        /// CANCELLATION POLICY
                        _sectionTitle('Cancellation Policy'),
                        const SizedBox(height: 8),
                        const Text(
                          "You may cancel your enrollment within 7 days of purchase "
                              "for a full refund, provided the course has not been "
                              "completed or significantly accessed.",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6B7280),
                          ),
                        ),

                        const SizedBox(height: 24),

                        /// REVIEW SECTION (STATUS BASED)
                        _reviewSection(status),
                      ],
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


  /// HEADER IMAGE


  Widget _infoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         _InfoItem(image: '', label: 'Online'),
        Container(width: 1,color: Color(0xFFD1D5DB),height: 40,),
         _InfoItem(image: 'assets/images/clock.png', label: '1 Hour', text: 'Duration',),
        Container(width: 1,color: Color(0xFFD1D5DB),height: 40,),
         _InfoItem(image: '', label: '\$10/Student'),
        Container(width: 1,color: Color(0xFFD1D5DB),height: 40,),
         _InfoItem(image: '', label: '04'),
      ],
    );
  }

  Widget _reviewSection(BookingStatus status) {
    switch (status) {
      case BookingStatus.ongoing:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _sectionTitle('My Review and Rating'),
            SizedBox(height: 8),
            Text(
              'You can leave a review after the session is finished.',
              style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
            ),
          ],
        );

      case BookingStatus.cancelled:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _sectionTitle('My Review and Rating'),
            SizedBox(height: 8),
            Text(
              'Not available for cancelled bookings.',
              style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
            ),
          ],
        );

      case BookingStatus.finished:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _sectionTitle('My Review and Rating'),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                    (index) => const Icon(Icons.star,
                    size: 18, color: Color(0xFFFBBF24)),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '24 Aug 2025',
              style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
            ),
            const SizedBox(height: 8),
            const Text(
              "Emily John made learning digital marketing an enjoyable "
                  "experience. Her course was thorough and engaging.",
              style: TextStyle(fontSize: 13),
            ),
          ],
        );
    }
  }



}
class _InfoItem extends StatelessWidget {
  final String image;
  final String label;
  final String? text;

  const _InfoItem({required this.label, this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(image),
            Text(text!)
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF374151)),
        ),
      ],
    );
  }
}

class _sectionTitle extends StatelessWidget {
  final String text;
  const _sectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
