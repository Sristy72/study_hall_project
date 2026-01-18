import 'package:flutter/material.dart';
import 'package:study_hall_project/features/location_owner_flow/home/widget/booking.dart';

import '../../../../core/common/constants/back_button.dart';
import '../../withdraw/widget/bottom_sheet.dart';
import '../widget/filter_bottom_sheet.dart';
import '../widget/recent_session.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final int recentSessionsCount = 12;
  int _activeTabIndex = 0; // 0 = Ongoing, 1 = Calendar, 2 = History


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              //padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔹 Header
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Row(
                      children: const [
                        CustomBackButton2(),
                        SizedBox(width: 16),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 17),

                  /// 🔹 Search bar
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: _searchBar(),
                  ),

                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _activeTabIndex = 0;
                                });
                              },
                              child: _buildTab("Ongoing", isActive: _activeTabIndex == 0),
                            ),
                            const SizedBox(width: 32),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _activeTabIndex = 1;
                                });
                              },
                              child: _buildTab("Calendar", isActive: _activeTabIndex == 1),
                            ),
                            const SizedBox(width: 32),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _activeTabIndex = 2;
                                });
                              },
                              child: _buildTab("History", isActive: _activeTabIndex == 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),

                  Container(
                    height: 1.5,
                    color: const Color(
                      0xFFE5E7EB,
                    ), // very light gray - very popular now
                  ),
                  const SizedBox(height: 16),



                  // Changed to ListView.builder
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: _buildTabContent(),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildTabContent() {
    if (_activeTabIndex == 0) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: recentSessionsCount,
        itemBuilder: (context, index) {
          return Column(
            children: [
              OngoingCard(
                status: BookingStatus.ongoing,
              ),
              if (index < recentSessionsCount - 1)
                const SizedBox(height: 16),
            ],
          );
        },

      );
    } else if (_activeTabIndex == 1) {
      return const Center(child: Text("Calendar View"));
    } else {
      return ListView.builder(
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

      );
    }
  }

  BookingStatus getStatusByIndex(int index) {
    if (index % 3 == 0) return BookingStatus.ongoing;
    if (index % 3 == 1) return BookingStatus.finished;
    return BookingStatus.cancelled;
  }

  Widget _buildTab(String text, {required bool isActive}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        // if (isActive)
        //   Container(
        //     height: 3,
        //     width: 40,
        //     decoration: BoxDecoration(
        //       color: Colors.black,
        //       borderRadius: BorderRadius.circular(2),
        //     ),
        //   ),
      ],
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFE5E7EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFE5E7EB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFE5E7EB),
                  width: 1.2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (_) => const FilterBottomSheet(),
            );

          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/images/filter.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}