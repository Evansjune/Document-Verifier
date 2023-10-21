import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

alertDialog(BuildContext context, String msg){
  Toast.show(msg, duration: Toast.lengthLong, gravity: Toast.bottom);
}

validateEmail(String email){
  final emailReg = RegExp(r'\S+@\S+\.\S+');
  return emailReg.hasMatch(email);
}