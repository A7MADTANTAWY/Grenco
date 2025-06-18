import 'package:flutter/material.dart';
import 'package:grenco/core/widgets/logo/logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.primaryColor;

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(
        color: colorScheme,
        size: 30,
      ),
      toolbarHeight: 70,
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme,
            fontSize: 28,
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
