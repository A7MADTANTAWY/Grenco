import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  final Color color;

  const CustomTile({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context);
        onPressed(); // ✅ استدعاء الـ onPressed عند الضغط
      },
    );
  }
}
