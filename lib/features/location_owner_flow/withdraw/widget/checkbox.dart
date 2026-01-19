import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widget/notification_dialog.dart';

class MarkAllAsReadHeader extends StatelessWidget {
  final VoidCallback? onMarkAllRead;
  final bool showCheckbox;
  final bool allRead;

  const MarkAllAsReadHeader({
    super.key,
    this.onMarkAllRead,
    this.showCheckbox = true,
    this.allRead = false,
  });

  void _handleMarkAllAsRead(BuildContext context) {
    // Show confirmation dialog
    showReadNotificationSuccessDialog(
      context, // ← usually needed by dialog
      message: 'Are you sure to mark all notifications as Read? This action cannot be undone',
      buttonText: 'Confirm',
      onTap: () {
        // This runs when user confirms in dialog
        onMarkAllRead?.call();
        // Optional: you can show success snackbar/toast here
        Get.snackbar(
          'Success',
          'All notifications marked as read',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showCheckbox)
            GestureDetector(
              // Makes whole row area clickable (better UX)
              onTap: allRead ? null : () => _handleMarkAllAsRead(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: allRead,
                      onChanged: allRead
                          ? null
                          : (bool? value) {
                        // We handle click via GestureDetector → better control
                        if (!allRead) {
                          _handleMarkAllAsRead(context);
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      side: const BorderSide(
                        width: 0.8,
                        color: Colors.grey,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      activeColor: Theme.of(context).primaryColor,
                      checkColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Mark all as read',
                    style: TextStyle(
                      fontSize: 12,
                      color: allRead ? Colors.grey[500] : Colors.grey[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}