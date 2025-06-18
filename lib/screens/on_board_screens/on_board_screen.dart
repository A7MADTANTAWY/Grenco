import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grenco/screens/on_board_screens/SecondScreen.dart';
import 'package:grenco/screens/on_board_screens/ThirdScreen.dart';
import 'package:grenco/screens/on_board_screens/widgets/CustomIndicator.dart';
import 'package:grenco/screens/on_board_screens/FirstScreen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _controller = PageController();
  int index = 0;

  void _navigateToMainScreen() {
    context.go('/Login');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                children: const [FirstScreen(), SecondScreen(), ThirdScreen()],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomIndicator(active: index == i),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ✅ زر Skip يظهر بس لما يكون في الصفحات الأولى
                  AnimatedOpacity(
                    opacity: index <= 1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: index <= 1
                        ? TextButton(
                            onPressed: _navigateToMainScreen,
                            style: TextButton.styleFrom(
                              foregroundColor: theme.colorScheme.onBackground,
                            ),
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),

                  // ✅ زر Next / Login
                  ElevatedButton(
                    onPressed: () {
                      if (index == 2) {
                        _navigateToMainScreen();
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      minimumSize: const Size(100, 50),
                    ),
                    child: Text(
                      index == 2 ? "Login" : "Next",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
