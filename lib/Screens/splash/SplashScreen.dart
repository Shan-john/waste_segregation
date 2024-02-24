
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//    _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Delay navigation to home screen
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => StreamBuilder(
//             stream: FirebaseAuthHelper.instance.getAuthChange,
//             builder: (context, snapshot) {
//               // if (snapshot.hasData) {
//               //   return // main Screen ();
//               // } else {
//               //   return //  login or signup up screen ();
//               // }
//             },
//           ),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//            ),);
//   }
// }
