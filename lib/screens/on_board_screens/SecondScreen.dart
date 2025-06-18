import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // للوصول لألوان الثيم

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/two.png"),
        Text(
          "What Application\nCan Do",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor, // استخدام لون الثيم الأساسي
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            "Download the music you want and enjoy it whatever and whenever",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: theme.textTheme.bodyMedium!.color, // لون النص من الثيم
            ),
          ),
        ),
      ],
    );
  }
}
