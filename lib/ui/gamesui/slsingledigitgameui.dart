import 'dart:developer';
import 'dart:ffi';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/withdrafundgetmodel.dart';
import '../../providers/fundprovider/withdrawfundprovider.dart';
import '../../providers/gameuiproviders/slgamesprovider.dart';
import '../../providers/profileprovider.dart';
import '../../providers/starlinegamesprovider.dart';
import '../../utils/colors.dart';

class SlSingleDigitGameUi extends StatefulWidget {
  final int? gameNo;
  final String? gameTitle;
  final String? gameName;
  final String? gameId;
  const SlSingleDigitGameUi(
      {super.key,
      required this.gameTitle,
      required this.gameNo,
      this.gameName,
      this.gameId});

  @override
  State<SlSingleDigitGameUi> createState() => _SlSingleDigitGameUiState();
}

class _SlSingleDigitGameUiState extends State<SlSingleDigitGameUi> {
  TextEditingController singleDigitController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  TextEditingValue texEditVal = TextEditingValue();
  String? dropValue;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<SlGameProvider>(context, listen: false).removeAllBids();
      Provider.of<SlGameProvider>(context, listen: false)
          .setgameTypeChange(null);
      dropValue = Provider.of<SlGameProvider>(context, listen: false).gameType;
      Provider.of<WithdrawFundProvider>(context, listen: false)
          .withdrawGetWalletApiCall(context);
      Provider.of<ProfileProvider>(context, listen: false)
          .profileDataApiCall(context);
    });
  }

  bool clearDigit = false;
  @override
  Widget build(BuildContext context) {
    fun() {
      singleDigitController.clear();
      setState(() {});
    }

    return Scaffold(
      appBar: appBarComman(Text(widget.gameTitle.toString())),
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
                      "Enter Single Digit",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                          child: widget.gameNo == 1
                              ? customInputFieldPin(singleDigitController,
                                  TextInputType.number, context,
                                  maxlength: 1, textalign: true)
                              : Container(
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 15),
                                  decoration:
                                      BoxDecoration(color: greyLightClr),
                                  child: SizedBox(
                                    height: 50,
                                    child: Autocomplete(
                                      fieldViewBuilder: (context,
                                          singleDigitController,
                                          focus,
                                          onedtingComplete) {
                                        // singleDigitController.text='';
                                        print(
                                            "=====me =  =${singleDigitController.text}=======");
                                        return SingleChildScrollView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          child: Column(children: [
                                            Builder(builder: (context) {
                                              if (clearDigit == true) {
                                                if (singleDigitController
                                                        .text.isEmpty ==
                                                    false) {
                                                  singleDigitController.text =
                                                      "";
                                                }
                                              } else {
                                                clearDigit = false;
                                              }

                                              return customInputField(
                                                  singleDigitController,
                                                  TextInputType.number,
                                                  textalign: true,
                                                  focus: focus,
                                                  onedtingConmplete:
                                                      onedtingComplete);
                                            }),
                                          ]),
                                        );
                                      },
                                      optionsBuilder: widget.gameNo == 2
                                          ? (TextEditingValue
                                              textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<
                                                    GameArray>.empty();
                                              }
                                              return GameArray.singlePanaArray
                                                  .where((String option) {
                                                return option
                                                    .toString()
                                                    .contains(textEditingValue
                                                        .text
                                                        .toLowerCase());
                                              });
                                            }
                                          : widget.gameNo == 3
                                              ? (TextEditingValue
                                                  textEditingValue) {
                                                  if (textEditingValue.text ==
                                                      '') {
                                                    return const Iterable<
                                                        GameArray>.empty();
                                                  }
                                                  return GameArray
                                                      .doublePanaArray
                                                      .where((String option) {
                                                    return option
                                                        .toString()
                                                        .contains(
                                                            textEditingValue
                                                                .text
                                                                .toLowerCase());
                                                  });
                                                }
                                              : (TextEditingValue
                                                  textEditingValue) {
                                                  if (textEditingValue.text ==
                                                      '') {
                                                    return const Iterable<
                                                        GameArray>.empty();
                                                  }
                                                  return GameArray
                                                      .triplePanaArray
                                                      .where((String option) {
                                                    return option
                                                        .toString()
                                                        .contains(
                                                            textEditingValue
                                                                .text
                                                                .toLowerCase());
                                                  });
                                                },
                                      // },
                                      // fieldViewBuilder:

                                      onSelected: (Object Game) {
                                        setState(() {
                                          singleDigitController.text =
                                              Game.toString();
                                          clearDigit = false;
                                          print(
                                              "selected==========${this.singleDigitController.text}===");
                                        });
                                      },
                                    ),
                                  ),
                                )
                          // : widget.gameNo == 3
                          //
                          //     : Text("4"),
                          ),
                    )
                  ],
                ),
                widget.gameNo != 1
                    ? const SizedBox(
                        height: 30,
                      )
                    : const SizedBox(),
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
                        if (widget.gameNo == 1) {
                          if (singleDigitController.text.isEmpty) {
                            customSnackbar(context, "Please enter Digit");
                          } else if (pointController.text.isEmpty) {
                            customSnackbar(context, "Please enter points");
                          } else if (pointController.text.trim().toString() ==
                              "0") {
                            customSnackbar(
                                context, "Please enter point greater than 0.");
                          } else {
                            WithdraFundGetModel walleddata =
                                Provider.of<WithdrawFundProvider>(context,
                                        listen: false)
                                    .withdrawGetWelletData;
                            int tempAmount = Provider.of<ProfileProvider>(
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
                              Provider.of<SlGameProvider>(context,
                                      listen: false)
                                  .addTotalBids(
                                context,
                                digit: singleDigitController.text,
                                points: pointController.text,
                              );
                              singleDigitController.clear();
                              pointController.clear();
                              setState(() {});
                            }
                          }
                        } else {
                          print(
                              "${singleDigitController.text} =======else==========");
                          if (singleDigitController.text.isEmpty) {
                            customSnackbar(context, "Please enter valid Digit");
                          } else if (pointController.text.isEmpty) {
                            customSnackbar(context, "Please enter points");
                          } else if (pointController.text.trim().toString() ==
                              "0") {
                            customSnackbar(
                                context, "Please enter point greater than 0.");
                          } else {
                            WithdraFundGetModel walleddata =
                                Provider.of<WithdrawFundProvider>(context,
                                        listen: false)
                                    .withdrawGetWelletData;
                            int tempAmount = Provider.of<ProfileProvider>(
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
                              setState(() {
                                clearDigit = true;
                              });
                              Provider.of<SlGameProvider>(context,
                                      listen: false)
                                  .addTotalBids(
                                context,
                                digit: singleDigitController.text,
                                points: pointController.text,
                              );
                              print(
                                  "values========== ${this.singleDigitController}");
                              singleDigitController.clear();
                              pointController.clear();
                              setState(() {});
                            }
                          }
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
          Table(
            columnWidths: const {},
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
                Consumer<SlGameProvider>(
                  builder: (context, singleDigitGameProvider, child) {
                    List<TableRow> tablerow = [];
                    List<Map> totalBids = singleDigitGameProvider.totalBids;
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
                              child: Text("${totalBids[index]['digit']}"),
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
                                Provider.of<SlGameProvider>(context,
                                        listen: false)
                                    .removeBids(
                                        totalBids[index]['digit'], context);
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
                      columnWidths: const {},
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
          Consumer<SlGameProvider>(
            builder: (context, slGameProvider, child) {
              int totalpoints = 0;
              List<Map> totalBids = slGameProvider.totalBids;
              List.generate(totalBids.length, (index) {
                int points = int.parse(totalBids[index]['points'].toString());
                totalpoints += points;
              });
              return totalBids.isEmpty
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text("Bids"),
                            Text("${slGameProvider.totalBids.length}"),
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
                                        "digits": totalBids[i]['digit'],
                                        "closedigits": "",
                                        "points": totalBids[i]['points'],
                                        "session": 'Open'
                                      });
                                    }

                                    Map newResult = {
                                      "user_id": idUser,
                                      "Gamename": widget.gameName,
                                      "totalbit":
                                          slGameProvider.totalBids.length,
                                      "gameid": widget.gameId,
                                      "pana": widget.gameNo == 1
                                          ? "Single Digit"
                                          : widget.gameNo == 2
                                              ? "Single Pana"
                                              : widget.gameNo == 3
                                                  ? 'Double Pana'
                                                  : 'Triple Pana',
                                      "bid_date": DateFormat("yyyy-MM-dd")
                                          .format(DateTime.now()),
                                      "session": "Open",
                                      "result": newBidList
                                    };
                                    if (int.parse(
                                            "${profileProvider.profileModelData.profile?[0].walletBalance}") >=
                                        totalpoints) {
                                      return popupWorkingMoneyReduction(context,
                                          () {
                                        Navigator.pop(context);
                                        Provider.of<StarlineGamesProvider>(
                                                context,
                                                listen: false)
                                            .stGameStatusCheckApiCall(
                                          context,
                                          widget.gameId,
                                          bidData: newResult,
                                        );
                                      },
                                          totalbid: totalBids.length,
                                          bidamount: totalpoints,
                                          data: totalBids);
                                    } else {
                                      return popupWorkingMoneyReduction(context,
                                          () {
                                        Navigator.pop(context);
                                        popUpInsufficientBalance(context);
                                      },
                                          data: totalBids,
                                          totalbid: totalBids.length ?? 0,
                                          bidamount: totalpoints);
                                    }
                                  },
                                  verticalPadding: 3.0,
                                ));
                          },
                        )
                      ],
                    );
            },
          )
        ],
      ),
    );
  }
}
