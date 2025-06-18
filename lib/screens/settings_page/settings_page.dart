import 'package:flutter/material.dart';
import 'package:grenco/core/models/user_model.dart';
import 'package:grenco/core/widgets/app_bar/custom_app_bar.dart';
import 'package:grenco/core/widgets/custom_drawer/custom_drawer.dart';

class SettingsPage extends StatefulWidget {
  final UserModel user;

  const SettingsPage({super.key, required this.user});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'ar'; // 'ar' or 'en'

  Widget buildLanguageTile({required String label, required String value}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
          color: colorScheme.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            Checkbox(
              activeColor: theme.primaryColor,
              value: selectedLanguage == value,
              onChanged: (_) {
                setState(() {
                  selectedLanguage = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingBox({required Widget child}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.surface,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      drawer: CustomDrawer(user: widget.user),
      appBar: const CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildLanguageTile(label: 'العربية', value: 'ar'),
            buildLanguageTile(label: 'English', value: 'en'),
            const SizedBox(height: 30),
            Text(
              'DarkMode',
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildSettingBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الوضع الليلي', style: textTheme.bodyMedium),
                  Switch(
                    thumbColor:
                        MaterialStateProperty.all<Color>(theme.primaryColor),
                    activeColor: theme.colorScheme.primary,
                    value: isDarkMode,
                    onChanged: (val) {
                      setState(() {
                        isDarkMode = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '⚠️ المميزات دي تجريبية ومحتاجة تتربط بـ Provider أو SharedPreferences.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
