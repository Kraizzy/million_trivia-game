import 'package:flutter/material.dart';
import 'package:millionaire_trivia/data/price_data.dart';

class PriceList extends StatefulWidget {
  final int currentEarningIndex;
  const PriceList({super.key, required this.currentEarningIndex});

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<Offset>> _slideAnimations = [];
  final List<Animation<double>> _fadeAnimations = [];

  bool _isExiting = false;

  @override
  void initState() {
    super.initState();

    // 🟡 Auto dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (!_isExiting && mounted) {
        _dismissWithAnimations();
      }
    });

    for (int i = 0; i < prices.length; i++) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      );

      final slide = Tween<Offset>(
        begin: const Offset(1.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic));

      final fade = Tween<double>(begin: 0.0, end: 1.0)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

      _controllers.add(controller);
      _slideAnimations.add(slide);
      _fadeAnimations.add(fade);

      Future.delayed(Duration(milliseconds: i * 100), () {
        if (mounted) controller.forward();
      });
    }
  }

  void _dismissWithAnimations() {
    _isExiting = true;

    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 60), () {
        if (mounted) _controllers[i].reverse();
      });
    }

    Future.delayed(
      Duration(milliseconds: (_controllers.length * 60) + 600),
      () {
        if (mounted) Navigator.pop(context);
      },
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 67, 2, 124), Color.fromARGB(255, 39, 9, 88)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  if (_isExiting) return;
                  _dismissWithAnimations();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: prices.length,
                itemBuilder: (context, index) {
                  final isCurrent = index == widget.currentEarningIndex;
                  final isAchieved = index < widget.currentEarningIndex;

                  Color tileColor;
                  if (isCurrent) {
                    tileColor = Colors.orange;
                  } else if (isAchieved) {
                    tileColor = const Color.fromARGB(255, 70, 240, 75);
                  } else {
                    tileColor = const Color.fromARGB(255, 7, 13, 64);
                  }

                  return FadeTransition(
                    opacity: _fadeAnimations[index],
                    child: SlideTransition(
                      position: _slideAnimations[index],
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: screenHeight * 0.043,
                        decoration: BoxDecoration(
                          color: tileColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: screenHeight * 0.032,
                              height: screenHeight * 0.032,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                prices[index],
                                style: TextStyle(
                                  fontSize: screenHeight * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
