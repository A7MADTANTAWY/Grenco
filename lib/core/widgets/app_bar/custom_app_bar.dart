import 'package:flutter/material.dart';
import 'package:grenco/core/widgets/logo/logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(
        color: Color(0xff28CF05),
        size: 30,
      ),
      toolbarHeight: 70,
      backgroundColor: const Color(0xFFF5F5F5),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff28CF05),
          ),
        ),
      ),
      actions: const [
        Logo(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
