import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_joy/controllers/firebase_quize_controller.dart';
import 'package:quize_joy/controllers/quize_getx_controller.dart';

class QuizeManagment extends StatelessWidget {
  QuizeManagment({super.key});

  final QuizeGetxController quizeController = Get.put(QuizeGetxController());
  final FirebaseQuizeController firebaseQuizeController =
      FirebaseQuizeController();
  final questionController = TextEditingController();
  final answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "tagHero",
        child: Stack(
          children: [
            // Orqa fon rasm
            Positioned.fill(
              child: Image.asset(
                "assets/images/back4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 50),
                Expanded(
                  child: Obx(
                    () {
                      final quizes = quizeController.quizes;
        
                      if (quizes.isEmpty) {
                        return const Center(
                            child: Text(
                          "Add a question !",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ));
                      }
                      if (quizes.isNotEmpty) {
                        return ListView.builder(
                          itemCount: quizes.length,
                          itemBuilder: (context, index) {
                            final quize = quizes[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 5,
                                bottom: 5,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color.fromARGB(177, 2, 28, 132),
                                ),
                                child: ListTile(
                                  title: Text(
                                    quize.question,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text(
                                    quize.answer,
                                    style: const TextStyle(
                                      color: Color.fromARGB(214, 158, 158, 158),
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      quizeController
                                          .deleteQuize(quize.id.toString());
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
        
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.defaultDialog(
            backgroundColor: const Color.fromARGB(159, 8, 31, 180),
            title: "Add Quize",
            titleStyle:
                const TextStyle(color: Color.fromARGB(255, 180, 178, 178)),
            content: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: questionController,
                    decoration: InputDecoration(
                      labelText: "Question",
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: answerController,
                    decoration: InputDecoration(
                      labelText: "Answer",
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.grey),

                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      if (questionController.text.isNotEmpty &&
                          answerController.text.isNotEmpty) {
                        quizeController.addQuize(
                          questionController.text.toUpperCase(),
                          answerController.text
                              .replaceAll(" ", "")
                              .toUpperCase(),
                        );
                        questionController.clear();
                        answerController.clear();
                        Get.back();
                      } else {
                        Get.snackbar(
                          'Error',
                          'Please fill in both fields',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: const Text(
                      "Add Quize",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
