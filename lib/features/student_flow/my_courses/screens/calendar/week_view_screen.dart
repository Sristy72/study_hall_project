import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekViewScreen extends StatefulWidget {
  const WeekViewScreen({super.key});

  @override
  State<WeekViewScreen> createState() => _WeekViewScreenState();
}

class _WeekViewScreenState extends State<WeekViewScreen> {
  DateTime selectedWeekStart = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Get the Monday of current week
    selectedWeekStart = _getWeekStart(DateTime.now());
  }

  DateTime _getWeekStart(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  List<DateTime> _getWeekDays() {
    return List.generate(7, (index) => selectedWeekStart.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = _getWeekDays();
    final today = DateTime.now();
    
    return Column(
      children: [
        // Week days header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            children: weekDays.map((date) {
              final isToday = date.year == today.year && 
                             date.month == today.month && 
                             date.day == today.day;
              return _buildDayHeader(
                DateFormat('E').format(date).substring(0, 3),
                date.day.toString(),
                isToday,
              );
            }).toList(),
          ),
        ),
        
        // Time grid
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time labels
                Container(
                  width: 50,
                  child: Column(
                    children: [
                      _buildTimeLabel('8AM'),
                      _buildTimeLabel('9AM'),
                      _buildTimeLabel('10AM'),
                      _buildTimeLabel('11AM'),
                      _buildTimeLabel('12PM'),
                      _buildTimeLabel('1PM'),
                    ],
                  ),
                ),
                
                // Grid
                Expanded(
                  child: Container(
                    height: 600,
                    child: Stack(
                      children: [
                        // Grid lines
                        Column(
                          children: List.generate(6, (index) => 
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey.shade200),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // Vertical lines
                        Row(
                          children: List.generate(7, (index) =>
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: index < 6 ? BorderSide(color: Colors.grey.shade200) : BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // Course blocks (sample data)
                        Positioned(
                          left: (MediaQuery.of(context).size.width - 50) / 7 * 1 + 8,
                          top: 8,
                          width: (MediaQuery.of(context).size.width - 50) / 7 - 16,
                          child: _buildWeekCourseBlock('Art class', Color(0xFFFBBF24)),
                        ),
                        Positioned(
                          left: (MediaQuery.of(context).size.width - 50) / 7 * 3 + 8,
                          top: 208,
                          width: (MediaQuery.of(context).size.width - 50) / 7 - 16,
                          child: _buildWeekCourseBlock('Art class', Color(0xFF3B82F6)),
                        ),
                        Positioned(
                          left: (MediaQuery.of(context).size.width - 50) / 7 * 1 + 8,
                          top: 408,
                          width: (MediaQuery.of(context).size.width - 50) / 7 - 16,
                          child: _buildWeekCourseBlock('Art class', Color(0xFF10B981)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildDayHeader(String day, String date, bool isToday) {
    return Expanded(
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isToday ? Color(0xFF3B82F6) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              date,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isToday ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTimeLabel(String time) {
    return Container(
      height: 100,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 8, top: 4),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 11,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
  
  Widget _buildWeekCourseBlock(String title, Color color) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
