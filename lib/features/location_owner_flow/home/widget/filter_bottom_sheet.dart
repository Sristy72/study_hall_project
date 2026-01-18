import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool ongoing = false;
  bool online = false;
  bool offline = false;
  bool cancelled = true;
  bool finished = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 Header
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Filter",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// 🔹 Date
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: const Text(
            "Date",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),

        _dateField("To"),
        const SizedBox(height: 12),
        _dateField("From"),

        const SizedBox(height: 20),

        /// 🔹 Type
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: const Text(
            "Type",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),

        _checkItem("Ongoing", ongoing, (v) => setState(() => ongoing = v)),
        _checkItem("Online", online, (v) => setState(() => online = v)),
        _checkItem("Offline", offline, (v) => setState(() => offline = v)),
        _checkItem("Cancelled", cancelled, (v) => setState(() => cancelled = v)),
        _checkItem("Finished", finished, (v) => setState(() => finished = v)),

        const SizedBox(height: 24),

        /// 🔹 Buttons
        Container(

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(0, -3),
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFE5E7EB),
                      foregroundColor: const Color(0xFF6B7280),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      setState(() {
                        ongoing = false;
                        online = false;
                        offline = false;
                        cancelled = false;
                        finished = false;
                      });
                    },
                    child: const Text("Clear"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Apply Filters"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 🔹 Date field
  Widget _dateField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 6),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Date",
              suffixIcon: const Icon(Icons.calendar_today_outlined, size: 20),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Checkbox row
  Widget _checkItem(String text, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: CheckboxListTile(
        value: value,
        onChanged: (v) => onChanged(v!),
        title: Text(text),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        activeColor: const Color(0xFF3B82F6),
      ),
    );
  }
}
