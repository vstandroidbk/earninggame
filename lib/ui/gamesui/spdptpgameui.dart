import 'dart:developer';

import 'package:earninggame/providers/gameuiproviders/spdptpprovider.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/withdrafundgetmodel.dart';
import '../../providers/fundprovider/withdrawfundprovider.dart';
import '../../providers/gameuiproviders/maingamesprovider.dart';
import '../../providers/profileprovider.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class SpDpTpGameUi extends StatefulWidget {
  final String? gameId;
  final String? gameName;
  final String? type;
  final bool? isClosedOnly;
  const SpDpTpGameUi({super.key,required this.gameId,required this.gameName,required this.type,required this.isClosedOnly});

  @override
  State<SpDpTpGameUi> createState() => _SpDpTpGameUiState();
}

class _SpDpTpGameUiState extends State<SpDpTpGameUi> {
  TextEditingController singleDigitController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  String? dropValue;
  @override
  void initState() {
    super.initState();
    Provider.of<SpDpTpProvider>(context, listen: false).clearallValue();
      dropValue =
          Provider.of<SpDpTpProvider>(context, listen: false).gameType;
    Provider.of<ProfileProvider>(context, listen: false)
        .profileDataApiCall(context);
    Provider.of<WithdrawFundProvider>(context, listen: false)
        .withdrawGetWalletApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComman( Text(widget.type=="sp"?"Sp Motor":widget.type=="dp"?"Dp Motor":"SP DP TP Game ")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select Game Type",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                        child:widget.isClosedOnly==true? Container(
                          width: 180,
                          alignment:Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                            color: greyLightClr,),
                          padding:const EdgeInsets.symmetric(vertical: 13),
                          child:const Text("Closed",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        ):  customDropDownMenueButton(dropValue, (value) {
                          Provider.of<SpDpTpProvider>(context,
                                  listen: false)
                              .setgameTypeChange(value);
                          dropValue = Provider.of<SpDpTpProvider>(
                                  context,
                                  listen: false)
                              .gameType;
                        }),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                         Consumer<SpDpTpProvider>(builder: (context,spDpTpProvider,child){
                           return  Visibility(
                             visible: widget.type=="spdptp"?true:false,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Row(
                                   children: [
                                     Checkbox(value: spDpTpProvider.spVal, onChanged: (val) {
                                       spDpTpProvider.changeSpVal(val);

                                     }),
                                     const Text("SP")
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Checkbox(value: spDpTpProvider.dpVal, onChanged: (val) {
                                       spDpTpProvider.changeDpVal(val);
                                     }),
                                     const Text("DP")
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Checkbox(value: spDpTpProvider.tpVal, onChanged: (val) {
                                       spDpTpProvider.changeTpVal(val);
                                     }),
                                     const Text("TP")
                                   ],
                                 ),
                               ],
                             ),
                           );

                         },),
                         const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enter Digit",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                          child:customInputField(singleDigitController,  TextInputType.number,textalign: true)
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enter Point",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                          child:customInputField(pointController,  TextInputType.number,textalign: true)
                      ),
                    )
                  ],
                ),
                Consumer<SpDpTpProvider>(builder: (context,spDpTpProvider,child){
                  return  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 190,
                      child: customElevatedButton(
                        context,
                        "Add",
                            () {
                         int selectedChecks=0;
                         if(spDpTpProvider.spVal==true){
                           selectedChecks=1;
                         }
                         if(spDpTpProvider.dpVal==true){
                           selectedChecks=1;
                         }
                         if(spDpTpProvider.tpVal==true){
                           selectedChecks=1;
                         }
                          if (dropValue == null && widget.isClosedOnly==false) {
                            customSnackbar(context, "Please Select Game Type");
                          }else if(selectedChecks !=1 && widget.type=="spdptp") {
                            customSnackbar(context, "Please Select at least 1 motor");
                          }else if (singleDigitController.text.isEmpty) {
                            customSnackbar(context, "Please enter Digit");
                          } else if (pointController.text.isEmpty) {
                            customSnackbar(context, "Please enter points");
                          }else if (int.parse(
                              pointController.text.trim().toString()) <
                              1) {
                            customSnackbar(
                                context, "Please enter point greater than 0.");
                          } else {
                            WithdraFundGetModel walleddata =
                                Provider
                                    .of<WithdrawFundProvider>(context,
                                    listen: false)
                                    .withdrawGetWelletData;
                            int tempAmount = Provider
                                .of<ProfileProvider>(
                                context,
                                listen: false)
                                .amountTemporary;
                            String? maxPointCanbe = walleddata.maxBidAmount;
                            String? minReqPoint = walleddata.minBidAmount;
                            print("$tempAmount ===========am");
                            if (tempAmount <
                                int.parse(pointController.text.toString())) {
                              customSnackbar(context, "Insufficient amount .");
                            } else if (int.parse(maxPointCanbe ?? "0") <
                                int.parse(pointController.text.toString())) {
                              customSnackbar(context,
                                  "Maximum bid points can be $maxPointCanbe");
                            } else if (int.parse(minReqPoint ?? "0") >
                                int.parse(pointController.text.toString())) {
                              customSnackbar(context,
                                  "Minimum bid points must be $minReqPoint.");
                            } else {
                              if(widget.type=="spdptp"){
                                Map<String, dynamic> data =
                                {
                                  "env_type": Constants.envType,
                                  "points": pointController.text,
                                  "number": singleDigitController.text,
                                  "user_id": idUser,
                                  "sp_flag": spDpTpProvider.spVal == true
                                      ? 1
                                      : 0, /* 1 added , 0  not added */
                                  "dp_flag": spDpTpProvider.dpVal == true
                                      ? 1
                                      : 0, /* 1 added , 0  not added */
                                  "tp_flag": spDpTpProvider.tpVal == true ? 1 : 0,
                                };
                                log("$data ======================");
                                spDpTpProvider.spDpTpCombinationGetApiCall(
                                    context, data,type: "spdptp");
                              }else if(widget.type=="sp")
                              {
                                Map<String, dynamic> data =
                                {
                                "env_type":Constants.envType,
                                "points": pointController.text,
                                "number": singleDigitController.text,
                                "type":"8",
                                "user_id": idUser,
                                };
                                spDpTpProvider.spDpTpCombinationGetApiCall(
                                    context, data,type: "sp");

                              }else if(widget.type=="dp"){
                                Map<String, dynamic> data =
                                {
                                  "env_type":Constants.envType,
                                  "points": pointController.text,
                                  "number": singleDigitController.text,
                                  "type":"9",
                                  "user_id": idUser,
                                };
                                print("$data   === data");
                                spDpTpProvider.spDpTpCombinationGetApiCall(
                                    context, data,type: "dp");
                              }
                              singleDigitController.clear();
                              pointController.clear();
                            }
                          }
                        },
                        horizontalPadding: 10.0,
                        verticalPadding: 10.0,
                      ),
                    ),
                  );

                })
                 ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Table(
            columnWidths: const {
              // 0: FixedColumnWidth(110),
              // 1: FixedColumnWidth(110),
              // 2: FixedColumnWidth(110),
              // 3: FixedColumnWidth(110)
            },
            children: const [
              TableRow(children: [
                TableCell(
                    child: Center(
                        child: Text(
                  "Digit",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))),
                TableCell(
                    child: Center(
                        child: Text(
                  "Points",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))),

                TableCell(child: Center(child: Text(""))),
              ])
            ],
          ),
          Divider(
            color: greyClr,
            thickness: 2,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<SpDpTpProvider>(
                  builder: (context, spDpTpProvider, child) {
                    List<TableRow> tablerow = [];
                    List totalBids;
                    if(widget.type=="spdptp"){
                      totalBids = spDpTpProvider.spDpTpCominations.posssibleArray ?? [];
                    }else{
                      totalBids = spDpTpProvider.spDpCominations.posssibleArray ?? [];
                    }
                    List.generate(totalBids.length, (index) {
                      return tablerow.add(TableRow(
                          decoration:
                              BoxDecoration(color: clrWhite, boxShadow: [
                            BoxShadow(color: greyClr, blurRadius: 4),
                          ]),
                          children: [
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${totalBids[index].number}"),
                            ))),
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${totalBids[index].points}"),
                            ))),

                            TableCell(
                                child: InkWell(
                              onTap: () {
                                if(widget.type=="spdptp"){
                                  spDpTpProvider.removeCombination(context,index,"spdptp");
                                }else{
                                  spDpTpProvider.removeCombination(context,index,"sp");
                                }

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete_forever,
                                  color: clrRed,
                                ),
                              ),
                            )),
                          ]));
                    });
                    return Table(
                      columnWidths: const {
                        // 0: FixedColumnWidth(110),
                        // 1: FixedColumnWidth(110),
                        // 2: FixedColumnWidth(110),
                        // 3: FixedColumnWidth(110)
                      },
                      children: tablerow,
                    );
                  },
                )
              ],
            ),
          )),
          Divider(
            thickness: 2,
            color: primaryColor,
          ),
          Consumer<SpDpTpProvider>(
            builder: (context, spDpTpProvider, child) {
              int totalpoints = 0;
              // List<PosssibleArray>? totalBids = spDpTpProvider.spDpTpCominations.posssibleArray;
              List totalBids;
              if(widget.type=="spdptp"){
                totalBids = spDpTpProvider.spDpTpCominations.posssibleArray ?? [];
              }else{
                totalBids = spDpTpProvider.spDpCominations.posssibleArray ?? [];
              }
             totalBids ??= [];
              List.generate(totalBids.length, (index) {
                int points = int.parse(totalBids![index].points.toString());
                totalpoints += points;
              });
            // int currentAmt= Provider.of<ProfileProvider>(context,listen: false).amountTemporary;
            int currentAmt=ProfileProvider.amount;
             int amtWillBe= currentAmt-totalpoints;
              spDpTpProvider.changeTempAmt(context, amtWillBe);
              int? arraylen;
              if(widget.type=="spdptp"){
               arraylen=spDpTpProvider.spDpTpCominations.posssibleArray?.length;
              }else{
               arraylen=spDpTpProvider.spDpCominations.posssibleArray?.length;
              }

               if(arraylen != null && arraylen >0){return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text("Bids"),
                      Text("$arraylen"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Points"),
                      Text("$totalpoints"),
                    ],
                  ),
                  SizedBox(
                      width: 100,
                      child: customElevatedButton(
                        context,
                        "Submit",
                        () {
                          List newBidList = [];

                          for (int i = 0; totalBids!.length > i; i++) {
                            newBidList.add({
                              "digits": totalBids![i].number,
                              "closedigits":widget.type=="spdptp"? "":"",
                              "points": totalBids![i].points,
                              "session":widget.isClosedOnly==true?"Close":spDpTpProvider.gameType=="open"?"Open":"Close",
                              "pana": widget.type=="spdptp"?totalBids![i].pana:"",
                            });
                          }

                          Map newResult = {
                            "user_id": idUser,
                            "Gamename":widget.gameName, //widget.gameName,
                            "totalbit":arraylen,
                            "gameid": widget.gameId,
                            "pana": widget.type=="spdptp"?"SpDpTpMotors":widget.type=="sp"?"Single Pana":"Double Pana",
                            "bid_date": DateFormat("yyyy-MM-dd")
                                .format(DateTime.now()),
                            "session":widget.isClosedOnly==true?"Close":spDpTpProvider.gameType=="open"?"Open":"Close",
                            "result": newBidList
                          };
                        log("$newResult ===============api data will sended");
                            return popupWorkingMoneyReduction(context,
                                    () {
                                  Navigator.pop(context);
                                  Provider.of<MainGamesProvider>(context,
                                      listen: false)
                                      .mainGameStatusCheckApiCall(
                                    context,
                                    widget.gameId,
                                    bidData: newResult,
                                  );
                                },
                                isdiffer: true,
                                gameName: widget.gameName,
                                totalbid: arraylen,
                                bidamount: totalpoints,
                                data: newBidList);
                        },
                        verticalPadding: 3.0,
                      ))
                ],
              );}
               return const SizedBox();
            },

          )
        ],
      ),
    );
  }
}
