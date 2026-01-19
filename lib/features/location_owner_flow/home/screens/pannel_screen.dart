// import 'package:flutter/material.dart';
// import 'package:study_hall_project/features/location_owner_flow/home/widget/booking.dart';
//
// import '../../../../core/common/constants/back_button.dart';
// import '../widget/filter_bottom_sheet.dart';
// import '../widget/recent_session.dart';
//
// class MyPanelScreen extends StatefulWidget {
//   const MyPanelScreen({super.key});
//
//   @override
//   State<MyPanelScreen> createState() => _MyPanelScreenState();
// }
//
// class _MyPanelScreenState extends State<MyPanelScreen> {
//   final int recentSessionsCount = 12;
//   int _activeTabIndex = 0; // 0 = Ongoing, 1 = Calendar, 2 = History
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Align(
//           alignment: Alignment.topCenter,
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 600),
//             child: SingleChildScrollView(
//               //padding: const EdgeInsets.all(18),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   /// 🔹 Header
//                   Padding(
//                     padding: const EdgeInsets.only(left: 18.0, right: 18),
//                     child: Row(
//                       children: const [
//                         CustomBackButton2(),
//                         SizedBox(width: 16),
//                         Text(
//                           'My Panel',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12,),
//                   Container(
//                     height: 1.5,
//                     color: const Color(
//                       0xFFE5E7EB,
//                     ), // very light gray - very popular now
//                   ),
//                   const SizedBox(height: 16),
//
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Color(0xFFF9FAFB),
//                           borderRadius: BorderRadius.circular(100)
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _activeTabIndex = 0;
//                                 });
//                               },
//                               child: _buildTab("My Location", isActive: _activeTabIndex == 0),
//                             ),
//                             const SizedBox(width: 32),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _activeTabIndex = 1;
//                                 });
//                               },
//                               child: _buildTab("Review", isActive: _activeTabIndex == 1),
//                             ),
//                             const SizedBox(width: 32)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16,),
//
//
//                   // ── Rating Summary ───────────────────────────────
//                   const Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           '4.7',
//                           style: TextStyle(
//                             fontSize: 48,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           '/5',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.star, color: Colors.amber, size: 32),
//                             Icon(Icons.star, color: Colors.amber, size: 32),
//                             Icon(Icons.star, color: Colors.amber, size: 32),
//                             Icon(Icons.star, color: Colors.amber, size: 32),
//                             Icon(Icons.star_half, color: Colors.amber, size: 32),
//                           ],
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           'Based on 388 Reviews',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 32),
//
//                   // ── Rating Bars ───────────────────────────────────
//                   _buildRatingBar('5 Star', 0.68, 5),
//                   _buildRatingBar('4 Star', 0.19, 4),
//                   _buildRatingBar('3 Star', 0.08, 3),
//                   _buildRatingBar('2 Star', 0.03, 2),
//                   _buildRatingBar('1 Star', 0.02, 1),
//
//                   const SizedBox(height: 32),
//                   const Divider(),
//                   const SizedBox(height: 16),
//
//                   // ── Reviews List ──────────────────────────────────
//                   const Text(
//                     'All Reviews',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//
//                   const ReviewCard(
//                     name: 'Emily Johnson',
//                     rating: 5,
//                     date: '24 Aug 2025',
//                     text:
//                     'Emily John made learning digital marketing an enjoyable experience. Her course was thorough, and her teaching methods were interactive, which kept me engaged. She was always willing to go the extra mile to ensure I understood the material. Sarah’s enthusiasm and expertise were evident throughout the course.',
//                   ),
//
//                   const ReviewCard(
//                     name: 'Emily Johnson',
//                     rating: 5,
//                     date: '24 Aug 2025',
//                     text:
//                     'Emily John made learning digital marketing an enjoyable experience. Her course was thorough, and her teaching methods were interactive...',
//                   ),
//
//
//                   // Changed to ListView.builder
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                     child: _buildTabContent(),
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRatingBar(String label, double percentage, int stars) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 70,
//             child: Text(
//               label,
//               style: const TextStyle(fontSize: 15),
//             ),
//           ),
//           Expanded(
//             child: Stack(
//               children: [
//                 Container(
//                   height: 10,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                 ),
//                 FractionallySizedBox(
//                   widthFactor: percentage,
//                   child: Container(
//                     height: 10,
//                     decoration: BoxDecoration(
//                       color: Colors.amber,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Text(
//             '${(percentage * 100).round()}%',
//             style: const TextStyle(
//               fontSize: 13,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabContent() {
//     if (_activeTabIndex == 0) {
//       return ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         itemCount: recentSessionsCount,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               OngoingCard(
//                 status: BookingStatus.ongoing,
//               ),
//               if (index < recentSessionsCount - 1)
//                 const SizedBox(height: 16),
//             ],
//           );
//         },
//
//       );
//     } else if (_activeTabIndex == 1) {
//       return const Center(child: Text("Calendar View"));
//     } else {
//       return ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         itemCount: recentSessionsCount,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               OngoingCard(
//                 status: getStatusByIndex(index),
//               ),
//               if (index < recentSessionsCount - 1)
//                 const SizedBox(height: 16),
//             ],
//           );
//         },
//
//       );
//     }
//   }
// }
//
//
//
//   BookingStatus getStatusByIndex(int index) {
//     if (index % 3 == 0) return BookingStatus.ongoing;
//     if (index % 3 == 1) return BookingStatus.finished;
//     return BookingStatus.cancelled;
//   }
//
//   Widget _buildTab(String text, {required bool isActive}) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//           decoration: BoxDecoration(
//             color: isActive ? Colors.black : Colors.transparent,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Text(
//               text,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
//                 color: isActive ? Colors.white : Colors.grey.shade600,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 6),
//         // if (isActive)
//         //   Container(
//         //     height: 3,
//         //     width: 40,
//         //     decoration: BoxDecoration(
//         //       color: Colors.black,
//         //       borderRadius: BorderRadius.circular(2),
//         //     ),
//         //   ),
//       ],
//     );
//   }
//
//   Widget _searchBar() {
//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: "Search",
//               prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
//               contentPadding: const EdgeInsets.symmetric(vertical: 14),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Color(0xFFE5E7EB)),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Color(0xFFE5E7EB)),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                   color: Color(0xFFE5E7EB),
//                   width: 1.2,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         GestureDetector(
//           onTap: () {
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: const Color(0xFFE5E7EB)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: SizedBox(
//                 width: 20,
//                 height: 20,
//                 child: Image.asset('assets/images/filter.png'),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
// class ReviewCard extends StatelessWidget {
//   final String name;
//   final int rating;
//   final String date;
//   final String text;
//
//   const ReviewCard({
//     super.key,
//     required this.name,
//     required this.rating,
//     required this.date,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: List.generate(
//                     5,
//                         (i) => Icon(
//                       i < rating ? Icons.star : Icons.star_border,
//                       size: 18,
//                       color: Colors.amber,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4),
//             Text(
//               date,
//               style: TextStyle(
//                 color: Colors.grey.shade600,
//                 fontSize: 13,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               text,
//               style: const TextStyle(height: 1.4),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }