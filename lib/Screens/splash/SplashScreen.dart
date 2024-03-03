import 'package:flutter/material.dart';
import 'package:waste_segregation/Screens/Home/home.dart';
import 'package:waste_segregation/Screens/auth_ui/Login.dart';
import 'package:waste_segregation/service/firebase_auth_helper.dart';
import 'package:waste_segregation/core/assetsImage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to home screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StreamBuilder(
            stream: FireBaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return LoginPage();
              }
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 22, 1),
      body: Center(
        child: Container(
          //  height:400 ,
          //  width: 400,
          color: Color.fromARGB(255, 0, 22, 1),
          child: Image.asset(
            Assetsimage.instance.recycle,
            scale: 6,
          ),
        ),
      ),
    );
  }
}
