import 'package:bachelors_project/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(0),
            child: Text("This is the end of the quiz",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
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
                    final answer = <String, dynamic>{};
                    answer["Correctly answered"] = correctlyAnswered;
                    for (int i = 1; i <= controllers.length; i++) {
                      answer["Questions $i"] = questions[i - 1].questionText;
                      answer["Answer $i"] = controllers[i - 1].text;
                      answer["isDynamic"] = isDynamic;
                    }
                    db.collection("Second Session").add(answer).then(
                        (DocumentReference doc) =>
                            print('DocumentSnapshot added with ID: ${doc.id}'));

                    Navigator.pushNamed(context, '/thankyou');
                  },
                  child: const Text("Submit")),
            ],
          )
        ],
      ),
    );
  }
}
