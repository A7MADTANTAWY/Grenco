import 'package:firebase_core/firebase_core.dart';
import 'package:grenco/core/logic/app_theming.dart';

import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:grenco/core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Gerenco());
}

class Gerenco extends StatelessWidget {
  const Gerenco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appThemeData[0],
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
