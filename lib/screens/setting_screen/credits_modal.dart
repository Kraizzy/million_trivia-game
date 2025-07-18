// lib/screens/credits_modal.dart
import 'package:flutter/material.dart';

class CreditsModal extends StatelessWidget {
  const CreditsModal({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(
        0.8,
      ), // semi-transparent overlay
      body: SafeArea(
        child: Stack(
          children: [
            /// ❌ Close button (top-right)
            Positioned(
              bottom:  25,
              right: 0,
              left: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),

                  child: const Icon(Icons.close, size: 28, color: Colors.black)),

              ),
            ),

            /// Centered content panel
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 48,
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E0A2F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Meet Our Team',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),

                      ...[
                        'Chukwudi Edoga',
                        'Clinton Onuigbo',
                        'Dike Kingsley Oneh',
                        'Ubesie Kenechukwu',
                        'Vincent Sunday',
                        'Amos Lucky Chibueze',
                        'Toochukwu Dennis',
                        'Kizito C. Nnamuchi',
                      ].map(
                        (name) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            name,
                            style: const TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      const _ContactRow(
                        icon: Icons.facebook,
                        text: '@Digitaldreamsng',
                      ),
                      const _ContactRow(
                        icon: Icons.alternate_email,
                        text: '@DigitalDreamsNG',
                      ),
                      const _ContactRow(
                        icon: Icons.mail_outline,
                        text: 'info@digitaldreamsng.com',
                      ),
                      const _ContactRow(
                        icon: Icons.call,
                        text: '+234 906 466 0137',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
