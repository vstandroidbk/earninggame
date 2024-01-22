// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/onbording/forgotmpinui.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../networking/checkinternet.dart';
import '../networking/data_encryption.dart';
import '../onbording/createaccount.dart';
import '../utils/components.dart';
import '../utils/constants.dart';

class OtpProvider with ChangeNotifier {
  bool isloading = false;
  checkOTPApicall(context, mobNo, otp, {isforget}) async {
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.otpVerifyApiUrl),
            headers: {
              'Content-type': 'application/json',
            },
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "mobile": mobNo, "otp": otp})));
        var data = request.body;
        log(data);
        Map decodedData = jsonDecode(data);

        if (request.statusCode == 200) {
          var resKey = decodedData["data"]['reskey'];
          var resData = decodedData["data"]['resdata'];
          log(resKey);
          log(resData);
          var realdata = DataEncryption.getDecryptedData(resKey, resData);

          // print("${realdata}============ realdata");
          if (realdata['status'] == true) {
            customSnackbar(context, "${realdata['msg']}");
            isloading = false;
            notifyListeners();
            if (isforget == true) {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return FortgotMpinUi(
                  mobNo: mobNo,
                );
              }));
            } else {
              Navigator.pushAndRemoveUntil(context,
                  CupertinoPageRoute(builder: (context) {
                return CreateAccountUi(mobileNo: mobNo);
              }), (route) => false);
            }
          } else {
            isloading = false;
            notifyListeners();
            return customSnackbar(context, "${realdata['msg']}");
          }
        } else {
          isloading = false;
          notifyListeners();
          return customSnackbar(context, "Server error");
        }
      } catch (e) {
        isloading = false;
        notifyListeners();
        return customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      isloading = false;
      notifyListeners();
      return customSnackbar(context, "No internet connection found");
    }
    isloading = false;
    notifyListeners();
  }
}
