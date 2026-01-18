import 'package:flutter/material.dart';

class ReferTutorDialog extends StatelessWidget {
  const ReferTutorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final link = "  http://studyhall.com/e/sdjhbchjsdbc";

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close_rounded, size: 28),
                color: Colors.grey[600],
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 8),

            // Illustration
            Image.asset(
              'assets/images/tutor.png'
            ),

            const SizedBox(height: 24),

            const Text(
              "Refer a Tutor",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Please enter your tutor's email to send Study Hall invitation",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Email field
            TextField(
              decoration: InputDecoration(
                //labelText: "Tutor's email address",
                hintText: "Ex. johnde.com",
                hintStyle: TextStyle(color: Color(0xFF1F2937)),
                prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF1F2937),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 24),

            // Send button
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Send invitation logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Invitation sent! 🎉")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3B82F6),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Send",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // OR divider
            Row(
              children: [
                Expanded(child: Divider(color: Color(0xFF5D6A85))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "OR",
                    style: TextStyle(color: Color(0xFF4B5563), fontSize: 14),
                  ),
                ),
                Expanded(child: Divider(color: Color(0xFF5D6A85))),
              ],
            ),

            const SizedBox(height: 24),

            // Copy link section
            const Text(
              "Copy link below and share via social network",
              style: TextStyle(color: Color(0xFF374151), fontSize: 14, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(link, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),)
                  ),

                  IconButton(
                    icon: const Icon(Icons.copy_rounded, size: 20, color: Color(0xFF3B82F6),),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey[800],
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onPressed: () {
                      // TODO: Use Clipboard.setData()
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Link copied!")),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}