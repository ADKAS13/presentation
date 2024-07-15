import 'package:bachelors_project/main.dart';
import 'package:bachelors_project/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/python.dart';
// import 'package:flutter_code_editor/flutter_code_editor.dart';

class PageLayout extends StatefulWidget {
  final String nextPage;
  final int questionNumber;
  final Question question;
  final TextEditingController controller;
  // final CodeController question;
  const PageLayout({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.nextPage,
    required this.controller,
    // required this.question
  });

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  String? answer;
  @override
  Widget build(BuildContext context) {
    final question = widget.question;
    final myController = widget.controller;
    final dynamicController = CodeController(
      text: widget.question.questionText,
      language: (widget.questionNumber < 6) ? python : cpp,
      readOnly: true,
    );
    final staticController = CodeController(
      text: widget.question.questionText,
      language: (widget.questionNumber < 6) ? cpp : python,
      readOnly: true,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Question ${widget.questionNumber}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
        const Text(
          'What is the output of the following code? ',
          style: TextStyle(fontSize: 30),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CodeTheme(
            data: CodeThemeData(
              styles: monokaiSublimeTheme,
            ),
            child: CodeField(
              controller:
                  (isDynamic == 1) ? dynamicController : staticController,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: widget.question.isMultipleChoice
                ? Column(
                    children: [
                      RadioListTile<String>(
                          groupValue: answer,
                          title: Text(
                              (question as MultipleChoiceQuestion).optionA),
                          value: "A",
                          onChanged: (String? value) {
                            setState(() {
                              if (value != null) {
                                answer = value;
                              }
                            });
                          }),
                      RadioListTile<String>(
                          groupValue: answer,
                          title: Text((question).optionB),
                          value: "B",
                          onChanged: (String? value) {
                            setState(() {
                              if (value != null) {
                                answer = value;
                              }
                            });
                          }),
                      RadioListTile<String>(
                          groupValue: answer,
                          title: Text((question).optionC),
                          value: "C",
                          onChanged: (String? value) {
                            setState(() {
                              if (value != null) {
                                answer = value;
                              }
                            });
                          }),
                      RadioListTile<String>(
                          groupValue: answer,
                          title: Text((question).optionD),
                          value: "D",
                          onChanged: (String? value) {
                            setState(() {
                              if (value != null) {
                                answer = value;
                              }
                            });
                          }),
                    ],
                  )
                : null
            // TextField(
            //     maxLines: null,
            //     controller: myController,
            //   ),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back")),
            ElevatedButton(
              onPressed: () {
                // if (question is MultipleChoiceQuestion) {
                //   if (answer != null) {
                //     if (answer == question.answer) {
                //       correctlyAnswered.add(widget.questionNumber);
                //     }
                //     myController.text = answer as String;
                //     Navigator.pushNamed(context, widget.nextPage);
                //   }
                //   else {
                //     showDialog(
                //       context: context,
                //       builder: (_) => AlertDialog(
                //         title: const Text("Please provide an answer"),
                //         content: FloatingActionButton(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           child: const Text("Close"),
                //         ),
                //       ),
                //     );
                //   }
                // } else {
                //   if (myController.text == '') {
                //     showDialog(
                //       context: context,
                //       builder: (_) => AlertDialog(
                //         title: const Text("Please provide an answer"),
                //         content: FloatingActionButton(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           child: const Text("Close"),
                //         ),
                //       ),
                //     );
                //   } else {
                //     if (myController.text == question.answer) {
                //       correctlyAnswered.add(widget.questionNumber);
                //     }
                //     Navigator.pushNamed(context, widget.nextPage);
                //   }
                // }
                Navigator.pushNamed(context, widget.nextPage);
              },
              child: widget.nextPage == '/final'
                  ? const Text("Go to submit")
                  : const Text("Next Question"),
            ),
          ],
        )
      ],
    );
  }
}
