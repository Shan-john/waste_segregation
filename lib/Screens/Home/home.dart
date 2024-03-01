import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waste_segregation/Screens/Widgets/widgets.dart';
import 'package:waste_segregation/Screens/auth_ui/Login.dart';
import 'package:waste_segregation/core/constants.dart';
import 'package:waste_segregation/core/function.dart';

import 'package:waste_segregation/core/routes.dart';
import 'package:waste_segregation/service/firebase_auth_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrywaste = false;
  bool isWetWaste = false;
  bool isMetalWaste = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 0, 94),
        // title: showText(label: widget.username, size: 25, color: Colors.white),
        leading: InkWell(
            onTap: ()async {
              bool loginout = false;
              loginout =await FireBaseAuthHelper.instance.logOut();
              if (loginout) {
                  Routes.instance.pushandRemoveUntil(context: context,widget: LoginPage());
              }
             
              Constants.instance.username = "";
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        actions: [
          InkWell(
            onTap: () {
              showMessage("menuButton Clicked");
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          const Gap(20)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: showText(
                  label: "Waste Segregation",
                  size: 35,
                  color: const Color.fromARGB(255, 255, 255, 255))),
          const SplineChartgraph(
            label: "Dry waste",
            percentagerate: 70,
          ),
          const Gap(20),
          const SplineChartgraph(label: "Wet waste", percentagerate: 20),
          const Gap(20),
          const SplineChartgraph(
            label: "Metal waste",
            percentagerate: 89,
          ),
          const Gap(20),
          Primarybutton(
            height: 45,
            fontsize: 20,
            colors: Color.fromARGB(183, 126, 9, 236),
            onpressed: () {
              Constants.instance.username = "";
              Routes.instance.pop(context);
            },
            label: "Exit",
            size: size.width - 20,
          ),
        ],
      ),
    );
  }
}
