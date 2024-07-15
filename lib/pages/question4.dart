import 'package:bachelors_project/main.dart';
import 'package:flutter/material.dart';

import '../pagelayout.dart';

class Question4 extends StatelessWidget {
  const Question4({super.key});

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
                controller: controllers[3],
                question: questions[3],
                questionNumber: 4,
                nextPage: '/5',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
