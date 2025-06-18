import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active
            ? theme.primaryColor
            : theme.colorScheme.onSurface.withOpacity(0.4),
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}
