import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool Authvalidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    ShowMessage("Email is empty");
    return false;
  } else if (email.isEmpty) {
    ShowMessage("Email is empty");
    return false;
  } else if (password.isEmpty) {
    ShowMessage("password is empty");
    return false;
  } else {
    return true;
  }
}
void ShowMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      textColor: Colors.white,
      fontSize: 16.0);
}
