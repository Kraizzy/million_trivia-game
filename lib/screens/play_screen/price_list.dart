import 'package:flutter/material.dart';
import 'package:millionaire_trivia/data/price_data.dart';

class PriceList extends StatefulWidget {
  const PriceList({super.key});

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> with TickerProviderStateMixin {
  final List<String> prices = [
    '\$1,000',
    '\$2,000',
    '\$4,000',
    '\$6,000',
    '\$10,000',
    '\$15,000',
    '\$20,000',
    '\$25,000',
    '\$30,000',
    '\$50,000',
    '\$100,000',
    '\$200,000',
    '\$500,000',
    '\$1,000,000',
    '\$2,000,000',
  ];

  final List<AnimationController> _controllers = [];
  final List<Animation<Offset>> _slideAnimations = [];
  final List<Animation<double>> _fadeAnimations = [];

  bool _isExiting = false;
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < prices.length; i++) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      );

      final slide =
          Tween<Offset>(
            begin: const Offset(1.5, 0), // Slide from further right
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic),
          );

      final fade = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

      _controllers.add(controller);
      _slideAnimations.add(slide);
      _fadeAnimations.add(fade);

      // Delay start to create staggered effect
      Future.delayed(Duration(milliseconds: i * 100), () {
        if (mounted) controller.forward();
      });
    }
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
            colors: [
              Color.fromARGB(255, 67, 2, 124),
              Color.fromARGB(255, 39, 9, 88),
            ],
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
                  _isExiting = true;

                  // Reverse animations with staggered delay
                  for (int i = 0; i < _controllers.length; i++) {
                    Future.delayed(Duration(milliseconds: i * 60), () {
                      if (mounted) _controllers[i].reverse();
                    });
                  }

                  // Pop the screen after all exit animations finish
                  Future.delayed(
                    Duration(milliseconds: (_controllers.length * 60) + 600),
                    () {
                      // ignore: use_build_context_synchronously
                      if (mounted) Navigator.pop(context);
                    },
                  );
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
                  return FadeTransition(
                    opacity: _fadeAnimations[index],
                    child: SlideTransition(
                      position: _slideAnimations[index],
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: screenHeight * 0.043,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 7, 13, 64),
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
