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
    final colorScheme = Theme.of(context).colorScheme;

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
      cursorColor: colorScheme.primary,
      style: TextStyle(color: colorScheme.onSurface),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: colorScheme.surfaceVariant, // background of field
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            iconData ?? Icons.person,
            color: Theme.of(context).primaryColor,
          ),
        ),
        hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.redAccent.shade400, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.redAccent.shade400, width: 1.5),
        ),
      ),
    );
  }
}
