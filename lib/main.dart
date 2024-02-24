import 'package:flutter/material.dart';
import 'package:waste_segregation/Screens/auth_ui/Login.dart';

 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: LoginPage(
        
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
