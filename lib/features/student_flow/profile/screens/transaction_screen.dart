import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hall_project/features/student_flow/profile/widgets/transaction_filter_bottom_sheet.dart';
import 'package:study_hall_project/features/student_flow/profile/widgets/transaction_details_bottom_sheet.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Transaction',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search and Filter
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey.shade600),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      TransactionFilterBottomSheet(),
                      isScrollControlled: true,
                    );
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.tune, color: Colors.grey.shade600),
                  ),
                ),
              ],
            ),
          ),
          
          // Transaction List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildTransactionItem(
                  icon: Icons.check,
                  iconColor: Colors.white,
                  iconBgColor: Color(0xFF10B981),
                  amount: '\$3.000',
                  time: '2:20 PM',
                  date: 'Aug 13, 2025',
                  status: 'Completed',
                  statusColor: Color(0xFF10B981),
                  statusBgColor: Color(0xFFD1FAE5),
                ),
                _buildTransactionItem(
                  icon: Icons.access_time,
                  iconColor: Colors.white,
                  iconBgColor: Color(0xFFFBBF24),
                  amount: '\$1.000',
                  time: '4:20 PM',
                  date: 'Aug 13, 2025',
                  status: 'Pending',
                  statusColor: Color(0xFFFBBF24),
                  statusBgColor: Color(0xFFFEF3C7),
                ),
                _buildTransactionItem(
                  icon: Icons.close,
                  iconColor: Colors.white,
                  iconBgColor: Color(0xFFEF4444),
                  amount: '\$1.000',
                  time: '4:20 PM',
                  date: 'Aug 13, 2025',
                  status: 'Failed',
                  statusColor: Color(0xFFEF4444),
                  statusBgColor: Color(0xFFFEE2E2),
                ),
                _buildTransactionItem(
                  icon: Icons.check,
                  iconColor: Colors.white,
                  iconBgColor: Color(0xFF10B981),
                  amount: '\$3.000',
                  time: '2:20 PM',
                  date: 'Aug 13, 2025',
                  status: 'Completed',
                  statusColor: Color(0xFF10B981),
                  statusBgColor: Color(0xFFD1FAE5),
                ),
                _buildTransactionItem(
                  icon: Icons.access_time,
                  iconColor: Colors.white,
                  iconBgColor: Color(0xFFFBBF24),
                  amount: '\$1.000',
                  time: '4:20 PM',
                  date: 'Aug 13, 2025',
                  status: 'Pending',
                  statusColor: Color(0xFFFBBF24),
                  statusBgColor: Color(0xFFFEF3C7),
                ),
                _buildTransactionItem(
                  icon: Icons.refresh,
                  iconColor: Colors.white,
                  iconBgColor: Color(0xFF3B82F6),
                  amount: '\$5.000',
                  time: '4:20 PM',
                  date: 'Aug 13, 2025',
                  status: 'Refunded',
                  statusColor: Color(0xFF3B82F6),
                  statusBgColor: Color(0xFFDBEAFE),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String amount,
    required String time,
    required String date,
    required String status,
    required Color statusColor,
    required Color statusBgColor,
  }) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          TransactionDetailsBottomSheet(),
          isScrollControlled: true,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$time • $date',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
