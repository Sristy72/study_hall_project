import 'package:flutter/material.dart';
import 'package:study_hall_project/features/location_owner_flow/withdraw/widget/balanced_card.dart';

import '../../../../core/common/constants/back_button.dart';
import '../widget/bottom_sheet.dart';
import '../widget/trancaction_item.dart';
import '../widget/withdrawl_detail.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
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
                          'Withdrawal Management',
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
                    child: BalanceCard(),
                  ),

                  SizedBox(height: 16),

                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Completed", onTap: () { showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => WithdrawalDetailBottomSheet(
                          requestId: "W20210615000001",
                          requestDate: "22/06/2025 15:30:10",
                          status: "Completed",
                          amount: 100.00,
                          bankName: "Bank of America",
                          accountNumber: "00025232431001",
                          accountHolder: "NGAN PHAM",
                        ),
                      ); },
                      ),
                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Pending", onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => WithdrawalDetailBottomSheet(
                            requestId: "W20210615000001",
                            requestDate: "22/06/2025 15:30:10",
                            status: "Pending",
                            amount: 100.00,
                            bankName: "Bank of America",
                            accountNumber: "00025232431001",
                            accountHolder: "NGAN PHAM",
                          ),
                        );
                      },
                      ),
                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Rejected", onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => WithdrawalDetailBottomSheet(
                            requestId: "W20210615000001",
                            requestDate: "22/06/2025 15:30:10",
                            status: "Rejected",
                            amount: 100.00,
                            bankName: "Bank of America",
                            accountNumber: "00025232431001",
                            accountHolder: "NGAN PHAM",
                            rejectReason: 'your request is invalid',
                          ),
                        );
                      },
                      ),
                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Completed", onTap: () { showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => WithdrawalDetailBottomSheet(
                          requestId: "W20210615000001",
                          requestDate: "22/06/2025 15:30:10",
                          status: "Completed",
                          amount: 100.00,
                          bankName: "Bank of America",
                          accountNumber: "00025232431001",
                          accountHolder: "NGAN PHAM",
                        ),
                      ); },
                      ),

                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Pending", onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => WithdrawalDetailBottomSheet(
                            requestId: "W20210615000001",
                            requestDate: "22/06/2025 15:30:10",
                            status: "Pending",
                            amount: 100.00,
                            bankName: "Bank of America",
                            accountNumber: "00025232431001",
                            accountHolder: "NGAN PHAM",
                          ),
                        );
                      },
                      ),

                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Rejected", onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => WithdrawalDetailBottomSheet(
                            requestId: "W20210615000001",
                            requestDate: "22/06/2025 15:30:10",
                            status: "Rejected",
                            amount: 100.00,
                            bankName: "Bank of America",
                            accountNumber: "00025232431001",
                            accountHolder: "NGAN PHAM",
                            rejectReason: 'your request is invalid',
                          ),
                        );
                      },
                      ),


                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Completed", onTap: () { showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => WithdrawalDetailBottomSheet(
                          requestId: "W20210615000001",
                          requestDate: "22/06/2025 15:30:10",
                          status: "Completed",
                          amount: 100.00,
                          bankName: "Bank of America",
                          accountNumber: "00025232431001",
                          accountHolder: "NGAN PHAM",
                        ),
                      ); },
                      ),

                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Pending", onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => WithdrawalDetailBottomSheet(
                            requestId: "W20210615000001",
                            requestDate: "22/06/2025 15:30:10",
                            status: "Pending",
                            amount: 100.00,
                            bankName: "Bank of America",
                            accountNumber: "00025232431001",
                            accountHolder: "NGAN PHAM",
                          ),
                        );
                      },
                      ),

                      TransactionItem(
                        id: "W20210615150000001",
                        amount: 400.00,
                        time: "4:20 PM",
                        date: "Aug 13, 2025",
                        status: "Rejected", onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => WithdrawalDetailBottomSheet(
                            requestId: "W20210615000001",
                            requestDate: "22/06/2025 15:30:10",
                            status: "Rejected",
                            amount: 100.00,
                            bankName: "Bank of America",
                            accountNumber: "00025232431001",
                            accountHolder: "NGAN PHAM",
                            rejectReason: 'your request is invalid',
                          ),
                        );
                      },
                      ),
                    ],
                  ),
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
              builder: (_) => const WithdrawalFilterBottomSheet(),
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
