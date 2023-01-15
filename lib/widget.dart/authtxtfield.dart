import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final widthh;
  final isPassword;
  final labelText;
  final prefixIcon;
  final labelColor;
  final hintColor;
  final underlineColor;
  TextEditingController controller;

  AuthTextField(
      {Key? key,
      required this.controller,
      required this.underlineColor,
      required this.labelColor,
      required this.hintColor,
      required this.widthh,
      required this.isPassword,
      this.prefixIcon,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widthh,
        child: TextFormField(
          controller: controller,
          style: TextStyle(color: hintColor),
          cursorColor: Colors.white,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: labelColor),
            hintStyle: TextStyle(color: hintColor),
            prefixIcon: prefixIcon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: underlineColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: underlineColor),
            ),
          ),
        ));
  }
}
