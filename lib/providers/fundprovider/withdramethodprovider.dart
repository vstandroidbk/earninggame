import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/ui/funduis/pincheckui.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../models/withdrawmethodgetmodel.dart';
import '../../models/withdrawmethodlistmodel.dart';
import '../profileprovider.dart';

class WithDrawMethodProvider with ChangeNotifier {
  TextEditingController gpayController = TextEditingController();
  TextEditingController phonePayController = TextEditingController();
  TextEditingController paytmController = TextEditingController();
  TextEditingController upiController = TextEditingController();
  WithdrawMethodGetModel _withdrawMethodGetData = WithdrawMethodGetModel();
  get withdrawGetMethodData => _withdrawMethodGetData;
  bool isGetDataLoding = false;
  Map<String, dynamic>? controllersval;
  setcontrollerval(gpay, phonepay, paytm, vpa) {
    // controllersval = <String, dynamic>{
    gpayController.text = gpay ?? '';
    phonePayController.text = phonepay ?? '';
    paytmController.text = paytm ?? '';
    upiController.text = vpa ?? '';
    // };

    notifyListeners();
  }

  withdrawMethodGetApiCall(context) async {
    bool isNetwrok = await hasNetwork();
    isGetDataLoding = true;
    notifyListeners();
    if (isNetwrok) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.withdrawMethodGetApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "user_id": idUser})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBodyData = jsonDecode(request.body);
          ResponseIncriptModel response =
              ResponseIncriptModel.fromJson(decodedBodyData);

          Map<String, dynamic> getDecriptedData =
              DataEncryption.getDecryptedData(response.data!.reskey.toString(),
                  response.data!.resdata.toString());

          _withdrawMethodGetData =
              WithdrawMethodGetModel.fromJson(getDecriptedData);
          customSnackbar(context, _withdrawMethodGetData.status.toString());
          log("==========body data =      ${getDecriptedData}   ==body data");

          // if (_withdrawMethodGetData.status == true) {
          setcontrollerval(
              _withdrawMethodGetData.upidata?[0].googlePayNumber,
              _withdrawMethodGetData.upidata?[0].phonePayNumber,
              _withdrawMethodGetData.upidata?[0].paytmNumber,
              _withdrawMethodGetData.upidata?[0].vpaId);
          // }
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
    isGetDataLoding = false;
    notifyListeners();
  }

  //api for post = update bank detail
  bool isupdateDataLoding = false;
  withdrawMethodUpdateApiCall(context, Map<String, dynamic> bankData) async {
    bool isNetwrok = await hasNetwork();
    isupdateDataLoding = true;
    notifyListeners();
    if (isNetwrok) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.withdrawMethodUpdateApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(bankData)));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBodyData = jsonDecode(request.body);
          ResponseIncriptModel response =
              ResponseIncriptModel.fromJson(decodedBodyData);
          Map<String, dynamic> getDecriptedData =
              DataEncryption.getDecryptedData(response.data!.reskey.toString(),
                  response.data!.resdata.toString());
          customSnackbar(context, getDecriptedData['msg'].toString());
          if (getDecriptedData['status'] == true) {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          }
          print("==========body data =      ${getDecriptedData}   ==body data");
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
    isupdateDataLoding = false;
    notifyListeners();
  }

  //api for check pending request befor  new withdraw request

  bool isCheckReqloading = false;
  checkPendReqApiCall(context, Map<String, dynamic> reqData) async {
    bool isInternet = await hasNetwork();

    isCheckReqloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.withdrawCheckPendReqApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "user_id": idUser})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel response =
              ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              response.data!.reskey.toString(),
              response.data!.resdata.toString());
          print(
              "${decreptedData} ========================== decreptedData data");
          if (decreptedData['status'] == false) {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return PinChekUi(withdrawReqData: reqData);
              },
            ));
          } else {
            customSnackbar(context,
                "You can't request again.Your previous request is in progress. ");
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
    isCheckReqloading = false;
    notifyListeners();
  }

  //api for new withdraw request
  int? dropValue;
  setdropValue(val) {
    dropValue = val;
    notifyListeners();
  }

  bool isWithdrawReqloading = false;
  withdrawReqApiCall(context, Map<String, dynamic> reqData) async {
    bool isInternet = await hasNetwork();

    isWithdrawReqloading = true;
    notifyListeners();
    if (isInternet) {
      print("${reqData} =========================sended");
      print(
          "${jsonEncode(DataEncryption.getEncryptedData(reqData))} =================encoded sended data");
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.withdrawReqApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(reqData)));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel response =
              ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              response.data!.reskey.toString(),
              response.data!.resdata.toString());
          print(
              "${decreptedData} ========================== decreptedData data");
          customSnackbar(context, decreptedData['msg'].toString());
          Provider.of<ProfileProvider>(context, listen: false)
              .profileDataApiCall(context);
          Navigator.pop(context);
        } else {
          log(request.body.toString());
          log("error in withdraw request===========================");
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isWithdrawReqloading = false;
    notifyListeners();
  }

  //api for get widthdraw methods
  WithdrawMethodListGetModel _withdrawMethodList = WithdrawMethodListGetModel();
  get withdrawMethodList => _withdrawMethodList;
  bool isWithdrawMethodloading = false;
  withdrawMethodgetApiCall(context) async {
    bool isInternet = await hasNetwork();

    isWithdrawMethodloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.withdrawmethodListGetApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "user_id": idUser})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel response =
              ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              response.data!.reskey.toString(),
              response.data!.resdata.toString());
          _withdrawMethodList =
              WithdrawMethodListGetModel.fromJson(decreptedData);
          notifyListeners();
          // print("${decreptedData} ======================== decreptedData data");
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isWithdrawMethodloading = false;
    notifyListeners();
  }
}
