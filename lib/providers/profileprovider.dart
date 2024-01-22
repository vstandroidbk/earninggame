import 'dart:convert';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/profilemodel.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel profileModelData = ProfileModel();
  bool isloading = false;
  static int amount = 0;
  static int getamount = amount;
  profileDataApiCall(context) async {
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request =
            await http.post(Uri.parse(Constants.profileApiUrl),
                body: jsonEncode(DataEncryption.getEncryptedData({
                  "env_type": Constants.envType,
                  "user_id": idUser,
                })));
        if (request.statusCode == 200) {
          Map<String, dynamic> dataIn = jsonDecode(request.body);
          ResponseIncriptModel dataDec = ResponseIncriptModel.fromJson(dataIn);
          Map<String, dynamic> realdata = DataEncryption.getDecryptedData(
              "${dataDec.data?.reskey}", "${dataDec.data?.resdata}");
          profileModelData = ProfileModel.fromJson(realdata);
          amount =
              int.parse("${profileModelData.profile?[0].walletBalance ?? 0}");
          notifyListeners();
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isloading = false;
    notifyListeners();
  }
}
