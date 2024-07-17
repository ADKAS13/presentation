import 'package:bachelors_project/main.dart';
import 'package:flutter/material.dart';

import '../pagelayout.dart';

class Question12 extends StatelessWidget {
  const Question12({super.key});

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
                controller: controllers[11],
                question: questions[11],
                questionNumber: 12,
                nextPage: '/final',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
