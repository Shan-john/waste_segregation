import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool SignUpAuthvalidation(String email, String password, String name) {
  if (email.isEmpty && password.isEmpty && name.isEmpty) {
    showMessage("feilds is empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is empty");
    return false;
  } else if (password.isEmpty) {
    showMessage("password is empty");
    return false;
  } else if (name.isEmpty) {
    showMessage("name is empty");
    return false;
  } else {
    return true;
  }
}

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      textColor: Colors.white,
      fontSize: 16.0);
}

bool loginAuthvalidation(String email, String password,) {
  if (email.isEmpty && password.isEmpty) {
    showMessage("Email is empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is empty");
    return false;
  } else if (password.isEmpty) {
    showMessage("password is empty");
    return false;
  } else {
    return true;
  }
}
