import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_joy/controllers/quize_getx_controller.dart';

class AnswerWidget extends StatelessWidget {
  final int countLength;
  const AnswerWidget({
    super.key,
    required this.countLength,
  });

  @override
  Widget build(BuildContext context) {
    final QuizeGetxController getxcontroller = Get.find();

    return SizedBox(
      width: 350,
      child: Center(
        child: Obx(
          () {
            return Wrap(
              direction: Axis.horizontal,
              spacing: 11.0,
              runSpacing: 10,
              children: List.generate(
                countLength,
                (index) {
                  return Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                      color: const Color.fromARGB(91, 33, 149, 243),
                    ),
                    child: Center(
                      child: Text(
                        index < getxcontroller.tappedNum.length
                            ? getxcontroller.tappedNum[index]
                            : "*",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
