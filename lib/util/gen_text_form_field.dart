import 'package:flutter/material.dart';

import 'helper.dart';

class GenTextFormField extends StatelessWidget {
  // const GenTextFormField({Key? key}) : super(key: key);
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType;
  GenTextFormField({
    required this.controller,
    required this.hintName,
    required this.icon,
    required this.isObscureText,
    required this.inputType
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: inputType,
        validator: (val) {
          if(val == null || val.isEmpty){
            return 'Please enter $hintName';
          }
          if (hintName == 'Email' && !validateEmail(val)){
            return 'Please enter valid Email';
          }
          return null;
        },
        onSaved: (val) => controller.text = val!,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Colors.transparent,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Colors.blue,
              )
          ),
          prefixIcon: Icon(icon),
          hintText: hintName,
          labelText: hintName,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
