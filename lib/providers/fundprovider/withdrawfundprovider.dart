import 'dart:convert';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../models/funddepositemodel.dart';
import '../../models/fundwithdrawmodel.dart';
import '../../models/withdrafundgetmodel.dart';

class WithdrawFundProvider with ChangeNotifier {
  WithdraFundGetModel _withdrawFundGetData = WithdraFundGetModel();
  get withdrawGetWelletData => _withdrawFundGetData;
  bool isLoding = false;
  withdrawGetWalletApiCall(context) async {
    bool isNetwrok = await hasNetwork();
    isLoding = true;
    notifyListeners();
    if (isNetwrok) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.withdrawWalletApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "user_id": idUser})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBodyData = jsonDecode(request.body);
          ResponseIncriptModel response =
              ResponseIncriptModel.fromJson(decodedBodyData);
          Map<String, dynamic> getDecriptedData =
              DataEncryption.getDecryptedData(response.data!.reskey.toString(),
                  response.data!.resdata.toString());
          _withdrawFundGetData = WithdraFundGetModel.fromJson(getDecriptedData);
          // print("==========body data =      ${getDecriptedData}   ==body data");
          notifyListeners();
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isLoding = false;
    notifyListeners();
  }

  FundWithdrawModel _withdrawFundHistory = FundWithdrawModel();
  get getWithdrawHistory => _withdrawFundHistory;
  bool isHistoryLoding = false;
  withdrawGetHistoryApiCall(context) async {
    bool isNetwrok = await hasNetwork();
    isHistoryLoding = true;
    notifyListeners();
    if (isNetwrok) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.fundWithdrawHistroyApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "user_id": idUser})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBodyData = jsonDecode(request.body);
          ResponseIncriptModel response =
          ResponseIncriptModel.fromJson(decodedBodyData);
          Map<String, dynamic> getDecriptedData =
          DataEncryption.getDecryptedData(response.data!.reskey.toString(),
              response.data!.resdata.toString());
          _withdrawFundHistory = FundWithdrawModel.fromJson(getDecriptedData);
          // print("==========body data =      ${getDecriptedData}   ==body data");
          notifyListeners();
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isHistoryLoding = false;
    notifyListeners();
  }

  //api for fund deposite
  FundDepositeModel _fundDepositeData = FundDepositeModel();
  get getFundDepositeData => _fundDepositeData;
  bool isDepositedataLoding = false;
  fundDepositeApiCall(context) async {
    bool isNetwrok = await hasNetwork();
    isDepositedataLoding = true;
    notifyListeners();
    if (isNetwrok) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.fundDepositeApiCall),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "user_id": idUser})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBodyData = jsonDecode(request.body);
          ResponseIncriptModel response =
          ResponseIncriptModel.fromJson(decodedBodyData);
          Map<String, dynamic> getDecriptedData =
          DataEncryption.getDecryptedData(response.data!.reskey.toString(),
              response.data!.resdata.toString());
          if(getDecriptedData['status']){
            _fundDepositeData = FundDepositeModel.fromJson(getDecriptedData);
            notifyListeners();
          }else{
          customSnackbar(context, getDecriptedData['msg']);
          }
          // print("==========body data =      ${getDecriptedData}   ==body data");
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isDepositedataLoding = false;
    notifyListeners();
  }

}
