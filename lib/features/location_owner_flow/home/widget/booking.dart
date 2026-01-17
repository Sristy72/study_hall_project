import 'dart:ui';

enum BookingStatus {
  ongoing,
  cancelled,
  finished,
}
class StatusConfig {
  final String label;
  final Color bgColor;
  final Color textColor;

  StatusConfig({
    required this.label,
    required this.bgColor,
    required this.textColor,
  });
}

StatusConfig getStatusConfig(BookingStatus status) {
  switch (status) {
    case BookingStatus.ongoing:
      return StatusConfig(
        label: 'Ongoing',
        bgColor: const Color(0xFFE6F0FF),
        textColor: const Color(0xFF3B82F6),
      );
    case BookingStatus.cancelled:
      return StatusConfig(
        label: 'Cancelled',
        bgColor: const Color(0xFFFCE4EC),
        textColor: const Color(0xFFE91E63),
      );
    case BookingStatus.finished:
      return StatusConfig(
        label: 'Finished',
        bgColor: const Color(0xFFE8F5E9),
        textColor: const Color(0xFF4CAF50),
      );
  }
}
