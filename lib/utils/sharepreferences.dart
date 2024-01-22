import 'dart:developer';

import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onbording/mobilenoui.dart';
import '../ui/navigation.dart';

setPreference(context, String id, String name, String number) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  prefs.setString("id", id);
  prefs.setString("name", name);
  prefs.setString("number", number);
  getPreference();
  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) {
    return NavigationUi(
      widgetIndex: 2,
    );
  }), (route) => false);
}

getPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  idUser = prefs.getString("id");
  nameUser = prefs.getString("name");
  numberUser = prefs.getString("number");

  log("idUser=$idUser, nameUser=$nameUser ,userphone= $numberUser");
}

clearPreference(context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("id");
  prefs.clear();

  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) {
    return const MobileNoUi();
  }), (route) => false);
}
