import 'package:flutter/material.dart';
import 'package:grenco/core/widgets/app_bar/custom_app_bar.dart';
import 'package:grenco/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:grenco/screens/admin_interface/productivity_page/widgets/productivity.dart';
import 'package:grenco/screens/admin_interface/productivity_page/widgets/productivity_card.dart';

class ProductivityPage extends StatelessWidget {
  const ProductivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: 'Productivity',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // 📌 Container جديد يجمع Productivity Chart + Productivity Overview
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Productivity Title
                  const Text(
                    "Productivity",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff28CF05),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Line Chart
                  const LineChartSample2(),
                  const SizedBox(height: 50),

                  // Productivity Overview Title
                  const Text(
                    "Productivity Overview",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff28CF05),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Productivity Overview Cards
                  ProductivityCard(title: "Last Day", percentage: "85%"),
                  ProductivityCard(title: "Last Week", percentage: "76%"),
                  ProductivityCard(title: "Last Month", percentage: "45%"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
