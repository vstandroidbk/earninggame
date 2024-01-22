import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../networking/checkinternet.dart';
import '../networking/data_encryption.dart';
import '../utils/components.dart';

class UpdatePassProvider with ChangeNotifier {
  bool isloading = false;
  updatePassApiCall(context, uId, oldPass, newPass) async {
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request =
            await http.post(Uri.parse(Constants.updatePassApiUrl),
                headers: {
                  'Content-type': 'application/json',
                },
                body: jsonEncode(DataEncryption.getEncryptedData({
                  "env_type": Constants.envType,
                  "user_id": uId,
                  "old_pass": oldPass,
                  "new_pass": newPass
                })));
        var data = request.body;
        log(data);
        Map decodedData = jsonDecode(data);

        if (request.statusCode == 200) {
          var resKey = decodedData["data"]['reskey'];
          var resData = decodedData["data"]['resdata'];
          var realdata = DataEncryption.getDecryptedData(resKey, resData);

          print("${realdata}============ realdata");
          if (realdata['status'] == true) {
            customSnackbar(context, "${realdata['msg']}");
            Navigator.pop(context);
          } else {
            customSnackbar(context, "${realdata['msg']}");
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
