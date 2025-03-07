import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration inputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: const Color(0xffE8F5E9),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: Colors.green),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.green),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.greenAccent),
      ),
    );
  }
}
