import 'package:bachelors_project/main.dart';
import 'package:flutter/material.dart';

import '../pagelayout.dart';

class Question6 extends StatelessWidget {
  const Question6({super.key});

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      setQuestions();
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              PageLayout(
                controller: controllers[5],
                question: questions[5],
                questionNumber: 6,
                nextPage: '/7',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
