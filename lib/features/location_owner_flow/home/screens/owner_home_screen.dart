import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/location_owner_flow/home/screens/location_screen.dart';
import 'package:study_hall_project/features/location_owner_flow/home/screens/notification_screen.dart';
import 'package:study_hall_project/features/location_owner_flow/home/widget/panel_card.dart';

import '../../../../core/common/constants/notification_button.dart';
import '../../../../core/theme/app_decorations.dart';
import '../../../student_flow/home/widget/categoryItem.dart';
import '../widget/booking.dart';
import '../widget/recent_session.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  // You can later replace this with real data from provider/API/state management
  final int recentSessionsCount = 12; // example - can be dynamic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 59.08,
                        height: 59.08,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/f6c33e5ec09e0bab5202dd03e736b34c0d9ba19c.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi Kate!',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              SizedBox(
                                height: 22,
                                width: 22,
                                child: Image.asset('assets/images/star.png'),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                '4.9',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      const SizedBox(width: 12),
                       NotificationButton(onTap: (){Get.to(() => NotificationScreen());},)
                    ],
                  ),

                  const SizedBox(height: 22),
                  const MyPanelCard(),
                   SectionHeader(title: 'Recent Session', onTap: (){Get.to(() => LocationScreen());}),

                  const SizedBox(height: 12),

                  // Changed to ListView.builder
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemCount: recentSessionsCount,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          OngoingCard(
                            status: getStatusByIndex(index),
                          ),
                          if (index < recentSessionsCount - 1)
                            const SizedBox(height: 16),
                        ],
                      );
                    },

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  BookingStatus getStatusByIndex(int index) {
    if (index % 3 == 0) return BookingStatus.ongoing;
    if (index % 3 == 1) return BookingStatus.finished;
    return BookingStatus.cancelled;
  }

}