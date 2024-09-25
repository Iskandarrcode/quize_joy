import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_joy/controllers/quize_getx_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class KeybordWidget extends StatelessWidget {
  final int answerLength;
  final String textKeybord;
  const KeybordWidget({
    super.key,
    required this.textKeybord,
    required this.answerLength,
  });

  List<int> generateUniqueNum() {
    final random = Random();
    final numbers = List.generate(answerLength, (index) => index);
    numbers.shuffle(random);

    return numbers.take(answerLength).toList();
  }

  @override
  Widget build(BuildContext context) {
    final QuizeGetxController getxcontroller = Get.find();
    List counts = generateUniqueNum();

    return SizedBox(
      width: 350,
      child: Center(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 11.0,
          runSpacing: 10,
          children: List.generate(
            answerLength,
            (index) {
              return ZoomTapAnimation(
                onTap: () {
                  getxcontroller.addTappedLetter(textKeybord[counts[index]]);
                },
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 3,
                    ),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      textKeybord[counts[index]],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
