import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/income_controller.dart';
import '../widgets/income_card_widget.dart';
import '../widgets/transaction_tile_widget.dart';

class IncomeManagementScreen extends StatelessWidget {
  const IncomeManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(IncomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Income Management',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Icon(Icons.search, color: Colors.grey, size: 22),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(Icons.tune_rounded, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),

          // Two big cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _buildCard(
                    title: 'Total income',
                    amount: '1200',
                    percent: '3.56',
                    color: const Color(0xFF5B67FE), // indigo/purple-ish
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildCard(
                    title: 'This Months',
                    amount: '800',
                    percent: '3.56',
                    color: const Color(0xFFFE4C9A), // pink
                    showArrow: true,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Transactions list
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: ctrl.transactions.length,
                itemBuilder: (context, i) {
                  final tx = ctrl.transactions[i];
                  return TransactionItem(
                    amount: tx['amount'],
                    place: tx['place'],
                    date: tx['date'],
                    count: tx['count'],
                  );
                },
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF5B67FE),
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_circle_up_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: ''),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String amount,
    required String percent,
    required Color color,
    bool showArrow = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            '\$$amount',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
         
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.22),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_upward, color: Colors.white, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '$percent%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (showArrow) ...[
                const Spacer(),
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.white, size: 22),
              ],
            ],
          ),
        ],
      ),
    );
  }
}