import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const CustomTextField({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      hintText: hintText,
      border:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    ));
  }
}
