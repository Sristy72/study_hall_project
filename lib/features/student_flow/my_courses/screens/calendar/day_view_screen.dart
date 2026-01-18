import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DayViewScreen extends StatefulWidget {
  const DayViewScreen({super.key});

  @override
  State<DayViewScreen> createState() => _DayViewScreenState();
}

class _DayViewScreenState extends State<DayViewScreen> {
  DateTime selectedDate = DateTime.now();

  void _changeDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
    });
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF3B82F6),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Date selector
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: _selectDate,
                child: Row(
                  children: [
                    Text(
                      DateFormat('EEEE dd MMMM yyyy').format(selectedDate),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_down, size: 20),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left, size: 24),
                    onPressed: () => _changeDate(-1),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    icon: Icon(Icons.chevron_right, size: 24),
                    onPressed: () => _changeDate(1),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Timeline
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildTimeSlot('8:00 Am', 
                courseWidget: _buildCourseBlock(
                  'How to write Cover Letter for Fresher',
                  '08:00 - 8:30 Am',
                  Color(0xFFFBBF24),
                ),
              ),
              _buildTimeSlot('8:30 Am'),
              Divider(color: Colors.grey.shade300, height: 1),
              _buildTimeSlot('9:00 Am'),
              _buildTimeSlot('9:30 Am'),
              _buildTimeSlot('10:00 Am',
                courseWidget: _buildCourseBlock(
                  'How to write Cover Letter for Fresher',
                  '10:00 - 10:30 Am',
                  Color(0xFF3B82F6),
                ),
              ),
              _buildTimeSlot('10:30 Am'),
              Divider(color: Colors.grey.shade300, height: 1),
              _buildTimeSlot('11:00 Am'),
              _buildTimeSlot('11:30 Am'),
              _buildTimeSlot('12:00 Pm'),
              _buildTimeSlot('12:30 Pm'),
              _buildTimeSlot('1:00 Pm'),
              _buildTimeSlot('1:30 Pm'),
              _buildTimeSlot('2:00 Pm'),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildTimeSlot(String time, {Widget? courseWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              time,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: courseWidget ?? SizedBox(height: 40),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCourseBlock(String title, String time, Color color) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
