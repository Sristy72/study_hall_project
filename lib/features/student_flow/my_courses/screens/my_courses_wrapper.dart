import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/student_flow/my_courses/controllers/my_courses_controller.dart';
import 'package:study_hall_project/features/student_flow/my_courses/screens/my_course_empty_screen.dart';
import 'package:study_hall_project/features/student_flow/my_courses/screens/my_courses_screen.dart';

class MyCoursesWrapper extends StatelessWidget {
  const MyCoursesWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyCoursesController());
    
    return Obx(() {
      // Show empty screen if no courses, otherwise show courses screen
      if (controller.hasCourses.value) {
        return MyCoursesScreen();
      } else {
        return MyCourseEmptyScreen();
      }
    });
  }
}
