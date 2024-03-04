import 'dart:convert';
import 'package:earninggame/models/maingmbidhistorymodel.dart';
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

  MainGmBidHistoryModel _mgameBidHistory = MainGmBidHistoryModel();
  get getMainGameBidHistoryData => _mgameBidHistory;
  bool isBidHistoryLoding = false;
  mainGameBidHistoryApiCall(context) async {
    bool isInternet = await hasNetwork();
    isBidHistoryLoding = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.mainGameBidHistoryApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType,
                  "user_id": idUser,
                  "bid_from": "",
                  "bid_to": ""
                }
            )));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel resIncData =
          ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              "${resIncData.data?.reskey}", "${resIncData.data?.resdata}");
          if(decreptedData['status']){
          _mgameBidHistory = MainGmBidHistoryModel.fromJson(decreptedData);
          notifyListeners();
          }else{
          customSnackbar(context, decreptedData['msg']);
          }
          // print(
          //     "${decreptedData} ========================== decreptedData data");

        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isBidHistoryLoding = false;
    notifyListeners();
  }
}
