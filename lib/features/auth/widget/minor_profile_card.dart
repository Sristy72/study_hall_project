import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:study_hall_project/core/constants/assets_const.dart' hide Icons;
import 'package:study_hall_project/features/auth/screens/edit_minor.dart';


class MinorProfileCard extends StatelessWidget {
  final String photoUrl;
  final String label;
  final String name;
  final bool isFemale;
  final String birthDate;

  const MinorProfileCard({
    super.key,
    required this.photoUrl,
    required this.label,
    required this.name,
    required this.isFemale,
    required this.birthDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFD1D5DB), width: 1),
      ),
      child: Row(
        children: [
          // Profile photo (rounded)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Color(0xFFD1D5DB))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                photoUrl,
                width: 88,
                height: 68,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.person, size: 60, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Details column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label (Minor 1)
                Row(
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Spacer(),
                    // Edit button
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => EditMinorScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // make button width fit content
                          children: [
                            const Text(
                              'Edit',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              height: 12.67,
                              width: 12.67,
                              child: Image.asset('assets/images/edit.png'),
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
                //const SizedBox(height: 6),
                // Name with gender icon
                Row(
                  children: [
                    Icon(Icons.person_outline,
                      color: Colors.grey[700],
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF374151)),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                // Birth date with calendar icon
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.grey[700],
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      birthDate,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF374151)),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}