import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waste_segregation/Screens/Home/home.dart';
import 'package:waste_segregation/Screens/Widgets/widgets.dart';
import 'package:waste_segregation/Screens/auth_ui/SignIn.dart';
 
import 'package:waste_segregation/core/routes.dart';

import 'package:flutter/services.dart';
 
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    "kindly enter the login details",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            textfieldeditor(
              controller: usernamecontroller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                    color: Color.fromARGB(132, 58, 58, 58), fontSize: 20),
              ),
            ),
            Gap(20),
            PasswordTextField(passwordcontroller: passwordcontroller),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showText(
                    //if Screen type == login  the Display "Don't have an account !"
                    label: "Don't have an account !",
                    size: 15,
                    color: const Color.fromARGB(255, 247, 247, 247)),
                Gap(10),
                InkWell(
                  onTap: () {
                    Routes.instance
                        .push(widget: SignInpage(), context: context);
                  },
                  child: showText(
                      //if Screen type == login  the Display "Don't have an account !"
                      label: "SignUp here",
                      size: 15,
                      color: Color.fromARGB(255, 1, 88, 202)),
                ),
              ],
            ),
            Gap(15),
            Primarybutton(
              onpressed: () async {
                // checking the password and email are not null if it true return true
                 Routes.instance.pushreplace(
                      widget: HomeScreen(username: usernamecontroller.text),
                      context: context);
              },
              height: 63,
              size: MediaQuery.of(context).size.width - 25,
              colors: Color.fromARGB(183, 126, 9, 236),
              label: "Sign In",
              fontsize: 15,
               
            ),
          ]),
    );
  }
}
