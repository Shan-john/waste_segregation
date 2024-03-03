import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waste_segregation/Screens/Home/home.dart';
import 'package:waste_segregation/Screens/Widgets/widgets.dart';
 
import 'package:waste_segregation/core/function.dart';
 
import 'package:waste_segregation/core/routes.dart';

import 'package:flutter/services.dart';
import 'package:waste_segregation/service/firebase_auth_helper.dart';

class SignUppage extends StatelessWidget {
  SignUppage({super.key});

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 116, 115, 115),
              Color.fromARGB(255, 0, 0, 0),
            ],
          )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  children: [
                   
                   
                    Gap(40),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      "Use the account below to sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Gap(60),
                textfieldeditor(
                  controller: usernamecontroller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(132, 58, 58, 58), fontSize: 20),
                  ),
                ),
                const Gap(20),
                textfieldeditor(
                  controller: emailcontroller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(132, 58, 58, 58), fontSize: 20),
                  ),
                ),
                const Gap(20),
                PasswordTextField(passwordcontroller: passwordcontroller),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [ 
                    showText(
                        //if Screen type == login  the Display "Don't have an account !"
                        label: "Don't have an account !",
                        size: 16,
                        color: const Color.fromARGB(255, 247, 247, 247)),
                    const Gap(10),
                    InkWell(
                      onTap: () {
                        Routes.instance.pop(context);
                      },
                      child: showText(
                          //if Screen type == login  the Display "Don't have an account !"
                          label: "SignUp here",
                          size: 16,
                          color: const Color.fromARGB(255, 1, 88, 202)),
                    ),
                  ],
                ),
                const Gap(20),
                Primarybutton(
                  onpressed: () async {
                    // checking the password and email are not null if it true return true
                    bool validation = false;
                    validation = signUpAuthvalidation(
                        emailcontroller.text, passwordcontroller.text,usernamecontroller.text);
                    if (validation) {
                      FireBaseAuthHelper.instance.signup(usernamecontroller.text,
                          emailcontroller.text, passwordcontroller.text, context);Routes.instance.pushandRemoveUntil(
                        widget: const HomeScreen(),
                        context: context);
                    }
                    
                  },
                  height: 63,
                  size: MediaQuery.of(context).size.width - 25,
                  colors: const Color.fromARGB(183, 126, 9, 236),
                  label: "Sign In",
                  fontsize: 15,
                ),
               
               
              ]),
        ),
      ),
    );
  }
}
