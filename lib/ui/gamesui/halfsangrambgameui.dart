import 'package:earninggame/providers/gameuiproviders/halfsangramprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/withdrafundgetmodel.dart';
import '../../providers/fundprovider/withdrawfundprovider.dart';
import '../../providers/gameuiproviders/maingamesprovider.dart';
import '../../providers/profileprovider.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';
import '../../utils/constants.dart';

class HalfSangramBGameUi extends StatefulWidget {
  final String? gameName;
  final String? gameId;
  final String? sangram;
  const HalfSangramBGameUi({super.key,required this.gameName,required this.gameId,required this.sangram});

  @override
  State<HalfSangramBGameUi> createState() => _HalfSangramBGameUiState();
}

class _HalfSangramBGameUiState extends State<HalfSangramBGameUi> {
  TextEditingController openDigitController = TextEditingController();
  TextEditingController closePanaController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<WithdrawFundProvider>(context, listen: false)
        .withdrawGetWalletApiCall(context);
    Provider.of<ProfileProvider>(context, listen: false)
        .profileDataApiCall(context);
    // Provider.of<SinglePanaGameProvider>(context, listen: false)
    //     .removeAllBids();
    Provider.of<HalfSangram>(context, listen: false).clearval();
  }

  bool clearDigit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComman( Text(widget.sangram=='full'?"Full Sangram Game" : "Half Sangram Game")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: widget.sangram=='full'?false:true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Select Game Type",
                        style: TextStyle(fontSize: 16),
                      ),
                      Consumer<HalfSangram>(
                          builder: (context, halfSangram, child) {
                        return SizedBox(
                          width: 190,
                          child: Visibility(
                            visible: halfSangram.totalBids.length >0?false:true,
                            replacement: Container(color: greyLightClr,height: 50,
                                                   child: Align(child: Text("  ${halfSangram.gameType}"
                                                                        ,style: TextStyle(fontSize: 18),),alignment: Alignment.centerLeft,),),
                            child: Container(
                              child: customDropDownMenueButton(halfSangram.gameType,
                                  (value) {
                                int  totalbids=  Provider.of<HalfSangram>(context, listen: false)
                                    .totalBids.length;
                                 Provider.of<HalfSangram>(context, listen: false)
                                     .setgameTypeChange(value);
                                 openDigitController.clear();
                                 closePanaController.clear();
                                 pointController.clear();
                                 clearDigit = true;
                                 print("${halfSangram.gameType} ================");

                              }//,isdisabled:
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<HalfSangram>(builder: (context, halfSangram, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.sangram=='full'?"Enter Open Pana" : halfSangram.gameType == "open"
                            ? "Enter Open Digit"
                            : "Enter Open Pana",
                        style:const TextStyle(fontSize: 16),
                      ),
                      Visibility(
                        visible: widget.sangram=='full'? true: halfSangram.gameType == "open" ? false : true,
                        replacement: SizedBox(
                          width: 190,
                          child: Container(
                            child: customInputFieldPin(openDigitController,
                                TextInputType.number, context,
                                maxlength: 1, textalign: true),
                          ),
                        ),
                        child: SizedBox(
                          width: 190,
                          child: Container(
                              child: Container(
                            decoration: BoxDecoration(color: greyLightClr),
                            child: SizedBox(
                              height: 50,
                              child: Autocomplete(
                                fieldViewBuilder: (context, openDigitController,
                                    focus, onedtingComplete) {
                                  print(
                                      "=====me =  =${openDigitController.text}=======");
                                  return SingleChildScrollView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    child: Column(children: [
                                      Builder(builder: (context) {
                                        if (clearDigit == true) {
                                          if (openDigitController
                                                  .text.isEmpty ==
                                              false) {
                                            openDigitController.text = "";
                                          }
                                        } else {
                                          clearDigit = false;
                                        }

                                        return customInputField(
                                            openDigitController,
                                            TextInputType.number,
                                            textalign: true,
                                            focus: focus,
                                            onedtingConmplete:
                                                onedtingComplete);
                                      }),
                                    ]),
                                  );
                                },
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<GameArray>.empty();
                                  }
                                  return GameArray.halfSangamArray
                                      .where((String option) {
                                    return option.toString().contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                // },
                                // fieldViewBuilder:

                                onSelected: (Object Game) {
                                  setState(() {
                                    openDigitController.text = Game.toString();
                                    clearDigit = false;

                                  });
                                },
                              ),
                            ),
                          )),
                        ),
                      )
                    ],
                  );
                }),
                 SizedBox(
                  height:widget.sangram=='full'? 30:0,
                ),
                 SizedBox(
                  height:widget.sangram=='full'?0: 20,
                ),
                Consumer<HalfSangram>(builder: (context, halfSangram, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.sangram=='full'?"Enter Close Pana" :halfSangram.gameType == "open"
                            ? "Enter Close Pana"
                            : "Enter Close Digit",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Visibility(
                        visible: halfSangram.gameType == "open" ? true : false,
                        replacement: SizedBox(
                          width: 190,
                          child: Container(
                            child: customInputFieldPin(closePanaController,
                                TextInputType.number, context,
                                maxlength: 1, textalign: true),
                          ),
                        ),
                        child: SizedBox(
                          width: 190,
                          child: Container(
                              child: Container(
                            decoration: BoxDecoration(color: greyLightClr),
                            child: SizedBox(
                              height: 50,
                              child: Autocomplete(
                                fieldViewBuilder: (context, closePanaController,
                                    focus, onedtingComplete) {
                                  print(
                                      "=====me =  =${closePanaController.text}=======");
                                  return SingleChildScrollView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    child: Column(children: [
                                      Builder(builder: (context) {
                                        if (clearDigit == true) {
                                          if (closePanaController
                                                  .text.isEmpty ==
                                              false) {
                                            closePanaController.text = "";
                                          }
                                        } else {
                                          clearDigit = false;
                                        }

                                        return customInputField(
                                            closePanaController,
                                            TextInputType.number,
                                            textalign: true,
                                            focus: focus,
                                            onedtingConmplete:
                                                onedtingComplete);
                                      }),
                                    ]),
                                  );
                                },
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<GameArray>.empty();
                                  }
                                  return GameArray.halfSangamArray
                                      .where((String option) {
                                    return option.toString().contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                // },
                                // fieldViewBuilder:

                                onSelected: (Object Game) {
                                  setState(() {
                                    closePanaController.text = Game.toString();
                                    clearDigit = false;
                                    print(
                                        "selected==========${this.closePanaController.text}===");
                                  });
                                },
                              ),
                            ),
                          )
                              // : widget.gameNo == 3
                              //
                              //     : Text("4"),
                              ),
                        ),
                      )
                    ],
                  );
                }),
                const SizedBox(
                  height: 20,
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
                        child: customInputFieldPin(
                            pointController, TextInputType.number, context,
                            maxlength: 6, textalign: true),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 190,
                    child: customElevatedButton(
                      context,
                      "Add",
                      () {
                        if (openDigitController.text.isEmpty) {
                          customSnackbar(context, "Please enter Open Digit");
                        } else if (closePanaController.text.isEmpty) {
                          customSnackbar(context, "Please enter Close Pana");
                        } else if (pointController.text.isEmpty) {
                          customSnackbar(context, "Please enter points");
                        } else if (int.parse(
                                pointController.text.trim().toString()) <
                            1) {
                          customSnackbar(
                              context, "Please enter point greater than 0.");
                        } else {
                          WithdraFundGetModel walleddata =
                              Provider.of<WithdrawFundProvider>(context,
                                      listen: false)
                                  .withdrawGetWelletData;
                          int tempAmount = Provider.of<ProfileProvider>(context,
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
                            setState(() {
                              clearDigit = true;
                            });
                            Provider.of<HalfSangram>(context, listen: false)
                                .addTotalBids(
                              context,
                              open: openDigitController.text,
                              close: closePanaController.text,
                              points: pointController.text,
                            );
                            openDigitController.clear();
                            closePanaController.clear();
                            pointController.clear();
                            setState(() {});
                          }
                          // Provider.of<SinglePanaGameProvider>(context,
                          //         listen: false)
                          //     .addTotalBids(
                          //         "${openDigitController.text}-${closePanaController.text}",
                          //         pointController.text,
                          //         dropValue);
                        }
                      },
                      horizontalPadding: 10.0,
                      verticalPadding: 10.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<HalfSangram>(builder: (context, halfSangram, child) {
            return Table(
              columnWidths: const {
                // 0: FixedColumnWidth(110),
                // 1: FixedColumnWidth(110),
                // 2: FixedColumnWidth(110),
                // 3: FixedColumnWidth(110)
              },
              children:  [
                TableRow(children: [
                  TableCell(
                      child: Center(
                          child: Text(
                            widget.sangram=='full'?"Open Pana" :halfSangram.gameType=="open"?"Open Digit":"Open Pana",
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ))),
                  TableCell(
                      child: Center(
                          child: Text(
                            halfSangram.gameType=="open"?"Close Pana":"Close Digit",
                    style:const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ))),
                 const TableCell(
                      child: Center(
                          child: Text(
                    "Points",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ))),
                  TableCell(child: Center(child: Text(""))),
                ])
              ],
            );
          }),
          Divider(
            color: greyClr,
            thickness: 2,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<HalfSangram>(
                  builder: (context, halfSangram, child) {
                    List<TableRow> tablerow = [];
                    List<Map> totalBids = halfSangram.totalBids;
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
                              child: Text("${totalBids[index]['open']}"),
                            ))),
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${totalBids[index]['close']}"),
                            ))),
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${totalBids[index]['points']}"),
                            ))),

                            TableCell(
                                child: InkWell(
                              onTap: () {
                                Provider.of<HalfSangram>(context,
                                        listen: false)
                                    .removeBids(index,context);
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
          Consumer<HalfSangram>(
            builder: (context, halfSangram, child) {
              int totalpoints = 0;
              List<Map> totalBids = halfSangram.totalBids;
              List.generate(totalBids.length, (index) {
                int points = int.parse(totalBids[index]['points'].toString());
                totalpoints += points;
              });
              return halfSangram.totalBids.length > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text("Bids"),
                            Text("${halfSangram.totalBids.length}"),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Points"),
                            Text("$totalpoints"),
                          ],
                        ),
                        Consumer<ProfileProvider>(
                          builder: (context, profileProvider, child) {
                            return SizedBox(
                                width: 100,
                                child: customElevatedButton(
                                  context,
                                  "Submit",
                                      () {
                                    List newBidList = [];

                                    for (int i = 0; totalBids.length > i; i++) {
                                      newBidList.add({
                                        "digits": totalBids[i]['open'],
                                        "closedigits": totalBids[i]['close'],
                                        "points": totalBids[i]['points'],
                                        "session": halfSangram.gameType=="open"?"Open":"Close"
                                      });
                                    }

                                    Map newResult = {
                                      "user_id": idUser,
                                      "Gamename": widget.gameName,
                                      "totalbit":
                                      halfSangram.totalBids.length,
                                      "gameid": widget.gameId,
                                      "pana": widget.sangram=='full'?"Full Sangam" :"Half Sangam",
                                      "bid_date": DateFormat("yyyy-MM-dd")
                                          .format(DateTime.now()),
                                      "session":halfSangram.gameType=="open"?"Open":"Close",
                                      "result": newBidList
                                    };
                                    if (int.parse(
                                        "${profileProvider.profileModelData.profile?[0].walletBalance}") >=
                                        totalpoints) {
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
                                          gameName: widget.gameName,
                                          totalbid: totalBids.length,
                                          bidamount: totalpoints,
                                          isHalfSang:true,
                                          data: totalBids);
                                    } else {
                                      return popupWorkingMoneyReduction(context,
                                              () {
                                            Navigator.pop(context);
                                            popUpInsufficientBalance(context);
                                          },
                                          data: totalBids,
                                          totalbid: totalBids.length ?? 0,
                                          bidamount: totalpoints,
                                          gameName: widget.gameName);
                                    }
                                  },
                                  verticalPadding: 3.0,
                                ));
                          },
                        )
                      ],
                    )
                  : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
