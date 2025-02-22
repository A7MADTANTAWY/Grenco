import 'package:go_router/go_router.dart';
import 'package:grenco/screens/detals_screen/Details_screen.dart';
import 'package:grenco/screens/home_page/home_page.dart';
import 'package:grenco/screens/login_page/login_page.dart';
import 'package:grenco/screens/on_board_screens/on_board_screen.dart';

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
      path: '/Login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => DetailsScreen(),
    ),
  ],
);
