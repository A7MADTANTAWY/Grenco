import 'package:flutter/material.dart';
import 'package:grenco/core/widgets/app_bar/custom_app_bar.dart';
import 'package:grenco/core/widgets/custom_drawer/custom_drawer.dart';

class WorkingHoursPage extends StatelessWidget {
  const WorkingHoursPage({super.key});

  final double hourlyRate = 50.0; // سعر الساعة

  @override
  Widget build(BuildContext context) {
    // عدد الساعات (مؤقت، استبدله بالقيمة الحقيقية)
    double workingHours = 8.0;
    double totalAmount = workingHours * hourlyRate;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: 'Hours',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          // ✅ صورة الوقت
          Center(
            child: Image.asset(
              "assets/time.png",
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff28CF05),
                  Color(0xff1A8902)
                ], // تدرج لوني حديث
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time_filled,
                        color: Colors.white, size: 28),
                    SizedBox(width: 10),
                    Text(
                      "Worked Hours",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "$workingHours Hours",
                  style: const TextStyle(
                    fontSize: 38, // تكبير الخط
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Hourly Rate: \$${hourlyRate.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18, // خط أصغر
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30), // مسافة بسيطة

          // ✅ Card لحساب التكلفة
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money,
                        color: Color(0xff28CF05), size: 28),
                    SizedBox(width: 10),
                    Text(
                      "Total Payment",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "\$${totalAmount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff28CF05),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30), // مسافة بسيطة
        ],
      ),
    );
  }
}
