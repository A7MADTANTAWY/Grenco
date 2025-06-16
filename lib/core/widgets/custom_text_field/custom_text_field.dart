import 'package:flutter/material.dart';

enum FieldType { email, password, username }

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final Function(String?)? onSave;
  final TextEditingController? controller;
  final FieldType fieldType;
  final IconData? iconData;

  const CustomTextField({
    super.key,
    this.hint = '',
    this.maxLines = 1,
    this.onSave,
    this.controller,
    this.fieldType = FieldType.username,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: fieldType == FieldType.password,
      keyboardType: fieldType == FieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }

        if (fieldType == FieldType.password && value.length < 6) {
          return 'Password must be at least 6 characters long';
        }

        if (fieldType == FieldType.email) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        }

        return null;
      },
      onSaved: onSave,
      maxLines: maxLines,
      cursorColor: Colors.greenAccent,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xffE8F5E9),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(iconData ?? Icons.person),
        ),
        hintStyle: TextStyle(color: Colors.grey[700]),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.greenAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
