import 'package:flutter/material.dart';
import 'package:grenco/core/widgets/app_bar/custom_app_bar.dart';
import 'package:grenco/core/widgets/custom_drawer/custom_drawer.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // تغيير الخلفية لتكون مثل الـ AppBar
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: 'Video',
      ),
      body: Center(
        child: Text('Video Page'),
      ),
    );
  }
}
