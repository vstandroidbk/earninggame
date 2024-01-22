import 'dart:developer';
import 'dart:ffi';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
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
  String? dropValue;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<SlGameProvider>(context, listen: false).removeAllBids();
      Provider.of<SlGameProvider>(context, listen: false)
          .setgameTypeChange(null);
      dropValue = Provider.of<SlGameProvider>(context, listen: false).gameType;
    });
  }

  String selectedFruit = '';
  @override
  Widget build(BuildContext context) {
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
                                      // optionsMaxHeight: 50,
                                      // displayStringForOption: _displayStringForOption,
                                      // optionsViewBuilder: (context,onSelect,options){
                                      //
                                      // },
                                      fieldViewBuilder: (context,
                                          singleDigitController,
                                          focus,
                                          onedtingComplete) {
                                        return SingleChildScrollView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          child: Column(
                                            children: [
                                              customInputField(
                                                  singleDigitController,
                                                  TextInputType.number,
                                                  textalign: true,
                                                  focus: focus,
                                                  onedtingConmplete:
                                                      onedtingComplete),
                                            ],
                                          ),
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
                const SizedBox(
                  height: 40,
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
                        if (widget.gameNo == 1) {
                          if (singleDigitController.text.isEmpty) {
                            customSnackbar(context, "Please enter Digit");
                          } else if (pointController.text.isEmpty) {
                            customSnackbar(context, "Please enter points");
                          } else {
                            Provider.of<SlGameProvider>(context, listen: false)
                                .addTotalBids(
                              digit: singleDigitController.text,
                              points: pointController.text,
                            );
                            singleDigitController.clear();
                            pointController.clear();
                          }
                        } else {
                          if (singleDigitController.text.isEmpty) {
                            customSnackbar(context, "Please enter valid Digit");
                          } else if (pointController.text.isEmpty) {
                            customSnackbar(context, "Please enter points");
                          } else {
                            Provider.of<SlGameProvider>(context, listen: false)
                                .addTotalBids(
                              digit: singleDigitController.text,
                              points: pointController.text,
                            );
                            
                            singleDigitController.clear();
                            pointController.clear();
                            setState(() {

                            });
                          }
                        }
                        // else if (widget.gameNo == 3) {
                        // } else if (widget.gameNo == 4) {
                        // } else {
                        //   customSnackbar(context, "Something went wrong");
                        // }
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
                                    .removeBids(totalBids[index]['digit']);
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
                                          totalbid: totalBids.length,
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
