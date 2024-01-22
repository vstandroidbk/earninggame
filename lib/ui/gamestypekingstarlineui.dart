import 'package:earninggame/ui/gamesui/doublepanagameui.dart';
import 'package:earninggame/ui/gamesui/singledigitgameui.dart';
import 'package:earninggame/ui/gamesui/singlepanagameui.dart';
import 'package:earninggame/ui/gamesui/slsingledigitgameui.dart';
import 'package:earninggame/ui/gamesui/triplepanagameui.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamesTypeKingStarlineUi extends StatefulWidget {
  final String? gameName;
  final String? gameId;
  const GamesTypeKingStarlineUi({super.key, this.gameName, this.gameId});

  @override
  State<GamesTypeKingStarlineUi> createState() =>
      _GamesTypeKingStarlineUiState();
}

class _GamesTypeKingStarlineUiState extends State<GamesTypeKingStarlineUi> {
  List<Map> gameTypes = [
    {"image": "assets/images/dice.png", "name": "Single Digits"},
    // {"image": "assets/images/dice.png", "name": "Single Digits Bulk"},
    {"image": "assets/images/dicee.png", "name": "Single Pana"},
    // {"image": "assets/images/dicee.png", "name": "Single Pana Bulk"},
    {"image": "assets/images/dicepatti.png", "name": "Double Pana"},
    // {"image": "assets/images/dicepatti.png", "name": "Double Pana Bulk"},
    {"image": "assets/images/triplepana.png", "name": "Triple Pana"},
    // {"image": "assets/images/penalgroup.png", "name": "Penal Group"},
    // {"image": "assets/images/spdp.png", "name": "SP DP TP"},
    // {"image": "assets/images/choice.png", "name": "Choice Pana SPDP"},
    // {"image": "assets/images/sp.png", "name": "SP Motor"},
    // {"image": "assets/images/dp.png", "name": "DP Motor"},
    // {"image": "assets/images/oddeven.png", "name": "oddEven"},
    // {"image": "assets/images/twoo.png", "name": "Two Digits Panel"},
  ];
  int logNum = 0;
  @override
  Widget build(BuildContext context) {
    logNum = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: const Text("KING JACKPOT GAME"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                color: primaryColor,
                child: Column(
                  children: [
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2),
                        itemCount: gameTypes.length,
                        itemBuilder: (context, index) {
                          Map data = gameTypes[index];

                          if (logNum <= 3) {
                            logNum += 1;
                          } else {
                            logNum = 1;
                          }
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return SlSingleDigitGameUi(
                                    gameNo: 1,
                                    gameTitle: "Single Digit Game",
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                  );
                                }));
                              } else if (index == 1) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return SlSingleDigitGameUi(
                                    gameNo: 2,
                                    gameTitle: "Single Pana Game",
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                  ); //const SinglePanaGameUi();
                                }));
                              } else if (index == 2) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return SlSingleDigitGameUi(
                                    gameNo: 3,
                                    gameTitle: "Double Pana Game",
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                  ); //const DoublePanaGameUi();
                                }));
                              } else if (index == 3) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return SlSingleDigitGameUi(
                                    gameNo: 4,
                                    gameTitle: "Triple Pana Game",
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                  ); // const TriplePanaGameUi();
                                }));
                              } else {
                                customSnackbar(
                                    context, "Something went wrong.");
                                // Navigator.push(context,
                                //     CupertinoPageRoute(builder: (context) {
                                //   return const SingleDigitGameUi();
                                // }));
                              }
                            },
                            child: Container(
                              color: clrWhite,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 13),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: primaryColor,
                                    ),
                                    child: Container(
                                      // height: 60,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: logNum == 2 || logNum == 3
                                              ? clrBlackLight
                                              : clrWhite,
                                          boxShadow: [
                                            BoxShadow(
                                              color: greyClr,
                                              blurRadius: 5,
                                            )
                                          ]),
                                      child: SizedBox(
                                        height: 60,
                                        child: Image(
                                          image: AssetImage(data["image"]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data['name'],
                                    style: const TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
