import 'dart:convert';

import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/onbording/setpinui.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class LoginProvider with ChangeNotifier {
  bool isloading = false;
  loginApiCall(context, mobno, pass) async {
    bool isInternet = await hasNetwork();
    if (isInternet) {
      isloading = true;
      notifyListeners();
      try {
        http.Response request =
            await http.post(Uri.parse(Constants.userLoginApiUrl),
                body: jsonEncode(DataEncryption.getEncryptedData({
                  "env_type": Constants.envType,
                  "mobile": mobno,
                  "password": pass,
                })));
        if (request.statusCode == 200) {
          Map decodedbody = jsonDecode(request.body);
          Map realData = DataEncryption.getDecryptedData(
              decodedbody['data']['reskey'], decodedbody['data']['resdata']);
          print(" =======${realData} ===========real data");
          if (realData['status']) {
            customSnackbar(context, "${realData['msg']}");
            Navigator.push(context, CupertinoPageRoute(builder: (constant) {
              return SetPinUi(
                userData: realData,
              );
            }));
          } else {
            customSnackbar(context, "${realData['msg']}");
          }
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isloading = false;
    notifyListeners();
  }
}
