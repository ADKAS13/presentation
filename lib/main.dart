// import 'dart:io';
import 'dart:html' as webFile;
import 'package:bachelors_project/pages/question10.dart';
import 'package:bachelors_project/pages/question11.dart';
import 'package:bachelors_project/pages/question12.dart';
import 'package:bachelors_project/pages/question8.dart';
import 'package:bachelors_project/pages/question9.dart';
import 'package:file_picker/file_picker.dart' as webPicker;
import 'dart:math';

import 'package:bachelors_project/firebase_options.dart';
import 'package:bachelors_project/questions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import './pages/pages.dart';

// var ID = Random().nextInt(2147483647);
List<TextEditingController> controllers = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

final questions = <Question>[];
double isDynamic = 1;
final correctlyAnswered = <int>[];

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}

void setQuestions() {
  // questions.clear();
  // var numQuestions = 7;
  // Question newQuestion;
  // if (isDynamic == 1) {
  //   var i = 0;
  //   while (i < numQuestions) {
  //     if (i < numQuestions * 0.7) {
  //       newQuestion = dynamicQuestions
  //           .elementAt(Random().nextInt(dynamicQuestions.length));
  //       if (!questions.contains(newQuestion)) {
  //         questions.add(newQuestion);
  //         i++;
  //       }
  //     } else {
  //       newQuestion =
  //           staticQuestions.elementAt(Random().nextInt(staticQuestions.length));
  //       if (!questions.contains(newQuestion)) {
  //         questions.add(newQuestion);
  //         i++;
  //       }
  //     }
  //   }
  // } else {
  //   var i = 0;
  //   while (i < numQuestions) {
  //     if (i < numQuestions * 0.7) {
  //       newQuestion =
  //           staticQuestions.elementAt(Random().nextInt(staticQuestions.length));
  //       if (!questions.contains(newQuestion)) {
  //         questions.add(newQuestion);
  //         i++;
  //       }
  //     } else {
  //       newQuestion = dynamicQuestions
  //           .elementAt(Random().nextInt(dynamicQuestions.length));
  //       if (!questions.contains(newQuestion)) {
  //         questions.add(newQuestion);
  //         i++;
  //       }
  //     }
  //   }
  // }
  questions.clear();
  for (var i = 0; i < dynamicQuestions.length; i++) {
    questions.add(dynamicQuestions.elementAt(i));
  }

  for (var i = 0; i < staticQuestions.length; i++) {
    questions.add(staticQuestions.elementAt(i));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: './',
      title: "Bachelor's Project Quiz Questions",
      routes: {
        '/': (context) => const MainPage(),
        '/1': (context) => const Question1(),
        '/2': (context) => const Question2(),
        '/3': (context) => const Question3(),
        '/4': (context) => const Question4(),
        '/5': (context) => const Question5(),
        '/6': (context) => const Question6(),
        '/7': (context) => const Question7(),
        '/8': (context) => const Question8(),
        '/9': (context) => const Question9(),
        '/10': (context) => const Question10(),
        '/11': (context) => const Question11(),
        '/12': (context) => const Question12(),
        '/final': (context) => const FinalPage(),
        '/thankyou': (context) => const ThankYouPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

// Future<String> get _localPath async {
//   final directory = await getApplicationDocumentsDirectory();

//   return directory.path;
// }

// Future<File> get _localFile async {
//   final path = await _localPath;
//   return File('$path/file.txt');
// }

// Future<File> writeCounter(String counter) async {
//   final file = await _localFile;

//   // Write the file
//   return file.writeAsString('$counter');
// }

class _MainPageState extends State<MainPage> {
  String? typeExperience;
  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;
    double textMultiplier = (aspectRatio > 1) ? 11 : 5;
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Coding Quiz Natural\nLanguage",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: textMultiplier * unitHeightValue,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "More C experience: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Radio<String>(
                      value: 'C',
                      // title: const Text("More C Experience"),
                      groupValue: typeExperience,
                      onChanged: (String? value) {
                        setState(() {
                          if (value != null) {
                            typeExperience = value;
                            isDynamic = 1;
                          }
                        });
                      }),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "More Python Experience: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Radio<String>(
                      value: 'Python',
                      // title: const Text("More Python Experience"),
                      groupValue: typeExperience,
                      onChanged: (String? value) {
                        setState(() {
                          if (value != null) {
                            typeExperience = value;
                            isDynamic = 0;
                          }
                        });
                      })
                ],
              ),
            ),
            ButtonTheme(
              minWidth: 200,
              height: 100,
              child: SizedBox(
                child: ElevatedButton(
                    child: const Text("Start Quiz"),
                    onPressed: () async {
                      // if (isDynamic != -1) {
                      setQuestions();
                      Navigator.pushNamed(context, '/1');
                      // final db = FirebaseFirestore.instance;
                      // // print(db.collection("answers").get());

                      // await db.collection("answers").get().then(
                      //   (querySnapshot) async {
                      //     print("Successfully completed");
                      //     for (var docSnapshot in querySnapshot.docs) {
                      //       var result = docSnapshot.data();
                      //       // '${docSnapshot.id} => ${docSnapshot.data()}';
                      //       print(result);
                      //       var blob = webFile.Blob([result], 'json', 'native');

                      //       webFile.AnchorElement(
                      //         href: webFile.Url.createObjectUrlFromBlob(blob)
                      //             .toString(),
                      //       )
                      //         ..setAttribute("download", "results.txt")
                      //         ..click();
                      //     }
                      //   },
                      //   onError: (e) => print("Error completing: $e"),
                      // );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
