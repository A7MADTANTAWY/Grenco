import 'package:flutter/material.dart';
import 'package:grenco/core/widgets/app_bar/custom_app_bar.dart';
import 'package:grenco/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:grenco/screens/admin_interface/add_user_page/widgets/input_decoration.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: 'User',
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 300,
              child: Image.asset("assets/add user.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.greenAccent,
                      decoration: CustomInputDecoration.inputDecoration(
                          "Full Name", Icons.person),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.greenAccent,
                      decoration: CustomInputDecoration.inputDecoration(
                          "Email", Icons.email),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.green,
                      decoration: CustomInputDecoration.inputDecoration(
                          "Password", Icons.lock),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        // تنفيذ إضافة المستخدم هنا
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff28CF05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: const Size(320, 50),
                      ),
                      child: Text(
                        "Add User".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
