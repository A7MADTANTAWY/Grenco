import 'package:flutter/material.dart';
import 'package:grenco/core/widgets/logo/logo.dart';
import 'package:grenco/screens/user_interface/detals_screen/widgets/circular_percentage.dart';
import 'package:grenco/screens/user_interface/detals_screen/widgets/details_info.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  String degree;
  String title;
  Color color;

  DetailsScreen({
    super.key,
    required this.degree,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          title,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: const [
          Logo(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            CircularPercentage(
              degree: degree,
              title: title,
              color:
                  color, // دا لو جاي من خارج التيم خليه كده، أو غيّره لو محتاج
            ),
            DetailsInfo(title: title),
            const SizedBox(height: 10),
            DetailsInfo(title: title),
            const SizedBox(height: 10),
            DetailsInfo(title: title),
          ],
        ),
      ),
    );
  }
}
