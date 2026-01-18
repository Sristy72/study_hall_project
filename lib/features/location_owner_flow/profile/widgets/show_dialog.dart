import 'package:flutter/material.dart';

Future<bool?> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon circle
            Image.asset('assets/images/logout.png'),

            const SizedBox(height: 24),

            const Text(
              "Logout Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Do you want to logout your account?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF374151),
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 32),

            // Buttons
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () async {final shouldLogout = await showLogoutDialog(context);

                if (shouldLogout == true) {
                  // Perform logout logic here
                  // e.g. await authService.signOut();
                  // Navigator.pushReplacementNamed(context, '/login');
                }},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6), // blue-600
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.transparent),
                  backgroundColor: const Color(0xFFE5E7EB), // slate-100
                  foregroundColor: const Color(0xFF334155), // slate-700
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4B5563)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}