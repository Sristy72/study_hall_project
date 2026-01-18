import 'package:flutter/material.dart';
import 'package:study_hall_project/core/common/constants/back_button.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Header
                  Row(
                    children: const [
                      CustomBackButton2(),
                      SizedBox(width: 16),
                      Text(
                        'All Category',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 Search bar
                  _searchBar(),

                  const SizedBox(height: 16),

                  /// 🔹 Category list
                  const CategoryTile(
                    image: 'assets/images/calculator.png',
                    title: "Math",
                    subtitle: "62 Tutors",
                  ),
                  const CategoryTile(
                    image: 'assets/images/design.png',
                    title: "Design",
                    subtitle: "32 Tutors",
                  ),
                  const CategoryTile(
                    image: 'assets/images/development.png',
                    title: "Development",
                    subtitle: "32 Tutors",
                  ),
                  const CategoryTile(
                    image: 'assets/images/exercise.png',
                    title: "Physical",
                    subtitle: "12 Tutors",
                  ),
                  const CategoryTile(
                    image: 'assets/images/language.png',
                    title: "Language",
                    subtitle: "32 Tutors",
                  ),
                  const CategoryTile(
                    image: 'assets/images/laptop.png',
                    title: "Technology",
                    subtitle: "22 Tutors",
                  ),
                  const CategoryTile(
                    image: 'assets/images/writing.png',
                    title: "Writing",
                    subtitle: "32 Tutors",
                  ),
                  const CategoryTile(
                    image: 'assets/images/finance.png',
                    title: "Finance",
                    subtitle: "18 Tutors",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔍 Search Bar
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
        Container(
          decoration: BoxDecoration(
            //color: Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFE5E7EB)),
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
      ],
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const CategoryTile({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFFD1D5DB)),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.5),
              child: Container(width:19, height:19,child: Image.asset(image)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Color(0xFF4B5563), fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
