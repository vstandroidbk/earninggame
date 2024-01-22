import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/gameratesmodel.dart';

class GameRatesProvider with ChangeNotifier {
  GameRatesModel _gameRatesModelData = GameRatesModel();

  get getGameRatesData => _gameRatesModelData;
  bool isloading = false;
  gameRatesApiCall(context) async {
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request =
            await http.post(Uri.parse(Constants.gameRatesApiUrl),
                body: jsonEncode(DataEncryption.getEncryptedData({
                  "env_type": Constants.envType,
                })));
        if (request.statusCode == 200) {
          _gameRatesModelData = GameRatesModel();
          Map<String, dynamic> dataIn = jsonDecode(request.body);

          ResponseIncriptModel dataDec = ResponseIncriptModel.fromJson(dataIn);
          Map<String, dynamic> realdata = DataEncryption.getDecryptedData(
              "${dataDec.data?.reskey}", "${dataDec.data?.resdata}");
          if (realdata['status'] == true) {
            _gameRatesModelData = GameRatesModel.fromJson(realdata);
            notifyListeners();
          } else {
            customSnackbar(context, "${realdata['msg']}");
          }

          log("real data ===============================$realdata=====");
          // print("${homeModelData} ===data");
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
        log(e.toString());
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isloading = false;
    notifyListeners();
  }
}
