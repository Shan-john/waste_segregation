import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waste_segregation/service/firebase_auth_helper.dart';
import 'package:waste_segregation/usermodel/usermodel.dart';

class FirebasefirestoreHelper {
  static FirebasefirestoreHelper instance = FirebasefirestoreHelper();

  Future<Usermodel> getUsernameinformation() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> QuerySnapshot =
        await firebaseFirestore
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

    return Usermodel.fromJson(QuerySnapshot.data()!);
  }
}
