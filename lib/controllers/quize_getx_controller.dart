import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quize_joy/controllers/firebase_quize_controller.dart';
import 'package:quize_joy/models/quize_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class QuizeGetxController extends GetxController {
  final FirebaseQuizeController _firebaseController = FirebaseQuizeController();

  RxList<QuizeModel> quizes = <QuizeModel>[].obs;
  RxList<String> tappedNum = <String>[].obs;
  RxInt index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuizes();
  }

  void fetchQuizes() {
    _firebaseController.getQuize().listen((quizesList) {
      quizes.assignAll(quizesList);
    });
  }

  Future<void> addQuize(String question, String answer) async {
    QuizeModel newQuize = QuizeModel(question: question, answer: answer);
    await _firebaseController.addQuize(newQuize);
    fetchQuizes();
  }

  Future<void> deleteQuize(String id) async {
    await _firebaseController.deleteQuize(id);
  }

  void addTappedLetter(String letter) {
    if (tappedNum.length < quizes[index.value].answer.length) {
      tappedNum.add(letter);
      if (tappedNum.length == quizes[index.value].answer.length) {
        _checkAnswer();
      }
    }
  }

  void _checkAnswer() {
    final currentQuiz = quizes[index.value];
    final correctAnswer = currentQuiz.answer;
    final tappedAnswer = tappedNum.join();

    if (tappedAnswer == correctAnswer) {
      // Lottie animatsiyasini ko'rsatish
      _showLottieAnimation();
    } else {
      _showWrongAnswerDialog();
    }
  }

  void _showLottieAnimation() {
    // Ekran ustida Lottie animatsiyasini ko'rsatish
    Get.dialog(
      barrierDismissible: false,
      Center(
        child: Lottie.asset(
          'assets/lotties/congrats.json',
          onLoaded: (composition) {
            Future.delayed(
              Duration(milliseconds: composition.duration.inMilliseconds),
              () {
                // Lottie animatsiyasi tugagach
                tappedNum.clear(); // TappedNum ni tozalash
                if (index.value < quizes.length - 1) {
                  index.value++; // Keyingi savolga o'tish
                } else {
                  // Savollar tugadi, o'yinni tugatamiz
                  Get.back(); // Lottie dialogni yopish
                  _showGameCompletionDialog(); // O'yin tugadi dialogini ko'rsatish
                  return; // Ushbu joyda qaytish
                }
                Get.back(); // Lottie dialogni yopish
              },
            );
          },
        ),
      ),
    );
  }

  void _showGameCompletionDialog() {
    Get.dialog(
      barrierDismissible: false,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/lotties/prize.json',
              onLoaded: (composition) {},
            ),
          ),
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ZoomTapAnimation(
                onTap: () {
                  _startNewGame();
                  Get.back(); // O'yin yangilanishi uchun eski dialogni yopish
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 240, 210, 12),
                  ),
                  child: const Center(
                    child: Icon(Icons.restart_alt, size: 30),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 240, 210, 12),
                  ),
                  child: const Center(
                    child: Icon(Icons.clear, size: 30),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _startNewGame() {
    index.value = 0; // Indeksni 0 ga qaytarish
    tappedNum.clear(); // TappedNum ni tozalash
    fetchQuizes(); // Yangi savollarni yuklash
  }

  void _showWrongAnswerDialog() {
    Get.dialog(
      barrierDismissible: false,
      Center(
        child: Lottie.asset(
          'assets/lotties/error.json',
          onLoaded: (composition) {
            Future.delayed(
              Duration(milliseconds: composition.duration.inMilliseconds),
              () {
                tappedNum.clear(); // TappedNum ni tozalash
                Get.back(); // Dialogni yopish
              },
            );
          },
        ),
      ),
    );
  }
}
