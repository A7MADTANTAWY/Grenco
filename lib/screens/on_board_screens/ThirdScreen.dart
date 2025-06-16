import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // استخدام ألوان الثيم

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/three.png"),
        Text(
          "Share \nThe Application",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary, // لون من الثيم
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            "Share the playlist you created and share it with friends and family",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: theme.textTheme.bodyMedium!.color, // نص من الثيم
            ),
          ),
        ),
      ],
    );
  }
}
