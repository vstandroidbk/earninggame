import 'package:earninggame/ui/gamesui/digitbasedjodigameui.dart';
import 'package:earninggame/ui/gamesui/groupjodigameui.dart';
import 'package:earninggame/ui/gamesui/jodidigitbulkgameui.dart';
import 'package:earninggame/ui/gamesui/jodidigitgameui.dart';
import 'package:earninggame/ui/gamesui/singledigitgameui.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamesTypeKingJackpotUi extends StatefulWidget {
  const GamesTypeKingJackpotUi({super.key});

  @override
  State<GamesTypeKingJackpotUi> createState() => _GamesTypeKingJackpotUiState();
}

class _GamesTypeKingJackpotUiState extends State<GamesTypeKingJackpotUi> {
  List<Map> gameTypes = [
    {"image": "assets/images/twoo.png", "name": "Jodi Digits"},
    {"image": "assets/demoimages/dicetwo.png", "name": "jodi Digits Bulk"},
    {"image": "assets/demoimages/ludo.png", "name": "Group Jodi"},
    {"image": "assets/images/groupj.png", "name": "Digits Based Jodi"},
  ];
  int logNum = 0;
  @override
  Widget build(BuildContext context) {
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
                                  return const JodiDigitGameUi();
                                }));
                              } else if (index == 1) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const JodiDigitBulkGameUi();
                                }));
                              } else if (index == 2) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const GroupJodiGameUi();
                                }));
                              } else if (index == 3) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const DigitBasedJodiGameUi();
                                }));
                              } else {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const SingleDigitGameUi();
                                }));
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
