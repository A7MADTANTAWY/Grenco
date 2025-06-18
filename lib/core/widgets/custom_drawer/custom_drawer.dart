import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grenco/core/models/user_model.dart';
import 'package:grenco/core/widgets/custom_drawer/elements/custom_tile.dart';

class CustomDrawer extends StatelessWidget {
  final UserModel user;
  const CustomDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              color: theme.colorScheme.background.withOpacity(0.9),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1E5625),
                      theme.primaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
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
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Welcome To Grenco",
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
              const SizedBox(height: 15),
              CustomTile(
                icon: Icons.person_rounded,
                title: "Profile",
                onPressed: () => context.go('/profile', extra: user),
                color: colorScheme.onSurface,
              ),
              CustomTile(
                icon: Icons.home_rounded,
                title: "Home",
                onPressed: () => context.go('/home', extra: user),
                color: colorScheme.onSurface,
              ),
              if (user.role == "admin")
                CustomTile(
                  icon: Icons.video_collection_rounded,
                  title: "Video",
                  onPressed: () => context.go('/video', extra: user),
                  color: colorScheme.onSurface,
                ),
              if (user.role == "admin")
                CustomTile(
                  icon: Icons.av_timer_sharp,
                  title: "Productivity",
                  onPressed: () => context.go('/productivity', extra: user),
                  color: colorScheme.onSurface,
                ),
              if (user.role == "admin")
                CustomTile(
                  icon: Icons.attach_money,
                  title: "Working Hours",
                  onPressed: () => context.go('/workHours', extra: user),
                  color: colorScheme.onSurface,
                ),
              if (user.role == "admin")
                CustomTile(
                  icon: Icons.verified_user_sharp,
                  title: "Add User",
                  onPressed: () => context.go('/users', extra: user),
                  color: colorScheme.onSurface,
                ),
              CustomTile(
                icon: Icons.settings_rounded,
                title: "Settings",
                onPressed: () => context.go('/settings', extra: user),
                color: colorScheme.onSurface,
              ),
              const Spacer(),
              CustomTile(
                icon: Icons.logout,
                title: "Log Out",
                onPressed: () => context.go('/login'),
                color: colorScheme.error,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
