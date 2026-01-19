import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/student_flow/finding_tutor/screens/tutor_for_you_screen.dart';

class MyCourseCard extends StatelessWidget {
  final String tag;
  final Color tagColor;
  final Color tagTextColor;
  final String title;
  final String tutorName;
  final String category;
  final String id;
  final IconData timeOrLocationIcon;
  final String timeOrLocationText;
  final String dateText;
  final String? finishedDate; // Special for History tab

  const MyCourseCard({
    super.key,
    required this.tag,
    required this.tagColor,
    required this.tagTextColor,
    required this.title,
    required this.tutorName,
    required this.category,
    required this.id,
    required this.timeOrLocationIcon,
    required this.timeOrLocationText,
    required this.dateText,
    this.finishedDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TutorForYouScreen());
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: tagColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: tagTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      if (finishedDate != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            finishedDate!,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/course_perticipate.png',
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) =>
                          Icon(Icons.person, size: 16, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  tutorName,
                  style: TextStyle(
                    color: Color(0xFF374151),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.circle, size: 4, color: Colors.grey),
                ),
                Text(
                  category,
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.circle, size: 4, color: Colors.grey),
                ),
                Text(
                  id,
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(height: 1, color: Colors.grey.shade100),
            SizedBox(height: 16),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      timeOrLocationIcon,
                      size: 16,
                      color: Color(0xFF4B5563),
                    ),
                    SizedBox(width: 6),
                    Text(
                      timeOrLocationText,
                      style: TextStyle(color: Color(0xFF4B5563), fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: Color(0xFF4B5563),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          dateText,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF4B5563),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
