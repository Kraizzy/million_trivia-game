import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/replay_screen/fail_replay_screen.dart';

class FailedModal extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback onGiveup;

  const FailedModal({
    super.key,
    required this.onContinue,
    required this.onGiveup,
  });

  @override
  State<FailedModal> createState() => _FailedModalState();
}

class _FailedModalState extends State<FailedModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 96, 20, 184),
              const Color.fromARGB(255, 53, 11, 92),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.cancel_outlined,
                    color: const Color.fromARGB(255, 243, 28, 13),
                    size: 45,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),

            Text(
              'You missed the correct answer',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Continue by watching Ad',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(185, 76, 105, 201),
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            GestureDetector(
              onTap: widget.onContinue,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 72, 196, 0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.ondemand_video_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
             GestureDetector(
              onTap: () {
                Navigator.push(context, 
                
                MaterialPageRoute(builder: (context) => FailedScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(139, 1, 21, 48),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: InkWell(
                    child: Text(
                      'Give up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
