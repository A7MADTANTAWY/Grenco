import 'package:flutter/material.dart';
import 'package:grenco/core/models/user_model.dart';
import 'package:grenco/core/widgets/app_bar/custom_app_bar.dart';
import 'package:grenco/core/widgets/custom_drawer/custom_drawer.dart';

class VideoPage extends StatelessWidget {
  final UserModel user;
  const VideoPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // تغيير الخلفية لتكون مثل الـ AppBar
      drawer: CustomDrawer(
        user: user,
      ),
      appBar: CustomAppBar(
        title: 'Video',
      ),
      body: Center(
        child: Text('Video Page'),
      ),
    );
  }
}
