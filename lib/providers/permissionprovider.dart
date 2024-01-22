import 'package:flutter/material.dart';

class PermissionProvider with ChangeNotifier {
  final List<Map> _permissions = [
    {
      "icon": "assets/demoimages/mic.png",
      "title": "Microphone",
      "subtitle":
          "This permission is required for sending audio messages to this app's Customer support",
      "value": 0
    },
    {
      "icon": "assets/demoimages/telephone.png",
      "title": "Call",
      "subtitle":
          "This permission is required for calling to this app's Customer support",
      "value": 0
    },
    {
      "icon": "assets/demoimages/folder.png",
      "title": "Storage",
      "subtitle": "This permission is required to access storage",
      "value": 0
    }
  ];
  get permisssion => _permissions;

  setPermission(value, index) {
    _permissions[index]["value"] = value;
    notifyListeners();
  }
}
