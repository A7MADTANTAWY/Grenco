import 'package:flutter/material.dart';
import 'package:grenco/core/Auth/auth.dart';
import 'package:grenco/core/widgets/app_bar/custom_app_bar.dart';
import 'package:grenco/core/widgets/custom_button/custom_button.dart';
import 'package:grenco/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:grenco/core/widgets/custom_text_field/custom_text_field.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final auth = Auth();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? email, password, username;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: 'Sign up',
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset("assets/add user.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Transform.translate(
                offset: const Offset(0, -20), // تحريك العنصر للأعلى بمقدار 20
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
                  child: Form(
                    key: formKey,
                    autovalidateMode: autoValidateMode,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextField(
                          fieldType: FieldType.username,
                          iconData: Icons.person,
                          controller: usernameController,
                          hint: "Username",
                          onSave: (value) {
                            username = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          fieldType: FieldType.email,
                          iconData: Icons.mail,
                          controller: emailController,
                          hint: "Email",
                          onSave: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          fieldType: FieldType.password,
                          iconData: Icons.lock,
                          controller: passwordController,
                          hint: "Password",
                          onSave: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              emailController.clear();
                              passwordController.clear();
                              usernameController.clear();
                              setState(() {
                                autoValidateMode = AutovalidateMode.disabled;
                              });
                              try {
                                await auth.register(
                                  email: email!,
                                  password: password!,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("User added successfully"),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.toString()),
                                  ),
                                );
                              }
                            } else {
                              setState(() {
                                autoValidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                          text: "Add User",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
