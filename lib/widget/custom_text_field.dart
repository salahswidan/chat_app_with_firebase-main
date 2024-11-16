import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.hintText, this.onChanged,required this.isPass});

  String? hintText;
  Function(String)? onChanged;
   bool? isPass = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPass!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Please enter $hintText';
        }
      },
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
