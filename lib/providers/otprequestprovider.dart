// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../networking/checkinternet.dart';
import '../networking/data_encryption.dart';
import '../onbording/verifyMobilenoui.dart';
import '../utils/constants.dart';

class OtpRequestProvider with ChangeNotifier {
  bool isloading = false;
  requestOTPApicall(context, mobNo, {isforget, isresend}) async {
    bool isInternet = await hasNetwork();
    if (isInternet) {
      isloading = true;
      notifyListeners();
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.otpRequestApiUrl),
            headers: {
              'Content-type': 'application/json',
            },
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "mobile": mobNo})));
        var data = request.body;
        log(data);
        Map decodedData = jsonDecode(data);

        if (request.statusCode == 200) {
          var resKey = decodedData["data"]['reskey'];
          var resData = decodedData["data"]['resdata'];
          log(resKey);
          log(resData);
          var realdata = DataEncryption.getDecryptedData(resKey, resData);

          // print(
          //     "${realdata}===${realdata['status'].runtimeType}========= realdata");
          customSnackbar(context, "${realdata['msg']}");
          if (realdata['status'] == true) {
            if (isforget == true) {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return VerifyMobileNoUi(
                  mobileNo: mobNo,
                  isforgetui: true,
                );
              }));
            } else if (isresend == true) {
            } else {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return VerifyMobileNoUi(mobileNo: mobNo); //, isforget: true
              }));
            }
          }
        } else {
          customSnackbar(context, "Server error");
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, "No internet connection found");
    }
    isloading = false;
    notifyListeners();
  }
}
