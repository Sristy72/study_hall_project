import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/student_flow/my_courses/controllers/my_courses_controller.dart';
import 'package:study_hall_project/features/student_flow/my_courses/screens/finding_tutor_tab.dart';
import 'package:study_hall_project/features/student_flow/my_courses/screens/history_courses_tab.dart';
import 'package:study_hall_project/features/student_flow/my_courses/screens/ongoing_courses_tab.dart';
import 'package:study_hall_project/features/student_flow/my_courses/screens/calendar/day_view_screen.dart';
import 'package:study_hall_project/features/student_flow/my_courses/screens/calendar/week_view_screen.dart';
import 'package:study_hall_project/features/student_flow/my_courses/screens/calendar/month_view_screen.dart';
import 'package:study_hall_project/features/student_flow/my_courses/widgets/course_filter_bottom_sheet.dart';

class MyCoursesScreen extends StatelessWidget {
  MyCoursesScreen({super.key});

  final MyCoursesController controller = Get.put(MyCoursesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
             child: Row(
                children: [
                  Text(
                    'My Courses',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Obx(() => Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => controller.toggleCalendarMode(),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: !controller.isCalendarMode.value ? Colors.white : Colors.transparent,
                              shape: BoxShape.circle,
                              boxShadow: !controller.isCalendarMode.value ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ] : [],
                            ),
                            child: Icon(Icons.book, size: 20, color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => controller.toggleCalendarMode(),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: controller.isCalendarMode.value ? Colors.white : Colors.transparent,
                              shape: BoxShape.circle,
                              boxShadow: controller.isCalendarMode.value ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ] : [],
                            ),
                            child: Icon(Icons.calendar_today, size: 20, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
           ),
          
          // Show different content based on mode
          Obx(() {
            if (controller.isCalendarMode.value) {
              // Calendar mode - show Day/Week/Month tabs
              return Expanded(
                child: Column(
                  children: [
                    // Calendar view tabs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCalendarTabButton("Day"),
                            _buildCalendarTabButton("Week"),
                            _buildCalendarTabButton("Month"),
                          ],
                        )),
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    // Calendar views
                    Expanded(
                      child: Obx(() {
                        switch (controller.calendarViewType.value) {
                          case 'Day':
                            return DayViewScreen();
                          case 'Week':
                            return WeekViewScreen();
                          case 'Month':
                            return MonthViewScreen();
                          default:
                            return DayViewScreen();
                        }
                      }),
                    ),
                  ],
                ),
              );
            } else {
              // List mode - show original tabs and content
              return Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Icon(Icons.search, color: Colors.grey),
                                  SizedBox(width: 12),
                                  Expanded(child: Text("Search", style: TextStyle(color: Colors.grey))),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                CourseFilterBottomSheet(),
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                              );
                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Icon(Icons.tune, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Sub tabs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTabButton("On Going", 0),
                            _buildTabButton("Finding Tutor", 1),
                            _buildTabButton("History", 2),
                          ],
                        )),
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    Expanded(
                      child: Obx(() {
                        switch (controller.currentTabIndex.value) {
                          case 0:
                            return OngoingCoursesTab();
                          case 1:
                            return FindingTutorTab();
                          case 2:
                            return HistoryCoursesTab();
                          default:
                            return OngoingCoursesTab();
                        }
                      }),
                    ),
                  ],
                ),
              );
            }
          }),
        ],
      ),
    );
  }
  
  Widget _buildTabButton(String text, int index) {
    bool isSelected = controller.currentTabIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF1F2937) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  
  Widget _buildCalendarTabButton(String text) {
    bool isSelected = controller.calendarViewType.value == text;
    return GestureDetector(
      onTap: () => controller.setCalendarViewType(text),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF1F2937) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
