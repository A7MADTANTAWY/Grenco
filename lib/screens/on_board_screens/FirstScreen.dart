import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/own.png'),
        Text(
          "How to use The\nApplication",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              color: Color(0xff28CF05),
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            "Listening to music is very comfertable without any annoying adds",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 19, 54, 33),
              // fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}

// "No ads while \nlistening music"
// "Listening to music is very comfertable without any annoying adds"
