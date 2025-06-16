import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grenco/core/widgets/custom_drawer/elements/custom_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff1E5625), Color(0xff28CF05)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/Grenco logo.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahmed Tantawy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Hello, Ahmed!",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              CustomTile(
                icon: Icons.person_rounded,
                title: "Profile",
                onPressed: () {
                  context.go('/profile');
                },
                color: Colors.black,
              ),
              CustomTile(
                icon: Icons.home_rounded,
                title: "Home",
                onPressed: () {
                  context.go('/home');
                },
                color: Colors.black,
              ),
              CustomTile(
                icon: Icons.video_collection_rounded,
                title: "Video",
                onPressed: () {
                  context.go('/video');
                },
                color: Colors.black,
              ),
              CustomTile(
                icon: Icons.av_timer_sharp,
                title: "productivity",
                onPressed: () {
                  context.go('/productivity');
                },
                color: Colors.black,
              ),
              CustomTile(
                icon: Icons.attach_money,
                title: "Working Hours",
                onPressed: () {
                  context.go('/workHours');
                },
                color: Colors.black,
              ),
              CustomTile(
                icon: Icons.verified_user_sharp,
                title: "Add User",
                onPressed: () {
                  context.go('/users');
                },
                color: Colors.black,
              ),
              CustomTile(
                icon: Icons.settings_rounded,
                title: "Settings",
                onPressed: () {
                  context.go('/settings');
                },
                color: Colors.black,
              ),
              const Spacer(),
              CustomTile(
                icon: Icons.logout,
                title: "Log Out",
                onPressed: () {
                  context.go('/login');
                },
                color: Colors.red,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
