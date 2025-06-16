import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/own.png'),
        Text(
          "How to use The\nApplication",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            "Listening to music is very comfortable without any annoying ads",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: theme.textTheme.bodyMedium?.color, // ← ياخد من الثيم
            ),
          ),
        ),
      ],
    );
  }
}
