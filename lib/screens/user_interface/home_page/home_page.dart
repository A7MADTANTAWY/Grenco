import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grenco/core/models/user_model.dart';
import 'package:grenco/core/widgets/app_bar/custom_app_bar.dart';
import 'package:grenco/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:grenco/screens/user_interface/home_page/widgets/buildProgressCard.dart';
import 'package:grenco/screens/user_interface/home_page/widgets/buildUserInfoCard.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        user: user,
      ),
      appBar: const CustomAppBar(title: 'Home'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Builduserinfocard(user: user),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Temperature sensor 1',
              value: 0.2,
              progressColor: Colors.red,
              onTap: () {
                context.push('/details/0.20/Temperature/red');
              },
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Temperature sensor 2',
              value: 0.4,
              progressColor: Colors.orange,
              onTap: () {
                context.push('/details/0.4/Temperature/orange');
              },
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Temperature sensor 3',
              value: 0.5,
              progressColor: Colors.blue,
              onTap: () {
                context.push('/details/0.5/Temperature/blue');
              },
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Temperature sensor 4',
              value: 0.1,
              progressColor: Colors.red,
              onTap: () {
                context.push('/details/0.1/Temperature/red');
              },
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Motor speed',
              value: 0.8,
              progressColor: const Color(0xff28CF05),
              onTap: () {
                context.push('/details/0.80/Speed/0xff28CF05');
              },
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Humidity',
              value: 0.7,
              progressColor: Colors.blue,
              onTap: () {
                context.push('/details/0.70/Humidity/blue');
              },
            ),
            const SizedBox(height: 10),
            BuildProgressCard(
              title: 'Weight',
              value: 0.4,
              progressColor: Colors.orange,
              onTap: () {
                context.push('/details/0.40/Weight/orange');
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
