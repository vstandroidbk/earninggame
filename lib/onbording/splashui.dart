import 'package:earninggame/onbording/getpermissionui.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:earninggame/utils/sharepreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/navigation.dart';
import '../utils/colors.dart';

class SplashUi extends StatefulWidget {
  const SplashUi({super.key});

  @override
  State<SplashUi> createState() => _SplashUiState();
}

class _SplashUiState extends State<SplashUi> {
  @override
  void initState() {
    super.initState();
    getPreference();
    Future.delayed(const Duration(seconds: 2), () {
      return Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (context) {
        if (idUser != null && idUser != "null") {
          return NavigationUi(
            widgetIndex: 2,
          );
        } else {
          return const PermissionUi();
        }
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                child: Image.asset("assets/demoimages/demoicon.png")),
            const Text(
              "Logo",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            )
          ],
        ),
      )),
    );
  }
}
