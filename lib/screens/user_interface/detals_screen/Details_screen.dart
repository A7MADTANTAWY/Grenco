import 'package:flutter/material.dart';
import 'package:grenco/core/widgets/logo/logo.dart';
import 'package:grenco/screens/user_interface/detals_screen/widgets/circular_percentage.dart';
import 'package:grenco/screens/user_interface/detals_screen/widgets/details_info.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  String degree;
  String title;
  Color color;

  DetailsScreen(
      {super.key,
      required this.degree,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Color(0xff28CF05),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff28CF05),
          ),
        ),
        actions: [
          Logo(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            CircularPercentage(
              degree: degree,
              title: title,
              color: color,
            ),
            DetailsInfo(
              title: title,
            ),
            SizedBox(
              height: 10,
            ),
            DetailsInfo(
              title: title,
            ),
            SizedBox(
              height: 10,
            ),
            DetailsInfo(
              title: title,
            ),
          ],
        ),
      ),
    );
  }
}
