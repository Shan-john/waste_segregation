import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waste_segregation/core/function.dart';
import 'package:waste_segregation/core/routes.dart';
import 'package:waste_segregation/usermodel/usermodel.dart';

class FireBaseAuthHelper {
  static FireBaseAuthHelper instance = FireBaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showMessage("logining..");
   
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      showMessage("Login successfully completed ..");
      Routes.instance.pop(context);
      return true;
    } on FirebaseAuthException catch (ex) {
      showMessage(ex.code.toString());
      return false;
    }
  }

  Future<bool> signup(
      String name, String email, String password, BuildContext context) async {
    try {
      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      showMessage("Signuped successfully completed ..");
      Usermodel usermodel =
          Usermodel(email: email, id: userCredential.user!.uid, name: name);
      _firestore.collection("Users").doc(usermodel.id).set(usermodel.toJson());
      return true;
    } on FirebaseAuthException catch (ex) {
      showMessage(ex.code.toString());

      return false;
    }
  }

  Future<bool> logOut() async {
    try {
      showMessage("LoginIng out");
      await _auth.signOut();
      return true;
    } catch (e) {
      showMessage("failed");
      return false;
    }
  }
}

showloaderDailog(BuildContext context) {
  var hsize = MediaQuery.of(context).size.height;
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const CircularProgressIndicator(
            color: Color.fromARGB(255, 93, 91, 91),
          ),
          SizedBox(
            height: hsize / 55,
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading...!"),
          )
        ]),
      );
    }),
  );
  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });
}
