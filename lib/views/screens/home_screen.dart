import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_joy/controllers/quize_getx_controller.dart';
import 'package:quize_joy/views/screens/add_quize_screen.dart';
import 'package:quize_joy/views/widgets/keybord_widget.dart';
import 'package:quize_joy/views/widgets/question_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final QuizeGetxController getxcontroller = Get.put(QuizeGetxController());
  final questionController = TextEditingController();
  final answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final quizes = getxcontroller.quizes;
        final index = getxcontroller.index.value;

        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/back2.jpeg",
                fit: BoxFit.fill,
              ),
            ),
            quizes.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Image.asset(
                          "assets/icons/smile.gif",
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 50),
                        const Text(
                          "There are no questions...",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Image.asset(
                          "assets/icons/smile.gif",
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            quizes[index].question,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        AnswerWidget(
                          countLength: quizes[index].answer.length,
                        ),
                        const SizedBox(height: 100),
                        SingleChildScrollView(
                          child: KeybordWidget(
                            textKeybord: quizes[index].answer,
                            answerLength: quizes[index].answer.length,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: "heroTag",
        child: ZoomTapAnimation(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return QuizeManagment();
                },
              ),
            );
          },
          child: Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue,
            ),
            child: const Center(
              child: Text(
                "Menagment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(247, 1, 21, 38),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
