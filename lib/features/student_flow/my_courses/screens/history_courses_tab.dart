import 'package:flutter/material.dart';
import 'package:study_hall_project/features/student_flow/my_courses/widgets/my_course_card.dart';

class HistoryCoursesTab extends StatelessWidget {
  const HistoryCoursesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      children: [
        MyCourseCard(
          tag: "Finished",
          tagColor: Color(0xFFDCFCE7),
          tagTextColor: Color(0xFF166534),
          title: "How to write Cover Letter",
          tutorName: "Emily john",
          category: "Business",
          id: "S00001",
          timeOrLocationIcon: Icons.location_on_outlined,
          timeOrLocationText: "Lucy Coffee - 14 Kiln Street",
          dateText: "Thursday 10:00am - 11:00am",
          finishedDate: "at 18:02:23 pm 03 April 2025",
        ),
        SizedBox(height: 16),
        MyCourseCard(
          tag: "Finished",
          tagColor: Color(0xFFFCE7F3), 
          tagTextColor: Color(0xFF9D174D), // The second card in image 4 has pinkish background.
          title: "How to write Cover Letter",
          tutorName: "Emily john",
          category: "Business",
          id: "S00001",
          timeOrLocationIcon: Icons.location_on_outlined,
          timeOrLocationText: "Lucy Coffee - 14 Kiln Street",
          dateText: "Thursday 10:00am - 11:00am",
          finishedDate: "at 18:02:23 pm 03 April 2025",
        ),
      ],
    );
  }
}
