import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:millionaire_trivia/models/question_model.dart';
//import 'package:millionaire_trivia/screens/play_screen/congratulation_screen.dart';
import 'package:millionaire_trivia/screens/play_screen/price_list.dart';
import 'package:millionaire_trivia/screens/ready_screen/ready_screen.dart';
import 'package:millionaire_trivia/screens/replay_screen/failed_modal.dart';
import 'package:millionaire_trivia/data/questions_loader.dart';
import 'package:millionaire_trivia/widgets/question_card.dart';
import 'package:millionaire_trivia/widgets/option_tile.dart';
import 'package:millionaire_trivia/data/price_data.dart';
import 'package:millionaire_trivia/widgets/lifelines/lifeline_button.dart';
import 'package:millionaire_trivia/widgets/lifelines/lifeline_overlay.dart';
import 'package:millionaire_trivia/widgets/lifelines/lifeline_manager.dart';
import 'package:millionaire_trivia/widgets/lifelines/lifeline_usage_tracker.dart';

import 'game_exit_modal.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late final AudioPlayer _bgAudioPlayer;
  late final AudioPlayer _successPlayer;
  late final AudioPlayer _failurePlayer;

  List<Question> questions = [];
  int currentStage = 1;
  int currentIndex = 0;
  bool answered = false;
  String? selectedAnswer;

  late LifelineManager lifelineManager;
  late LifelineUsageTracker usageTracker;

  @override
  void initState() {
    super.initState();
    _bgAudioPlayer = AudioPlayer();
    _successPlayer = AudioPlayer();
    _failurePlayer = AudioPlayer();
    usageTracker = LifelineUsageTracker();
    preloadSounds();
    loadStageQuestions(isNewGame: true); // ← Initialize as new game
  }

  Future<void> preloadSounds() async {
    try {
      await _bgAudioPlayer.setReleaseMode(ReleaseMode.loop);
      await _bgAudioPlayer.setSource(
        AssetSource('sounds/background_sound.mp3'),
      );
      await _bgAudioPlayer.resume();

      await _successPlayer.setSource(AssetSource('sounds/success_sound.wav'));
      await _successPlayer.setReleaseMode(ReleaseMode.stop);

      await _failurePlayer.setSource(AssetSource('sounds/failure_sound2.wav'));
      await _failurePlayer.setReleaseMode(ReleaseMode.stop);
    } catch (e) {
      debugPrint('❌ Sound preload error: $e');
    }
  }

  Future<void> playSuccessSound() async {
    try {
      await _successPlayer.stop();
      await _successPlayer.resume();
    } catch (e) {
      debugPrint('❌ Failed to play success sound: $e');
    }
  }

  Future<void> playFailureSound() async {
    try {
      await _failurePlayer.stop();
      await _failurePlayer.resume();
    } catch (e) {
      debugPrint('❌ Failed to play failure sound: $e');
    }
  }

  @override
  void dispose() {
    _bgAudioPlayer.dispose();
    _successPlayer.dispose();
    _failurePlayer.dispose();
    super.dispose();
  }

  Future<void> loadStageQuestions({bool isNewGame = false}) async {
    final stageQuestions = await QuestionsLoader.loadStageQuestions(
      currentStage,
    );

    if (!mounted) return;

    setState(() {
      questions = stageQuestions;
      currentIndex = 0;
      answered = false;
      selectedAnswer = null;

      if (isNewGame || currentStage == 1) {
        usageTracker.reset(); // ✅ reset all lifeline usage
      }

      lifelineManager = LifelineManager(questions[0], usageTracker);
    });
  }

  void nextQuestion() {
    setState(() {
      currentIndex++;
      answered = false;
      selectedAnswer = null;
      lifelineManager = LifelineManager(questions[currentIndex], usageTracker);
    });
  }

  void _showExitModal() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Exit Modal',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => GameExitModal(
        onContinue: () => Navigator.pop(context),
        onShare: () => Navigator.pop(context),
        onExit: () => Navigator.pop(context),
      ),
      transitionBuilder: (_, animation, __, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(opacity: animation.value, child: child),
        );
      },
    );
  }

  void _showFailedModal() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: 'Failed Modal',
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) => FailedModal(
          onContinue: () {
            Navigator.pop(context);
            setState(() {
              selectedAnswer = null;
              answered = false;
            });
          },
          onGiveup: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ReadyScreen()),
            );
          },
        ),
        transitionBuilder: (_, animation, __, child) {
          return Transform.scale(
            scale: animation.value,
            child: Opacity(opacity: animation.value, child: child),
          );
        },
      );
    });
  }

  void checkAnswer(String selected) {
    if (answered) return;

    setState(() {
      selectedAnswer = selected.trim().toLowerCase();
      answered = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () async {
      if (!mounted) return;

      final correct = questions[currentIndex].correctAnswer;

      if (selectedAnswer == correct) {
        await playSuccessSound();
        await Future.delayed(const Duration(milliseconds: 700));

        if (!mounted) return;

        if (currentIndex < questions.length - 1) {
          nextQuestion();
        } else {
          setState(() {
            currentStage++;
          });
          loadStageQuestions(); // Next stage, but don't reset lifelines
        }
      } else {
        await _bgAudioPlayer.stop();
        await playFailureSound();
        _showFailedModal();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (questions.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final question = questions[currentIndex];

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A01AA), Color(0xFF270152)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _showExitModal,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PriceList()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '\$100 000',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),

              QuestionCard(
                question: question.question,
                questionNumber: '${currentIndex + 1}/15',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LifelineButton(
                    icon: Icons.exposure_minus_2,
                    used: lifelineManager.used['-2']!,
                    onTap: () => setState(() => lifelineManager.useMinus2()),
                  ),
                  LifelineButton(
                    icon: Icons.question_answer_rounded,
                    used: lifelineManager.used['ask']!,
                    onTap: () =>
                        setState(() => lifelineManager.useAskComputer()),
                  ),
                  LifelineButton(
                    icon: Icons.poll_rounded,
                    used: lifelineManager.used['poll']!,
                    onTap: () => setState(() => lifelineManager.usePoll()),
                  ),
                  LifelineButton(
                    icon: Icons.refresh,
                    used: lifelineManager.used['reset']!,
                    onTap: () {
                      setState(() {
                        lifelineManager.useResetQuestion();
                      });
                      loadStageQuestions(); // reload question list
                    },
                  ),
                ],
              ),

              LifelineOverlay(
                pollResults: lifelineManager.pollResults,
                suggestedIndex: lifelineManager.suggestedOptionIndex,
              ),

              const SizedBox(height: 15),

              Column(
                children: List.generate(4, (index) {
                  final label = ['A', 'B', 'C', 'D'][index];
                  final optionText = question.options[index];
                  final isRemoved = lifelineManager.removedOptionIndices
                      .contains(index);
                  return OptionTile(
                    label: label,
                    text: optionText,
                    screenWidth: screenWidth,
                    onTap: () => checkAnswer(optionText),
                    isSelected: selectedAnswer == optionText,
                    isCorrect:
                        optionText.toLowerCase().trim() ==
                        question.correctAnswer,
                    answered: answered,
                    disabled: isRemoved,
                  );
                }),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
