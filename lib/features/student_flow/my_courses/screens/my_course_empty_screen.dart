import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/common/widgets/app_scaffold.dart';
import 'package:study_hall_project/features/student_flow/my_courses/controllers/my_courses_controller.dart';

class MyCourseEmptyScreen extends StatelessWidget {
  const MyCourseEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: Column(
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
                  // Placeholder for book icon and calendar icon toggle
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(Icons.book, size: 20, color: Colors.black),
                        ),
                        SizedBox(width: 4),
                         Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
           ),
          
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
                 Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Icon(Icons.tune, color: Colors.grey),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTabButton("On Going", true),
                  _buildTabButton("Finding Tutor", false),
                  _buildTabButton("History", false),
                ],
              ),
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   // Illustration
                   // Assuming we don't have the exact SVGs yet, using a placeholder icon or similar
                   // The image shows a folder with magnifying glass
                   // We'll use a placeholder Container or Icon for now
                   Image.asset('assets/images/empty_course.png', height: 120, errorBuilder: (c,e,s) => Icon(Icons.search_off, size: 100, color: Colors.blue.withOpacity(0.3))), // Placeholder if asset doesn't exist
                   SizedBox(height: 32),
                   Text(
                     "Don't Have Course Yet",
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                   SizedBox(height: 12),
                   Text(
                     "Start by enrolling some course & learn something new",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.grey,
                       height: 1.5,
                     ),
                   ),
                   SizedBox(height: 32),
                   SizedBox(
                     width: double.infinity,
                     height: 50,
                     child: ElevatedButton(
                       onPressed: () {
                         // Instead of navigating, update the controller to show courses
                         Get.find<MyCoursesController>().setHasCourses(true);
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color(0xFF3B82F6),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12),
                         ),
                         elevation: 0,
                       ),
                       child: Text(
                         "Explore Course",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 16,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                     ),
                   )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTabButton(String text, bool isSelected) {
    return Container(
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
    );
  }
}
