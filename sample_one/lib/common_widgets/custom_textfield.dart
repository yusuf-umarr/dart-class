import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool visibility;
  final Widget? suffix;
  final Widget? prefix;
  final dynamic validator;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.visibility = false,
      required this.controller,
      this.validator,
      this.suffix,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visibility,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        prefixIcon: prefix,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
