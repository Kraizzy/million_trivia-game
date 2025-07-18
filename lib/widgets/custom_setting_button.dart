// lib/widgets/custom_setting_button.dart
import 'package:flutter/material.dart';

class CustomSettingButton extends StatelessWidget {
  final IconData icon;          // Icon shown at the start
  final String title;           // Main text like "Sound"
  final String subtitle;        // Subtext like "ON" or "English"
  final VoidCallback onTap;     // What happens when clicked
  final Widget? leadingImage;   // Optional flag image (e.g. UK flag)

  const CustomSettingButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.icon,
    this.leadingImage,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white, // You can change to match your theme
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Optional image or icon (e.g., flag or sound icon)
            leadingImage ?? Icon(icon, color: Colors.black, size: 28),
            const SizedBox(width: 16),
            // Text Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 112, 112, 112))),
                  const SizedBox(height: 3),
                  Text(subtitle,
                      style: TextStyle(
                          fontSize: screenHeight * 0.0135, color: Colors.black)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
