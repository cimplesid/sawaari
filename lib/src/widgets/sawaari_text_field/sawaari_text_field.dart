import 'package:flutter/material.dart';

class SaawariTextField extends StatelessWidget {
  final bool obscureText;
  final Function validator;
  final TextInputType keyboardType;
  final String label;

  const SaawariTextField({
    Key key,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      key: key,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        fillColor: Colors.pink,
        filled: true,
        counterStyle: TextStyle(
          color: Colors.white,
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
