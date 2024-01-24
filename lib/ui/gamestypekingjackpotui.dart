import 'package:earninggame/ui/gamesui/digitbasedjodigameui.dart';
import 'package:earninggame/ui/gamesui/gdgamescommonui.dart';
import 'package:earninggame/ui/gamesui/groupjodigameui.dart';
import 'package:earninggame/ui/gamesui/jodidigitbulkgameui.dart';
import 'package:earninggame/ui/gamesui/jodidigitgameui.dart';
import 'package:earninggame/ui/gamesui/singledigitgameui.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gamesui/slsingledigitgameui.dart';

class GamesTypeKingJackpotUi extends StatefulWidget {
  final String? gameName;
  final String? gameId;
  const GamesTypeKingJackpotUi({super.key,this.gameName,this.gameId});

  @override
  State<GamesTypeKingJackpotUi> createState() => _GamesTypeKingJackpotUiState();
}

class _GamesTypeKingJackpotUiState extends State<GamesTypeKingJackpotUi> {
  List<Map> gameTypes = [
    {"image": "assets/demoimages/dicetwo.png", "name": "Left Digit"},
    {"image": "assets/images/twoo.png", "name": "Jodi Digit"},
    {"image": "assets/images/groupj.png", "name": "Right Digit"},
    {"image": "assets/images/groupj.png", "name": "Right Digit"},
  ];
  int logNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: const Text("GALI DISAVAR GAME"),
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
                              if(index == 3){}else{
                                if(index == 0) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return GdGamesCommonUi(
                                    gameNo: 1,
                                    gameTitle: "Left Digit Game",
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                  );// JodiDigitGameUi();
                                }));

                              } else if (index == 1) {
                                  // Navigator.push(context,
                                  //     CupertinoPageRoute(builder: (context) {
                                  //   return const GroupJodiGameUi();
                                  // }));
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                        return GdGamesCommonUi(
                                          gameNo: 2,
                                          gameTitle: "Right Digit Game",
                                          gameName: widget.gameName,
                                          gameId: widget.gameId,
                                        );// JodiDigitGameUi();
                                      }));

                              } else if (index == 2) {
                                  // Navigator.push(context,
                                  //     CupertinoPageRoute(builder: (context) {
                                  //   return const JodiDigitBulkGameUi();
                                  // }));
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                        return GdGamesCommonUi(
                                          gameNo: 3,
                                          gameTitle: "Jodi Digit Game",
                                          gameName: widget.gameName,
                                          gameId: widget.gameId,
                                        );// JodiDigitGameUi();
                                      }));
                              } else {
                                // Navigator.push(context,
                                //     CupertinoPageRoute(builder: (context) {
                                //   return const SingleDigitGameUi();
                                // }));
                                  customSnackbar(context, "Something went wrong.");
                              }
                              }
                            },
                            child: Container(
                              color: clrWhite,
                              child:  index == 3 ?const SizedBox() :Column(
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
