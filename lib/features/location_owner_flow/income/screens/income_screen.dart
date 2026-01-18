import 'package:flutter/material.dart';
import 'package:study_hall_project/features/location_owner_flow/income/widget/filter.dart';
import 'package:study_hall_project/features/location_owner_flow/income/widget/income_dashboard.dart';
import 'package:study_hall_project/features/location_owner_flow/income/widget/transaction_list.dart';
import 'package:study_hall_project/features/location_owner_flow/withdraw/widget/balanced_card.dart';

import '../../../../core/common/constants/back_button.dart';
import '../../withdraw/widget/bottom_sheet.dart';
import '../../withdraw/widget/trancaction_item.dart';
import '../../withdraw/widget/withdrawl_detail.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              //padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Header
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Row(
                      children: const [
                        CustomBackButton2(),
                        SizedBox(width: 16),
                        Text(
                          'Income Management',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 17),

                  Container(
                    height: 1.5,
                    color: const Color(
                      0xFFE5E7EB,
                    ), // very light gray - very popular now
                  ),
                  const SizedBox(height: 16),

                  /// 🔹 Search bar
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: _searchBar(),
                  ),

                  // Replace your current banner (if any) or add this after the header/divider
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: IncomeDashboard()
                  ),

                  SizedBox(height: 16),

                  TransactionList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFE5E7EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFE5E7EB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFE5E7EB),
                  width: 1.2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const Filter(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/images/filter.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
