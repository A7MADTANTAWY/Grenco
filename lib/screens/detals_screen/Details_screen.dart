import 'package:flutter/material.dart';
import 'package:grenco/screens/detals_screen/widgets/details_info.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
            icon: const Icon(Icons.arrow_back,
                size: 30, color: Color(0xff28CF05)), // تعديل اللون والحجم
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          "Speed",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff28CF05),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Color(0xff28CF05).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.school,
                color: Color(0xff28CF05),
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DetailsInfo(
              title: "Speed",
              number: 50,
              days: "Speeeeeeeeeeeeeed",
              progress: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
