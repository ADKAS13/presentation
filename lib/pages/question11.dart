import 'package:bachelors_project/main.dart';
import 'package:flutter/material.dart';

import '../pagelayout.dart';

class Question11 extends StatelessWidget {
  const Question11({super.key});

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
                controller: controllers[10],
                question: questions[10],
                questionNumber: 11,
                nextPage: '/final',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
