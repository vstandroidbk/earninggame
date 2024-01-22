import 'dart:convert';

import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/onbording/mobilenoui.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ForgetPassProvider with ChangeNotifier {
  bool isloading = false;
  forgetPassUpApiCall(context, mobNo, pass) async {
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    if (isInternet) {
      http.Response request = await http.post(
          Uri.parse(Constants.forgetPassUpApiUrl),
          body: jsonEncode(DataEncryption.getEncryptedData({
            "env_type": Constants.envType,
            "mobile": mobNo,
            "password": pass
          })));
      if (request.statusCode == 200) {
        Map apidata = jsonDecode(request.body);
        Map? realData = DataEncryption.getDecryptedData(
            apidata["data"]?["reskey"], apidata["data"]?["resdata"]);
        // print("${realData}============real data data");
        if (realData["status"] == true) {
          customSnackbar(context, realData["msg"].toString());
          Navigator.pushAndRemoveUntil(context,
              CupertinoPageRoute(builder: (context) {
            return const MobileNoUi();
          }), (route) => false);
        } else {
          customSnackbar(context, realData["msg"].toString());
        }
      } else {
        customSnackbar(context, serverErrortMsg);
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isloading = false;
    notifyListeners();
  }
}
