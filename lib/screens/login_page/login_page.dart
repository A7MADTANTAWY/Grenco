import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grenco/core/Auth/auth.dart';
import 'package:grenco/core/models/user_model.dart';
import 'package:grenco/core/widgets/custom_button/custom_button.dart';
import 'package:grenco/core/widgets/custom_text_field/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? email, password;
  UserModel userModel = UserModel(
    username: '',
    email: '',
    role: '',
    uid: '',
  );

  bool isLoading = false;

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
              child: Form(
                key: formKey,
                autovalidateMode: autoValidateMode,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: 300, child: Image.asset("assets/grenco.png")),
                    SizedBox(height: 100),
                    CustomTextField(
                      fieldType: FieldType.email,
                      iconData: Icons.email,
                      hint: "Your Email",
                      onSave: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      fieldType: FieldType.password,
                      iconData: Icons.lock,
                      hint: "Your Password",
                      onSave: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(height: 60),
                    CustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          setState(() {
                            isLoading = true;
                          });

                          final auth = Auth();
                          final result = await auth.login(
                            email: email!,
                            password: password!,
                            context: context,
                          );

                          setState(() {
                            isLoading = false;
                          });

                          if (result != null) {
                            // جلب بيانات المستخدم
                            final userData = await auth.getCurrentUserData();
                            final uid =
                                result.user?.uid; // <-- هنا بنجيب الـ uid

                            if (userData != null && uid != null) {
                              final userModel = UserModel(
                                uid: uid,
                                email: userData['email'],
                                role: userData['role'],
                                username: userData['username'],
                              );

                              context.go('/home', extra: userModel);
                            }
                          } else {
                            // لو فشل تسجيل الدخول
                            setState(() {
                              email = '';
                              password = '';
                            });
                            formKey.currentState!.reset();
                            setState(() {
                              autoValidateMode = AutovalidateMode.disabled;
                            });
                          }
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      text: isLoading ? "loading .." : "Login",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
