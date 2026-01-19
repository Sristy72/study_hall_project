import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/tutor/coureses/screens/course_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  const CategoryItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.transparent,
          child: Image.asset(image),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionHeader({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),

        TextButton(
          onPressed: onTap,
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3B82F6),
            ),
          ),
        ),
      ],
    );
  }
}

class TutorCard extends StatelessWidget {
  final String name, subject, likes, rating;

  const TutorCard({
    super.key,
    required this.name,
    required this.subject,
    required this.likes,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 108,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFD1D5DB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/p2.png',
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 4),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'I teach $subject',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),

          Spacer(),
          Row(
            children: [
              const Icon(Icons.favorite, size: 14, color: Colors.red),
              Text(' $likes'),
              const Spacer(),
              const Icon(Icons.star, size: 14, color: Colors.amber),
              Text(' $rating'),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title, category, author, modules, students;

  const CourseCard({
    super.key,
    required this.title,
    required this.category,
    required this.author,
    required this.modules,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Get.to(()=> CourseDetailScreen());},
      child: SizedBox(
        width: 280, // ⭐ REQUIRED for horizontal ListView
        child: Container(
          margin: const EdgeInsets.only(right: 12), // spacing between cards
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image placeholder
              Stack(
                children: [
                  Container(
                    height: 125,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/business.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 12,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 6,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Intermediate',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),

                            SizedBox(width: 6,),
                            Container(height: 13, width:13, child: Image.asset('assets/images/range.png'))
                          ],
                        ),
                      ),
                    ),
                  ),


                  Positioned(
                    top: 12,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 6,
                        ),
                        child: Row(
                          children: [
                            SizedBox(height: 13, width:13, child: Image.asset('assets/images/Vector.png')),
                            SizedBox(width: 3.5,),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Left content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                              color: Color(0xFF3B82F6),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  'assets/images/p2.png',
                                  width: 32,
                                  height: 32,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  author,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(height:14, width: 14, child: Image.asset('assets/images/module.png',)),
                              SizedBox(width: 3.2,),
                              Text(
                                modules,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(color: Color(0xFF64748B), borderRadius: BorderRadius.circular(50)),
                              ),
                              SizedBox(width: 8,),

                              SizedBox(height:14, width: 14, child: Image.asset('assets/images/person.png',)),
                              SizedBox(width: 3.2,),
                              Text(
                                students,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// Favorite icon
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Color(0xFF3B82F6),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
