import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grenco/screens/home_page/widgets/buildProgressCard.dart';
import 'package:grenco/screens/home_page/widgets/buildUserInfoCard.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  int currentIndex = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Color(0xff28CF05),
        unselectedItemColor: Colors.grey,
        currentIndex: widget.currentIndex,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "Grenco",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff28CF05),
            ),
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
            // Welcome(),
            const SizedBox(height: 10),
            Builduserinfocard(),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Speed',
              value: 0.8,
              progressColor: Color(0xff28CF05),
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Temperature',
              value: 0.2,
              progressColor: Colors.red,
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'humidity',
              value: 0.7,
              progressColor: Colors.blue,
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'wight',
              value: 0.4,
              progressColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
