import 'dart:convert';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/maingameresultmodel.dart';

class MainGameResultProvider with ChangeNotifier {
  MainGameResultModel _mainGmResult = MainGameResultModel();
  get galiGmRatesData => _mainGmResult;
  bool isloading = false;
  getGaliRatesApiCall(context, date) async {
    bool isInternet = await hasNetwork();

    isloading = true;
    _mainGmResult = MainGameResultModel();
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.mainGameResultApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "date": date})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel resIncData =
              ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              "${resIncData.data?.reskey}", "${resIncData.data?.resdata}");
          _mainGmResult = MainGameResultModel.fromJson(decreptedData);
          // print(
          //     "${decreptedData} ========================== decreptedData data");

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
