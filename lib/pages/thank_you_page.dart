import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Center(
              child: Text("Thank you for your participation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
            ),
          ),
        ],
      ),
    );
  }
}
