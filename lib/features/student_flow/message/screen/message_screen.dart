import 'package:flutter/material.dart';

import '../../../../core/common/constants/back_button.dart';
import '../widget/chat_tile.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              //padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔹 Header
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Row(
                      children: const [
                        CustomBackButton2(),
                        SizedBox(width: 16),
                        Text(
                          'Message',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 17),

                  /// 🔹 Search bar
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: _searchBar(),
                  ),

                  SizedBox(height: 12,),

                  Container(
                    height: 1.5,
                    color: const Color(
                      0xFFE5E7EB,
                    ), // very light gray - very popular now
                  ),
                  const SizedBox(height: 16),


                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ChatTile(
                        name: "Marilyn George",
                        message: "Sure! let me tell you about what happ...",
                        time: "Now",
                        unreadCount: 2,
                        image: "https://i.pravatar.cc/150?img=1",
                      ),
                      ChatTile(
                        name: "Tiana Dokidis",
                        message: "Sure! let me tell you about what happ...",
                        time: "Now",
                        unreadCount: 2,
                        online: true,
                        image: "https://i.pravatar.cc/150?img=2",
                      ),
                      ChatTile(
                        name: "Zain Schleifer",
                        message: "You : Morning zain, I have question for...",
                        time: "13:00 PM",
                        sent: true,
                        image: "https://i.pravatar.cc/150?img=3",
                      ),
                      ChatTile(
                        name: "Alfonso Siphron",
                        message: "You : Morning zain, I have question for...",
                        time: "13:00 PM",
                        sent: true,
                        image: "https://i.pravatar.cc/150?img=4",
                      ),
                      ChatTile(
                        name: "Alfonso Siphron",
                        message: "You : Morning zain, I have question for...",
                        time: "13:00 PM",
                        sent: true,
                        image: "https://i.pravatar.cc/150?img=4",
                      ),
                      ChatTile(
                        name: "Alfonso Siphron",
                        message: "You : Morning zain, I have question for...",
                        time: "13:00 PM",
                        sent: true,
                        image: "https://i.pravatar.cc/150?img=4",
                      ),
                      ChatTile(
                        name: "Kianna Culhane",
                        message: "You : Morning zain, I have question for...",
                        time: "13:00 PM",
                        read: true,
                        image: "https://i.pravatar.cc/150?img=5",
                      ),
                      ChatTile(
                        name: "Marley Geidt",
                        message: "You : Morning zain, I have question for...",
                        time: "13:00 PM",
                        read: true,
                        online: true,
                        image: "https://i.pravatar.cc/150?img=6",
                      ),
                      ChatTile(
                        name: "Marley Geidt",
                        message: "You : Morning zain, I have question for...",
                        time: "13:00 PM",
                        read: true,
                        online: true,
                        image: "https://i.pravatar.cc/150?img=6",
                      ),
                      ChatTile(
                        name: "Marley Geidt",
                        message: "You : Morning zain, I have question for...",
                        time: "13:00 PM",
                        read: true,
                        online: true,
                        image: "https://i.pravatar.cc/150?img=6",
                      ),
                    ],
                  ),


                  // Changed to ListView.

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
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
        GestureDetector(
          onTap: () {
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
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
        ),
      ],
    );
  }
}
