import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // يمنع تغيير حجم الواجهة عند ظهور الكيبورد
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/top_left.png", height: 150),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/bottom_right.png", height: 150),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 300, child: Image.asset("assets/grenco.png")),
                  SizedBox(height: 100),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.greenAccent,
                    decoration: InputDecoration(
                      hintText: "Your email",
                      filled: true,
                      fillColor:
                          Color(0xffE8F5E9), // خلفية خضراء فاتحة لحقل الإدخال
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.person),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      hintText: "Your password",
                      filled: true,
                      fillColor:
                          Color(0xffE8F5E9), // خلفية خضراء فاتحة لحقل الإدخال
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.lock),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      context.go("/home");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff28CF05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(320, 50),
                    ),
                    child: Text(
                      "Login".toUpperCase(),
                      style: TextStyle(
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
    );
  }
}
