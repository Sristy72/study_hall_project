import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CourseFilterBottomSheet extends StatefulWidget {
  const CourseFilterBottomSheet({super.key});

  @override
  State<CourseFilterBottomSheet> createState() => _CourseFilterBottomSheetState();
}

class _CourseFilterBottomSheetState extends State<CourseFilterBottomSheet> {
  // Checkbox states
  bool isOngoing = false;
  bool isOnline = false;
  bool isOffline = false;
  bool isCancelled = true; // Example checked state from design
  bool isFinished = false;

  // Date states
  DateTime? toDate;
  DateTime? fromDate;

  Future<void> _selectDate(BuildContext context, bool isToDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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

    if (picked != null) {
      setState(() {
        if (isToDate) {
          toDate = picked;
        } else {
          fromDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.close, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Date',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'To',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          SizedBox(height: 8),
          _buildDateField(
            toDate != null 
              ? DateFormat('dd MMM yyyy').format(toDate!)
              : "Date",
            () => _selectDate(context, true),
          ),
          SizedBox(height: 12),
          Text(
            'From',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          SizedBox(height: 8),
          _buildDateField(
            fromDate != null 
              ? DateFormat('dd MMM yyyy').format(fromDate!)
              : "Date",
            () => _selectDate(context, false),
          ),
          SizedBox(height: 24),
          Text(
            'Type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 16),
          _buildCheckbox("Ongoing", isOngoing, (v) => setState(() => isOngoing = v!)),
          _buildCheckbox("Online", isOnline, (v) => setState(() => isOnline = v!)),
          _buildCheckbox("Offline", isOffline, (v) => setState(() => isOffline = v!)),
          _buildCheckbox("Cancelled", isCancelled, (v) => setState(() => isCancelled = v!)),
          _buildCheckbox("Finished", isFinished, (v) => setState(() => isFinished = v!)),
          
          SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                   height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Clear logic
                      setState(() {
                        toDate = null;
                        fromDate = null;
                        isOngoing = false;
                        isOnline = false;
                        isOffline = false;
                        isCancelled = false;
                        isFinished = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Clear'),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      // Apply logic - you can add filter application here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3B82F6),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Apply Filters'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16), // Bottom padding safe area
        ],
      ),
    );
  }

  Widget _buildDateField(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: text == "Date" ? Colors.black54 : Colors.black,
                fontWeight: text == "Date" ? FontWeight.normal : FontWeight.w500,
              ),
            ),
            Icon(Icons.calendar_today, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              activeColor: Color(0xFF3B82F6),
              side: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
