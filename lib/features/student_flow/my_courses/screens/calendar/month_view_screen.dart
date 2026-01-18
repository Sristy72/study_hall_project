import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthViewScreen extends StatefulWidget {
  const MonthViewScreen({super.key});

  @override
  State<MonthViewScreen> createState() => _MonthViewScreenState();
}

class _MonthViewScreenState extends State<MonthViewScreen> {
  DateTime selectedMonth = DateTime.now();

  List<DateTime> _getMonthDays() {
    final firstDay = DateTime(selectedMonth.year, selectedMonth.month, 1);
    final lastDay = DateTime(selectedMonth.year, selectedMonth.month + 1, 0);
    
    // Get the weekday of the first day (1 = Monday, 7 = Sunday)
    final firstWeekday = firstDay.weekday;
    
    // Calculate days from previous month to show
    final daysFromPrevMonth = firstWeekday - 1;
    final startDate = firstDay.subtract(Duration(days: daysFromPrevMonth));
    
    // Generate 35 or 42 days (5 or 6 weeks)
    final totalDays = 35;
    return List.generate(totalDays, (index) => startDate.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final monthDays = _getMonthDays();
    final today = DateTime.now();
    
    return Column(
      children: [
        // Week days header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            children: [
              _buildWeekDayLabel('Mon'),
              _buildWeekDayLabel('Tue'),
              _buildWeekDayLabel('Wed'),
              _buildWeekDayLabel('Thr'),
              _buildWeekDayLabel('Fri'),
              _buildWeekDayLabel('Sat'),
              _buildWeekDayLabel('Sun'),
            ],
          ),
        ),
        
        // Calendar grid
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: List.generate(5, (weekIndex) {
                final weekDays = monthDays.skip(weekIndex * 7).take(7).toList();
                return _buildWeekRow(weekDays, today);
              }),
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildWeekDayLabel(String day) {
    return Expanded(
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  
  Widget _buildWeekRow(List<DateTime> days, DateTime today) {
    return Expanded(
      child: Row(
        children: days.map((date) {
          final isToday = date.year == today.year && 
                         date.month == today.month && 
                         date.day == today.day;
          final isCurrentMonth = date.month == selectedMonth.month;
          
          // Sample course data (you can replace with real data)
          final hasCourses = (date.day == 1 && isCurrentMonth) || 
                            (date.day == 9 && isCurrentMonth);
          
          return Expanded(
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isToday ? Color(0xFF3B82F6) : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: !isCurrentMonth 
                            ? Colors.grey.shade400 
                            : isToday 
                              ? Colors.white 
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  if (hasCourses && date.day == 1) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFFBBF24),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Art class',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFF3B82F6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Art class',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                  if (hasCourses && date.day == 9) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFF10B981),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Art class',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
