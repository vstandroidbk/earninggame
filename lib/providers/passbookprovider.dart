import 'dart:convert';

import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../models/passbookmodel.dart';
import '../models/responseincriptmodel.dart';

class PassbookProvider with ChangeNotifier{
  PassbookModel passbookData=PassbookModel();
  bool islodingData=false;

  passbookApiCalling(context) async{
    bool isNetwork=await hasNetwork();
    if(isNetwork){
      islodingData=true;
      notifyListeners();
      try{
        http.Response request=await http.post(Uri.parse(Constants.passbookApiUrl),body: jsonEncode(DataEncryption.getEncryptedData(
          {
            "env_type": Constants.envType,
            "user_id": idUser
          }
        )));
        if(request.statusCode==200){
          Map<String,dynamic> body=jsonDecode(request.body);
          ResponseIncriptModel response =
          ResponseIncriptModel.fromJson(body);
          Map<String, dynamic> getDecriptedData =
          DataEncryption.getDecryptedData(response.data!.reskey.toString(),
              response.data!.resdata.toString());
          if(getDecriptedData['status']){
            passbookData=PassbookModel.fromJson(getDecriptedData);
            notifyListeners();
          }else{
           customSnackbar(context, getDecriptedData['msg']);
          }
        }else{
          customSnackbar(context, serverErrortMsg);
        }
      }catch(e){
      customSnackbar(context, "Something went wrong . $e");
      }
    }else{
      customSnackbar(context, noInternetMsg);
    }
    islodingData=false;
    notifyListeners();
  }
}