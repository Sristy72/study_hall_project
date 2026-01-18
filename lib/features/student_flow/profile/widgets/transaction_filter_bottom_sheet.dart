import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionFilterBottomSheet extends StatefulWidget {
  const TransactionFilterBottomSheet({super.key});

  @override
  State<TransactionFilterBottomSheet> createState() => _TransactionFilterBottomSheetState();
}

class _TransactionFilterBottomSheetState extends State<TransactionFilterBottomSheet> {
  DateTime? fromDate;
  DateTime? toDate;
  
  // Status check states
  bool isCompleted = false;
  bool isPending = false;
  bool isFailed = false;
  bool isCancelled = true; // Pre-checked as per image
  bool isRefunded = false;

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
              primary: Color(0xFF3B82F6), // Blue color
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 16),
          
          // Header
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
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          
          SizedBox(height: 16),
          
          Text(
            'Date',
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563),
            ),
          ),
          SizedBox(height: 8),
          
          Text('From', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          SizedBox(height: 6),
          _buildDateField(
            fromDate != null ? DateFormat('dd MMM yyyy').format(fromDate!) : "Date",
            () => _selectDate(context, false),
          ),
          
          SizedBox(height: 12),
          
          Text('To', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          SizedBox(height: 6),
          _buildDateField(
            toDate != null ? DateFormat('dd MMM yyyy').format(toDate!) : "Date",
            () => _selectDate(context, true),
          ),
          
          SizedBox(height: 24),
          
          Text(
            'Status',
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563),
            ),
          ),
          SizedBox(height: 12),
          
          _buildCheckbox("Completed", isCompleted, (val) => setState(() => isCompleted = val!)),
          _buildCheckbox("Pending", isPending, (val) => setState(() => isPending = val!)),
          _buildCheckbox("Failed", isFailed, (val) => setState(() => isFailed = val!)),
          _buildCheckbox("Cancelled", isCancelled, (val) => setState(() => isCancelled = val!)),
          _buildCheckbox("Refunded", isRefunded, (val) => setState(() => isRefunded = val!)),
          
          SizedBox(height: 32),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                         fromDate = null;
                         toDate = null;
                         isCompleted = false;
                         isPending = false;
                         isFailed = false;
                         isCancelled = false;
                         isRefunded = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE5E7EB),
                      foregroundColor: Color(0xFF4B5563),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Clear',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
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
                      // Apply filter logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3B82F6),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Apply Filters',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
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
                fontSize: 14,
              ),
            ),
            Icon(Icons.calendar_today_outlined, color: Colors.grey.shade500, size: 20),
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
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              activeColor: Color(0xFF3B82F6),
              side: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }
}
