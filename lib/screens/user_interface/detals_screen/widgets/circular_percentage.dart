import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class CircularPercentage extends StatelessWidget {
  String degree;
  String title;
  Color color;

  CircularPercentage(
      {super.key,
      required this.degree,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 150,
      lineWidth: 15,
      animation: true,
      arcType: ArcType.HALF,
      percent: double.parse(degree),
      arcBackgroundColor: Colors.grey.withOpacity(0.3),
      startAngle: 270,
      animationDuration: 1500,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: color,
      center: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            degree,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
