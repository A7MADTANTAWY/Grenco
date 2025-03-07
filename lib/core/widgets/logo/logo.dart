import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Color(0xff28CF05).withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Image.asset("assets/Grenco_logo-removebg-preview.png"),
      ),
    );
  }
}
