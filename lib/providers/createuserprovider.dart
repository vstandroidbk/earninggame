import 'dart:convert';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../networking/checkinternet.dart';
import '../utils/sharepreferences.dart';

class CreateUserProvider extends ChangeNotifier {
  bool isloading = false;
  createUserApicall(context, Map<String, dynamic> apimap) async {
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.userRegApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(apimap)));

        if (request.statusCode == 200) {
          Map decreptdata = jsonDecode(request.body);
          var realdata = DataEncryption.getDecryptedData(
              decreptdata['data']['reskey'], decreptdata['data']['resdata']);
          // print("${realdata} ---======== real data");
          if (realdata['status'] == true) {
            customSnackbar(context, "${realdata['msg']}");
            setPreference(context, realdata['user_id'], realdata['user_name'],
                realdata['mobile']);
          } else {
            customSnackbar(context, "${realdata['msg']}");
          }
        } else {
          customSnackbar(context, "Server error. Try agin later.");
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, "No internet available");
    }
    isloading = false;
    notifyListeners();
  }
}
