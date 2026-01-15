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
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            controller: controller,
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

                /// 🔹 Date
                const Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),

                Text('From'),
                SizedBox(height: 2,),
                _dateField("Date"),
                const SizedBox(height: 12),
                Text('To'),
                SizedBox(height: 2,),
                _dateField("Date"),

                const SizedBox(height: 24),

                /// 🔹 Type
                const Text(
                  "Type",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),

                _checkTile("All", all, (v) {
                  setState(() => all = v);
                }),
                _checkTile("Completed", completed, (v) {
                  setState(() => completed = v);
                }),
                _checkTile("Pending", pending, (v) {
                  setState(() => pending = v);
                }),
                _checkTile("Rejected", rejected, (v) {
                  setState(() => rejected = v);
                }),

                const SizedBox(height: 24),

                /// 🔹 Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            all = false;
                            completed = false;
                            pending = false;
                            rejected = false;
                          });
                        },
                        child: const Text("Clear"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Apply Filters"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
        suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
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
    return CheckboxListTile(
      value: value,
      onChanged: (v) => onChanged(v!),
      title: Text(title),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      activeColor: const Color(0xFF3B82F6),
    );
  }
}
