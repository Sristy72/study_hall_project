import 'package:flutter/material.dart';

import '../../../../core/common/constants/back_button.dart';
import '../../withdraw/widget/checkbox.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: const [
                        CustomBackButton2(),
                        SizedBox(width: 16),
                        Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Divider(
                    height: 1.5,
                    thickness: 1.5,
                    color: Color(0xFFE5E7EB),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'All',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            SizedBox(width: 12,),

                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFE5E7EB),
                                    width: 1.2,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  'Unread',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        Spacer(),
                        MarkAllAsReadHeader()
                      ],
                    ),
                  ),

                  const _SectionHeader(title: 'Today'),
                  const _NotificationTile(time: 'Now', isUnread: true),
                  const _NotificationTile(time: 'Now', isUnread: true),
                  const _NotificationTile(time: 'Now', isUnread: true),
                  const _NotificationTile(time: 'Now', isUnread: true),

                  const _SectionHeader(title: 'Yesterday'),
                  const _NotificationTile(time: 'Now', isUnread: true),
                  const _NotificationTile(time: 'Now', isUnread: true),

                  const _SectionHeader(title: 'Last 7 days'),
                  const _NotificationTile(time: 'Now', isUnread: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String time;
  final bool isUnread;

  const _NotificationTile({required this.time, this.isUnread = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFBBF24),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/bell-check.png'),
              ),
            ),
          ),
          title: const Text(
            'You have a new reservation at 13:00',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Please check your calendar at 13:00\n',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  TextSpan(
                    text: 'Thank you for using Study Hall.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
              if (isUnread)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          onTap: () {},
        ),

        /// Divider after each notification
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(height: 1, color: Colors.grey[300]),
        ),
      ],
    );
  }
}
