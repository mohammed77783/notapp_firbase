// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class my_textFiled extends StatelessWidget {
  final String hinttext;
  final bool obscureText;
  final TextEditingController controllerl;

  const my_textFiled({
    Key? key,
    required this.hinttext,
    required this.obscureText,
    required this.controllerl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerl,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),hintText: hinttext
        
      ),
      obscureText: obscureText,
    );
  }
}
