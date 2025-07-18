import 'package:flutter/material.dart';

class LanguageModal extends StatefulWidget {
  const LanguageModal({super.key});

  @override
  State<LanguageModal> createState() => _LanguageModalState();
}

class _LanguageModalState extends State<LanguageModal> {
  final List<Map<String, String>> languages = [
    {"name": "Arabic", "emoji": "🇸🇦"},
    {"name": "Chinese", "emoji": "🇨🇳"},
    {"name": "English", "emoji": "🇬🇧"},
    {"name": "French", "emoji": "🇫🇷"},
    {"name": "German", "emoji": "🇩🇪"},
    {"name": "Hindi", "emoji": "🇮🇳"},
    {"name": "Indonesia", "emoji": "🇮🇩"},
    {"name": "Japanese", "emoji": "🇯🇵"},
    {"name": "Korean", "emoji": "🇰🇷"},
    {"name": "Malay", "emoji": "🇲🇾"},
    {"name": "Portuguese", "emoji": "🇵🇹"},
    {"name": "Spanish", "emoji": "🇪🇸"},
    {"name": "Thai", "emoji": "🇹🇭"},
    {"name": "Turkish", "emoji": "🇹🇷"},
    {"name": "Urdu", "emoji": "🇵🇰"},
    {"name": "Vietnamese", "emoji": "🇻🇳"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8), // semi-transparent overlay
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Select Your Language',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: languages.map((lang) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple, // purple background
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Handle language selection
                          Navigator.of(context).pop(lang['name']);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  lang['emoji'] ?? '',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  lang['name'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// Close button at bottom center
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.black, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
