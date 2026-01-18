import 'package:flutter/material.dart';
import 'package:study_hall_project/features/student_flow/my_courses/widgets/my_course_card.dart';

class OngoingCoursesTab extends StatelessWidget {
  const OngoingCoursesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      children: [
        MyCourseCard(
          tag: "Ongoing",
          tagColor: Color(0xFFDBEAFE),
          tagTextColor: Color(0xFF1D4ED8),
          title: "How to write Cover Letter",
          tutorName: "Emily john",
          category: "Business",
          id: "S00001",
          timeOrLocationIcon: Icons.coffee,
          timeOrLocationText: "Online",
          dateText: "Tuesday, Thursday 10:00am - 11:00am",
        ),
        SizedBox(height: 16),
        MyCourseCard(
          tag: "Ongoing",
          tagColor: Color(0xFFDBEAFE),
          tagTextColor: Color(0xFF1D4ED8),
          title: "How to write Cover Letter",
          tutorName: "Emily john",
          category: "Business",
          id: "S00001",
          timeOrLocationIcon: Icons.location_on_outlined,
          timeOrLocationText: "Lucy Coffee - 14 Kiln Street",
          dateText: "Thursday 10:00am - 11:00am",
        ),
        SizedBox(height: 16),
        MyCourseCard(
          tag: "Ongoing",
          tagColor: Color(0xFFDBEAFE),
          tagTextColor: Color(0xFF1D4ED8),
          title: "How to write Cover Letter",
          tutorName: "Emily john",
          category: "Business",
          id: "S00001",
          timeOrLocationIcon: Icons.coffee,
          timeOrLocationText: "Online",
          dateText: "Tuesday, Thursday 10:00am - 11:00am",
        ),
      ],
    );
  }
}
