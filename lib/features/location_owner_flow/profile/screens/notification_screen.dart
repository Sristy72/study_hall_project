import 'package:flutter/material.dart';

import '../../../../core/common/constants/back_button.dart';
import '../../withdraw/widget/checkbox.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool reminder = true;
  bool incomeNotice = false;
  bool withdrawStatus = false;
  bool courseStatus = true;
  bool newSessions = true;
  bool signupOtherAccount = true;
  bool kycStatus = true;
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
                  SizedBox(height: 16,),

                  _settingTile(
                    title: 'Reminder',
                    value: reminder,
                    onChanged: (v) => setState(() => reminder = v),
                  ),
                  _settingTile(
                    title: 'Income Notice',
                    value: incomeNotice,
                    onChanged: (v) => setState(() => incomeNotice = v),
                  ),
                  _settingTile(
                    title: 'Withdraw Request Status',
                    value: withdrawStatus,
                    onChanged: (v) => setState(() => withdrawStatus = v),
                  ),
                  _settingTile(
                    title: 'Course Status',
                    value: courseStatus,
                    onChanged: (v) => setState(() => courseStatus = v),
                  ),
                  _settingTile(
                    title: 'New sessions',
                    value: newSessions,
                    onChanged: (v) => setState(() => newSessions = v),
                  ),
                  _settingTile(
                    title: 'Signup other account',
                    value: signupOtherAccount,
                    onChanged: (v) => setState(() => signupOtherAccount = v),
                  ),
                  _settingTile(
                    title: 'KYC Status',
                    value: kycStatus,
                    onChanged: (v) => setState(() => kycStatus = v),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              _customSwitch(value, onChanged),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: const Divider(height: 1, thickness: 0.6, color: Color(0xFFD1D5DB),),
        ),
      ],
    );
  }

  Widget _customSwitch(bool value, ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 44,
        height: 24,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: value ? const Color(0xFF3D7CFF) : Colors.grey.shade300,
        ),
        child: Align(
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: value
                ? const Icon(Icons.check, size: 12, color: Color(0xFF3D7CFF))
                : null,
          ),
        ),
      ),
    );
  }
}
