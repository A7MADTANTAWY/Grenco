import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BuildProgressCard extends StatelessWidget {
  final String title;
  final double value;
  final Color progressColor;
  final VoidCallback onTap; // تم إضافة المعامل الجديد

  const BuildProgressCard({
    super.key,
    required this.title,
    required this.value,
    required this.progressColor,
    required this.onTap, // معامل اختياري
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: CircularPercentIndicator(
                      radius: 30,
                      lineWidth: 8.0,
                      animation: true,
                      percent: value,
                      animationDuration: 1500,
                      center: Text(
                        "${(value * 100).toStringAsFixed(1)}%",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: progressColor,
                      backgroundColor: progressColor.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                minHeight: 7,
                value: value,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
