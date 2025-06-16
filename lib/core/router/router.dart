import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grenco/screens/admin_interface/Number%20of%20working%20hours_page/working_hours_page.dart';
import 'package:grenco/screens/admin_interface/add_user_page/add_user_page.dart';
import 'package:grenco/screens/admin_interface/productivity_page/productivity_page.dart';
import 'package:grenco/screens/user_interface/detals_screen/Details_screen.dart';
import 'package:grenco/screens/user_interface/home_page/home_page.dart';
import 'package:grenco/screens/login_page/login_page.dart';
import 'package:grenco/screens/on_board_screens/on_board_screen.dart';
import 'package:grenco/screens/profile_page/profile_page.dart';
import 'package:grenco/screens/settings_page/settings_page.dart';
import 'package:grenco/screens/user_interface/video_page/video_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: '/Login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/details/:degree/:title/:color',
      builder: (context, state) {
        String degree =
            state.pathParameters["degree"] ?? "0"; // لا تحويل لـ int

        // فحص إذا كانت قيمة اللون بصيغة HEX
        String? colorString = state.pathParameters["color"];
        Color color;
        if (colorString != null && colorString.startsWith("0x")) {
          color = Color(int.parse(colorString));
        } else {
          // استخدام الألوان النصية
          Map<String, Color> colorMap = {
            "red": Colors.red,
            "green": Colors.green,
            "blue": Colors.blue,
            "yellow": Colors.yellow,
            "orange": Colors.orange,
          };
          color = colorMap[colorString] ?? Colors.black; // لون افتراضي
        }

        return DetailsScreen(
          degree: degree, // بقاء `degree` كـ String
          color: color,
          title: state.pathParameters["title"]!,
        );
      },
    ),
    GoRoute(
      path: '/video',
      builder: (context, state) => VideoPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsPage(),
    ),
    GoRoute(
      path: '/productivity',
      builder: (context, state) => ProductivityPage(),
    ),
    GoRoute(
      path: '/workHours',
      builder: (context, state) => WorkingHoursPage(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => AddUserPage(),
    ),
  ],
);
