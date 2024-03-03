import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:waste_segregation/Screens/Widgets/widgets.dart';
import 'package:waste_segregation/Screens/auth_ui/login.dart';

import 'package:waste_segregation/core/routes.dart';

import 'package:waste_segregation/service/firebase_auth_helper.dart';
import 'package:waste_segregation/service/firebasefirestore_helper.dart';
import 'package:waste_segregation/usermodel/usermodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String stDrywastelevel = "";
  double drywasteLevelvalue = 0;
  String stWetwastelevel = "";
  double wetwasteLevelvalue = 0;
  String stMetalwastelevel = "";
  double metalwasteLevelvalue = 0;
  Usermodel userdata = Usermodel();
  Future<FirebaseApp> _fapp = Firebase.initializeApp();
  @override
  void initState() {
    getuserdata();
    drywastelevel();
    wetwastelevel();
    metalwastelevel();
    super.initState();
  }

  // @override
  // void dispose() {

  //   Drywastelevel();
  //   wetwastelevel();
  //   metalwastelevel();

  //   super.dispose();
  // }

  void getuserdata() async {
    userdata = await FirebasefirestoreHelper.instance.getUsernameinformation();
    setState(() {});
  }

  drywastelevel() {
    DatabaseReference refdata =
        FirebaseDatabase.instance.ref().child('drywasteLevel');
    refdata.onValue.listen(
      (event) {
        setState(() {
          stDrywastelevel = event.snapshot.value.toString();
          drywasteLevelvalue = double.parse(stDrywastelevel);
        });
      },
    );
  }

  wetwastelevel() {
    DatabaseReference refdata =
        FirebaseDatabase.instance.ref().child('wetwasteLevel');
    refdata.onValue.listen(
      (event) {
        setState(() {
          stWetwastelevel = event.snapshot.value.toString();
          wetwasteLevelvalue = double.parse(stWetwastelevel);
        });
      },
    );
  }

  metalwastelevel() {
    DatabaseReference refdata =
        FirebaseDatabase.instance.ref().child('metalwasteLevel');
    refdata.onValue.listen(
      (event) {
        setState(() {
          stMetalwastelevel = event.snapshot.value.toString();
          metalwasteLevelvalue = double.parse(stMetalwastelevel);
        });
      },
    );
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 41, 0, 94),
          title: showText(
              label: userdata.name ?? "", size: 25, color: Colors.white),
        ),
        body: FutureBuilder(
            future: _fapp,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: showText(
                          label: "Waste Segregation",
                          size: 35,
                          color: const Color.fromARGB(255, 255, 255, 255))),
                  SplineChartgraph(
                    label: "Dry waste",
                    percentagerate: drywasteLevelvalue > 100
                        ? 0
                        : drywasteLevelvalue < 0
                            ? 0
                            : drywasteLevelvalue,
                  ),
                  const Gap(20),
                  SplineChartgraph(
                    label: "Wet waste",
                    percentagerate: wetwasteLevelvalue > 100
                        ? 0
                        : wetwasteLevelvalue < 0
                            ? 0
                            : wetwasteLevelvalue,
                  ),
                  const Gap(20),
                  SplineChartgraph(
                    label: "Metal waste",
                    percentagerate: metalwasteLevelvalue > 100
                        ? 0
                        : metalwasteLevelvalue < 0
                            ? 0
                            : metalwasteLevelvalue,
                  ),
                  const Gap(20),
                  Primarybutton(
                    height: 45,
                    fontsize: 20,
                    colors: const Color.fromARGB(183, 126, 9, 236),
                    onpressed: () {
                      FireBaseAuthHelper.instance.logOut();
                      Routes.instance.pushandRemoveUntil(
                          context: context, widget: LoginPage());
                    },
                    label: "SignOut",
                    size: size.width - 20,
                  ),
                ],
              );
            }));
  }
}
