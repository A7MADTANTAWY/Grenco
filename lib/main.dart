import 'package:flutter/material.dart';
import 'package:grenco/core/router/router.dart';

void main() {
  runApp(const Gerenco());
}

class Gerenco extends StatelessWidget {
  const Gerenco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
