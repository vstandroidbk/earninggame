import 'package:earninggame/ui/gamesui/choicespdptpgameui.dart';
import 'package:earninggame/ui/gamesui/digitbasedjodigameui.dart';
import 'package:earninggame/ui/gamesui/doublepanabulkgameui.dart';
import 'package:earninggame/ui/gamesui/doublepanagameui.dart';
import 'package:earninggame/ui/gamesui/dpmotorgameui.dart';
import 'package:earninggame/ui/gamesui/fullsangamgameui.dart';
import 'package:earninggame/ui/gamesui/groupjodigameui.dart';
import 'package:earninggame/ui/gamesui/halfsangramagameui.dart';
import 'package:earninggame/ui/gamesui/halfsangrambgameui.dart';
import 'package:earninggame/ui/gamesui/jodidigitbulkgameui.dart';
import 'package:earninggame/ui/gamesui/jodidigitgameui.dart';
import 'package:earninggame/ui/gamesui/oddevengameui.dart';
import 'package:earninggame/ui/gamesui/redbracketgameui.dart';
import 'package:earninggame/ui/gamesui/singledigitbulkui.dart';
import 'package:earninggame/ui/gamesui/singledigitgameui.dart';
import 'package:earninggame/ui/gamesui/singlepanagameui.dart';
import 'package:earninggame/ui/gamesui/spdptpgameui.dart';
import 'package:earninggame/ui/gamesui/spmotorgameui.dart';
import 'package:earninggame/ui/gamesui/triplepanagameui.dart';
import 'package:earninggame/ui/gamesui/twodigitspanelgameui.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gamesui/penalgroupgameui.dart';
import 'gamesui/singlepanabulkgameui.dart';

class GamesTypeUi extends StatefulWidget {
  const GamesTypeUi({super.key});

  @override
  State<GamesTypeUi> createState() => _GamesTypeUiState();
}

class _GamesTypeUiState extends State<GamesTypeUi> {
  List<Map> gameTypes = [
    {"image": "assets/images/dice.png", "name": "Single Digits"},
    {"image": "assets/images/dice.png", "name": "Single Digits Bulk"},
    {"image": "assets/images/twoo.png", "name": "Jodi Digits"},
    {"image": "assets/demoimages/dicetwo.png", "name": "jodi Digits Bulk"},
    {"image": "assets/images/dicee.png", "name": "Single Pana"},
    {"image": "assets/images/dicee.png", "name": "Single Pana Bulk"},
    {"image": "assets/images/dicepatti.png", "name": "Double Pana"},
    {"image": "assets/images/dicepatti.png", "name": "Double Pana Bulk"},
    {"image": "assets/images/triplepana.png", "name": "Triple Pana"},
    {"image": "assets/images/penalgroup.png", "name": "Penal Group"},
    {"image": "assets/images/dice.png", "name": "Red Brackets"},
    {"image": "assets/images/spdp.png", "name": "SP DP TP"},
    {"image": "assets/images/choice.png", "name": "Choice Pana SPDP"},
    {"image": "assets/images/sp.png", "name": "SP Motor"},
    {"image": "assets/images/dp.png", "name": "DP Motor"},
    {"image": "assets/demoimages/ludo.png", "name": "Group Jodi"},
    {"image": "assets/images/groupj.png", "name": "Digits Based Jodi"},
    {"image": "assets/images/oddeven.png", "name": "oddEven"},
    {"image": "assets/images/twoo.png", "name": "Two Digits Panel"},
    {"image": "assets/images/halfa.png", "name": "Half Sangam A"},
    {"image": "assets/images/halfb.png", "name": "Half Sangam B"},
    {"image": "assets/images/full.png", "name": "Full Sangam"},
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
        title: const Text("TIME BAZAR OPEN GAME"),
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
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1),
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
                                  return const SingleDigitGameUi();
                                }));
                              } else if (index == 1) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const SingleDigitBulkUi();
                                }));
                              } else if (index == 2) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const JodiDigitGameUi();
                                }));
                              } else if (index == 3) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const JodiDigitBulkGameUi();
                                }));
                              } else if (index == 4) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const SinglePanaGameUi();
                                }));
                              } else if (index == 5) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const SinglePanaBulkGameUi();
                                }));
                              } else if (index == 6) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const DoublePanaGameUi();
                                }));
                              } else if (index == 7) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const DoublePanaBulkGameUi();
                                }));
                              } else if (index == 8) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const TriplePanaGameUi();
                                }));
                              } else if (index == 9) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const PenalGroupGameUi();
                                }));
                              } else if (index == 10) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const RedBracketsGameUi();
                                }));
                              } else if (index == 11) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const SpDpTpGameUi();
                                }));
                              } else if (index == 12) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const ChoiceSpDpTpGameUi();
                                }));
                              } else if (index == 13) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const SpMotorGameUi();
                                }));
                              } else if (index == 14) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const DpMotorGameUi();
                                }));
                              } else if (index == 15) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const GroupJodiGameUi();
                                }));
                              } else if (index == 16) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const DigitBasedJodiGameUi();
                                }));
                              } else if (index == 17) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const OddEvenGameUi();
                                }));
                              } else if (index == 18) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const TwoDigitsPanelGameUi();
                                }));
                              } else if (index == 19) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const HalfSangramAGameUi();
                                }));
                              } else if (index == 20) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const HalfSangramBGameUi();
                                }));
                              } else if (index == 21) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const FullSangamGameUi();
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
