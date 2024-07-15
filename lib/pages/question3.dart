import 'package:bachelors_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/java.dart';

import '../pagelayout.dart';

final controller = CodeController(
  text: '...',
  language: java,
);

class Question3 extends StatelessWidget {
  const Question3({super.key});

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      setQuestions();
    }
    // final int rng = Random().nextInt(staticQuestions.length);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              PageLayout(
                controller: controllers[2],
                question: questions[2],
                questionNumber: 3,
                nextPage: '/4',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
