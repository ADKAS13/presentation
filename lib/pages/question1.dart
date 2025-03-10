import 'package:bachelors_project/main.dart';
import 'package:flutter/material.dart';

import '../pagelayout.dart';

class Question1 extends StatelessWidget {
  const Question1({super.key});

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
                controller: controllers[0],
                question: questions[0],
                questionNumber: 1,
                nextPage: '/2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Question1 extends StatelessWidget {
//   const Question1({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return S
//   }
// }
