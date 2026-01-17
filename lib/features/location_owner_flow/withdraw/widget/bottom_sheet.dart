import 'package:flutter/material.dart';

class WithdrawalFilterBottomSheet extends StatefulWidget {
  const WithdrawalFilterBottomSheet({super.key});

  @override
  State<WithdrawalFilterBottomSheet> createState() =>
      _WithdrawalFilterBottomSheetState();
}

class _WithdrawalFilterBottomSheetState
    extends State<WithdrawalFilterBottomSheet> {
  bool all = false;
  bool completed = true;
  bool pending = false;
  bool rejected = false;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      maxChildSize: 0.75,
      minChildSize: 0.45,
      builder: (_, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Stack(
            children: [
              /// 🔹 Scrollable content
              SingleChildScrollView(
                controller: controller,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔹 Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.close),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      const Text("Date", style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 12),
                      const Text('From'),
                      const SizedBox(height: 2),
                      _dateField("Date"),
                      const SizedBox(height: 12),
                      const Text('To'),
                      const SizedBox(height: 2),
                      _dateField("Date"),
                      const SizedBox(height: 16),
                      const Text("Type", style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(height: 6,),
                      _checkTile("All", all, (v) => setState(() => all = v)),
                      _checkTile("Completed", completed, (v) => setState(() => completed = v)),
                      _checkTile("Pending", pending, (v) => setState(() => pending = v)),
                      _checkTile("Rejected", rejected, (v) => setState(() => rejected = v)),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              /// 🔹 Fixed bottom buttons
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 20, bottom: 16, left: 16, right: 16), // only vertical padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, -3), // shadow goes above
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max, // ensure it stretches full width
                    children: [
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFE5E7EB),
                            side: BorderSide.none,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              all = false;
                              completed = false;
                              pending = false;
                              rejected = false;
                            });
                          },
                          child: const Text(
                            "Clear",
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3B82F6),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Apply Filters",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }


  Widget _dateField(String label) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: Colors.black),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),

        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SizedBox(
            height: 16,
            width: 16,
            child: Image.asset(
              'assets/images/calendar.png',
              fit: BoxFit.contain,
            ),
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
    );
  }


  Widget _checkTile(String title, bool value, Function(bool) onChanged) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: value,
                onChanged: (v) => onChanged(v!),
                activeColor: const Color(0xFF3B82F6),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
