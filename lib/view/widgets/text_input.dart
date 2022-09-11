import 'package:flutter/material.dart';
import 'package:tik_tok_clone/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData myIcon;
  final String myLabelText;
  final bool toHide;
  
  TextInputField({
    Key? key,
    required this.controller,
    required this.myIcon,
    required this.myLabelText,
    this.toHide=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
        icon: Icon(
          myIcon,
        ),
        labelText: myLabelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
