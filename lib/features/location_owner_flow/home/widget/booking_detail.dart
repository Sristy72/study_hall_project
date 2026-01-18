import 'dart:ui';

import 'booking.dart';


class StatusStyle {
  final String label;
  final Color bg;
  final Color text;

  StatusStyle(this.label, this.bg, this.text);
}

StatusStyle getStatusStyle(BookingStatus status) {
  switch (status) {
    case BookingStatus.ongoing:
      return StatusStyle(
        'Ongoing',
        const Color(0xFFE6F0FF),
        const Color(0xFF3B82F6),
      );
    case BookingStatus.finished:
      return StatusStyle(
        'Finished',
        const Color(0xFFDCFCE7),
        const Color(0xFF22C55E),
      );
    case BookingStatus.cancelled:
      return StatusStyle(
        'Cancelled',
        const Color(0xFFFEE2E2),
        const Color(0xFFEF4444),
      );
  }
}
