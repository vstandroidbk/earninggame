import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/models/spdpcombinationmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import '../../models/spdptbcombinationmodel.dart';
import '../profileprovider.dart';

class SpDpTpProvider with ChangeNotifier{
  clearallValue(){
    spVal=false;
    dpVal=false;
    tpVal=false;
    _gametype=null;
    spDpTpCominations=SpDpTpCombModel();
    spDpCominations=SpnDpCombiModel();
  }
  bool? spVal=false;
  bool? dpVal=false;
  bool? tpVal=false;

  changeSpVal(bool? val){
    spVal=val;
    notifyListeners();
  }
  changeDpVal(bool? val){
    dpVal=val;
    notifyListeners();
  }
  changeTpVal(bool? val){
    tpVal=val;
    notifyListeners();
  }
  String? _gametype;
  get gameType => _gametype;

  setgameTypeChange(val) {
    _gametype = val;
    notifyListeners();
  }

  removeCombination(context,index,String type){
    int curerntAmount= Provider.of<ProfileProvider>(context,listen: false).amountTemporary;
    int oldPoint;
    if(type=="spdptp"){
       oldPoint=int.parse(spDpTpCominations.posssibleArray![index].points.toString());
      spDpTpCominations.posssibleArray!.removeAt(index);
    }else{
     oldPoint=int.parse(spDpCominations.posssibleArray![index].points.toString());
      spDpCominations.posssibleArray!.removeAt(index);
    }
    int newAmountWillBe= int.parse(curerntAmount.toString()) + int.parse(oldPoint.toString());
    Provider.of<ProfileProvider>(context,listen: false).setGetAmount(newAmountWillBe);
    notifyListeners();
  }

  changeTempAmt(context,int amt){
    Future.delayed(Duration.zero,(){
      Provider.of<ProfileProvider>(context,listen: false).setGetAmount(amt);
    });
  }

  SpDpTpCombModel spDpTpCominations=SpDpTpCombModel();
  SpnDpCombiModel spDpCominations=SpnDpCombiModel();
  clearCmbination(){
    spDpTpCominations=SpDpTpCombModel();
    spDpCominations=SpnDpCombiModel();
    notifyListeners();
  }
  bool combinationLoding=false;
  spDpTpCombinationGetApiCall(context,Map<String,dynamic> data,{String? type})async{
    bool hasInternet=await hasNetwork();
    combinationLoding=true;
    if(hasInternet==true){
      try{
        http.Response request = await http.post(Uri.parse(type=="sp"?Constants.SpDpGetCombinationApiUrl:type=="dp"?Constants.SpDpGetCombinationApiUrl:Constants.mainGameSpDpTpGetCombiApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(data)));
        //   print("${request.body} ========================request.statusCode");
        if(request.statusCode==200){
          Map<String,dynamic> body=jsonDecode(request.body);
          // print("$body ========================vvv");
          ResponseIncriptModel responseData= ResponseIncriptModel.fromJson(body);
          Map<String, dynamic> getEncryptedData =
          DataEncryption.getDecryptedData(
              responseData.data!.reskey.toString(),
              responseData.data!.resdata.toString());
          // print("$getEncryptedData ========================getEncryptedData cccc");

          if(getEncryptedData['status']==true){
            if(type=="spdptp"){
              spDpTpCominations=SpDpTpCombModel.fromJson(getEncryptedData);
              if(spDpTpCominations.status==false){
                customSnackbar(context, spDpTpCominations.msg);
              }
            }else{
              spDpCominations=SpnDpCombiModel.fromJson(getEncryptedData);
              if(spDpCominations.status==false){
                customSnackbar(context, spDpTpCominations.msg);
              }
            }

            notifyListeners();
          }else{
            customSnackbar(context, getEncryptedData['msg']);
          }

         // log(dataApi.toString());
        }else{
          customSnackbar(context, serverErrortMsg);
        }
      }catch(e){
        log(e.toString());
        customSnackbar(context, "Something went wrong.. $e");
      }
    }else{
      customSnackbar(context, noInternetMsg);
    }
    combinationLoding=false;
    notifyListeners();
  }
}