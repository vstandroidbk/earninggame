import 'dart:convert';
import 'package:earninggame/models/ksbidhistorymodel.dart';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/starlinegameresultmodel.dart';

class StarlineGmResultProvider with ChangeNotifier {
  StarlineGameResultModel _starlineGmResult = StarlineGameResultModel();
  get starlineGmResultData => _starlineGmResult;
  bool isloading = false;
  starlineGmResultApiCall(context, date) async {
    bool isInternet = await hasNetwork();

    isloading = true;
    _starlineGmResult = StarlineGameResultModel();
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.starlineGmRateApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "date": date})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel resIncData =
              ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              "${resIncData.data?.reskey}", "${resIncData.data?.resdata}");
          _starlineGmResult = StarlineGameResultModel.fromJson(decreptedData);
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

  KsBidHistoryModel _starlineBidHistory = KsBidHistoryModel();
  get starlineBidHistoryData => _starlineBidHistory;
  bool isKsBidHistrorydataLoding = false;
  ksBidHistryApiCall(context) async {
    bool isInternet = await hasNetwork();
    isKsBidHistrorydataLoding = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.ksBidHistoryApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType,
                  "user_id": idUser,//"517935902854",
                  "bid_from": "",
                  "bid_to": ""
                })));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel resIncData =
          ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              "${resIncData.data?.reskey}", "${resIncData.data?.resdata}");
          if(decreptedData['status']){
            _starlineBidHistory = KsBidHistoryModel.fromJson({"data":decreptedData});
            notifyListeners();
          }else{
            customSnackbar(context,decreptedData['msg']);
          }
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isKsBidHistrorydataLoding = false;
    notifyListeners();
  }
}
