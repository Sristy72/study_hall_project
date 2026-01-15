import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/core/common/constants/notification_button.dart';
import 'package:study_hall_project/core/common/constants/search_button.dart';
import 'package:study_hall_project/core/constants/assets_const.dart';
import 'package:study_hall_project/core/constants/svg_image.dart';
import 'package:study_hall_project/core/theme/app_decorations.dart';
import '../widget/categoryItem.dart';
import 'all_category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.backgroundGradient,
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: LayoutBuilder(
              builder: (context, constraints){
                return SingleChildScrollView(
                  //padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ConstrainedBox(
                    constraints:const BoxConstraints(
                    maxWidth: 600,
                    minWidth: 300,
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Good Morning!', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                                  Text('Kate!', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),)
                                ],
                              ),

                              Spacer(),
                              SearchButton(),
                              SizedBox(width: 12,),
                              NotificationButton()
                            ],
                          ),

                          const SizedBox(height: 14),
                          /// Categories Card
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFE5E7EB),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),  // Soft shadow
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),  // Shadow slightly below
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    CategoryItem(image: 'assets/images/guitar.png', label: 'Guitar'),
                                    CategoryItem(image: 'assets/images/physical.png', label: 'Physical'),
                                    CategoryItem(image: 'assets/images/crypto.png', label: 'Crypto'),
                                    CategoryItem(image: 'assets/images/math.png', label: 'Math'),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                GestureDetector(
                                  onTap: (){Get.to(() => AllCategoryScreen());},
                                  child: Container(
                                    height: 44,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDBEAFE),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child:  Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                         AppSvg(asset: Images.category),
                                          SizedBox(width: 8),
                                          Text(
                                            'All Categories',
                                            style: TextStyle(
                                              color: Color(0xFF3B82F6),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          /// Popular Tutors
                          SectionHeader(title: 'Popular Tutors', onTap: () {  },),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 120,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                TutorCard(name: 'Alex Johnson', subject: 'French', likes: '500', rating: '4.5'),
                                TutorCard(name: 'Brooklyn Simmons', subject: 'Art', likes: '199', rating: '5.0'),
                                TutorCard(name: 'Theresa Webb', subject: 'English', likes: '100', rating: '4.8'),
                                TutorCard(name: 'Theresa Webb', subject: 'English', likes: '100', rating: '4.8'),
                                TutorCard(name: 'Theresa Webb', subject: 'English', likes: '100', rating: '4.8'),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          /// Newest Course
                          SectionHeader(title: 'Newest Course', onTap: () {  },),
                          const SizedBox(height: 12),
                        SizedBox(
                          height: 253,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.none, // ⭐ THIS IS THE KEY FIX
                            children: [
                              CourseCard(
                                title: 'Entrepreneurship and New Venture Creation',
                                category: 'Business',
                                author: 'Emily John',
                                modules: '12 module',
                                students: '3.8k join',
                              ),
                              CourseCard(
                                title: 'Basic Art Course Elements',
                                category: 'Art',
                                author: 'Brooklyn',
                                modules: '12 module',
                                students: '1.2k join',
                              ),
                              CourseCard(
                                title: 'Basic Art Course Elements',
                                category: 'Art',
                                author: 'Brooklyn',
                                modules: '12 module',
                                students: '1.2k join',
                              ),
                            ],
                          ),
                        ),
                          const SizedBox(height: 16),

                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                );
              },

            ),
          ),
        ),
      ),
    );
  }
}
