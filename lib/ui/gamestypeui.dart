import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'gamesui/dpmotorgameui.dart';
import 'gamesui/fullsangamgameui.dart';
import 'gamesui/halfsangrambgameui.dart';
import 'gamesui/maingamecommonui.dart';
import 'gamesui/singledigitgameui.dart';
import 'gamesui/spdptpgameui.dart';
import 'gamesui/spmotorgameui.dart';

class GamesTypeUi extends StatefulWidget {
  final String? gameName;
  final String? gameId;
  final String? closeTime;
  const GamesTypeUi({super.key, required this.gameName, required this.gameId,required this.closeTime});

  @override
  State<GamesTypeUi> createState() => _GamesTypeUiState();
}

class _GamesTypeUiState extends State<GamesTypeUi> {
  List<Map> gameTypes = [
    {"image": "assets/images/dice.png", "name": "Single Digits"},
    // {"image": "assets/images/dice.png", "name": "Single Digits Bulk"},
    {"image": "assets/images/twoo.png", "name": "Jodi Digits"},
    // {"image": "assets/demoimages/dicetwo.png", "name": "jodi Digits Bulk"},
    {"image": "assets/images/dicee.png", "name": "Single Pana"},
    // {"image": "assets/images/dicee.png", "name": "Single Pana Bulk"},
    {"image": "assets/images/dicepatti.png", "name": "Double Pana"},
    // {"image": "assets/images/dicepatti.png", "name": "Double Pana Bulk"},
    {"image": "assets/images/triplepana.png", "name": "Triple Pana"},
    // {"image": "assets/images/penalgroup.png", "name": "Penal Group"},
    // {"image": "assets/images/dice.png", "name": "Red Brackets"},
    {"image": "assets/images/spdp.png", "name": "SP DP TP"},
    // {"image": "assets/images/choice.png", "name": "Choice Pana SPDP"},
    {"image": "assets/images/sp.png", "name": "SP Motor"},
    {"image": "assets/images/dp.png", "name": "DP Motor"},
    // {"image": "assets/demoimages/ludo.png", "name": "Group Jodi"},
    // {"image": "assets/images/groupj.png", "name": "Digits Based Jodi"},
    // {"image": "assets/images/oddeven.png", "name": "oddEven"},
    // {"image": "assets/images/twoo.png", "name": "Two Digits Panel"},
    // {"image": "assets/images/halfa.png", "name": "Half Sangam A"},
    {"image": "assets/images/halfb.png", "name": "Half Sangam"},
    {"image": "assets/images/full.png", "name": "Full Sangam"},
  ];
  bool isClosedOnly=false;
  @override
  void initState() {
    super.initState();
    String onlyTime= time12to24Format(widget.closeTime.toString());
    String todayDate=DateFormat("yyyy-MM-dd").format(DateTime.parse(DateTime.now().toString()));
    String closeFulTime =DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.parse("${todayDate.trim()} ${onlyTime.trim()}"));
    DateTime closeDatetime=DateTime.parse(closeFulTime);
    if(closeDatetime.isAfter(DateTime.now()) ){
      isClosedOnly=false;
    }else{
      isClosedOnly=true;

    }
  }
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
                                  return MainGameCommonUi(
                                    gameTitle: 'Single Digit Game',
                                    gameNo: 1,
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                    isClosedOnly: isClosedOnly,
                                  );
                                }));
                              } else if (index == 1) {
                               if( isClosedOnly==true){
                                 customSnackbar(context, "Session is closed for this game.");
                               }else{
                                 Navigator.push(context,
                                     CupertinoPageRoute(builder: (context) {
                                       return MainGameCommonUi(
                                         gameTitle: 'Jodi Digit Game',
                                         gameNo: 2,
                                         gameName: widget.gameName,
                                         gameId: widget.gameId,
                                         isClosedOnly: isClosedOnly,
                                       );
                                     }));
                              }

                              } else if (index == 2) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return MainGameCommonUi(
                                    gameTitle: 'Single Pana Game',
                                    gameNo: 3,
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                    isClosedOnly: isClosedOnly,
                                  );
                                }));
                              } else if (index == 3) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return MainGameCommonUi(
                                    gameTitle: 'Double Pana Game',
                                    gameNo: 4,
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                    isClosedOnly: isClosedOnly,
                                  );
                                }));
                              } else if (index == 4) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return MainGameCommonUi(
                                    gameTitle: 'Triple Pana Game',
                                    gameNo: 5,
                                    gameName: widget.gameName,
                                    gameId: widget.gameId,
                                    isClosedOnly: isClosedOnly,
                                  );
                                }));
                              } else if (index == 5) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return SpDpTpGameUi(gameId:  widget.gameId,gameName:  widget.gameName,type:"spdptp",
                                    isClosedOnly: isClosedOnly,);
                                }));
                              } else if (index == 6) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  // return const SpMotorGameUi();
                                  return SpDpTpGameUi(gameId:  widget.gameId,gameName:  widget.gameName,type:"sp",
                                    isClosedOnly: isClosedOnly,);
                                }));
                              } else if (index == 7) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  // return const DpMotorGameUi();
                                  return SpDpTpGameUi(gameId:  widget.gameId,gameName:  widget.gameName,type:"dp",
                                    isClosedOnly: isClosedOnly,);
                                }));
                              } else if (index == 8) {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return HalfSangramBGameUi(gameId:  widget.gameId,gameName:  widget.gameName,sangram:"half",
                                    isClosedonly: isClosedOnly,);
                                }));
                              } else if (index == 9) {
                                if(isClosedOnly==true){
                                  customSnackbar(context, "Session is closed for this game.");
                                }else{
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                        return   HalfSangramBGameUi(gameId:  widget.gameId,gameName:  widget.gameName,sangram:"full",
                                          isClosedonly: isClosedOnly,);
                                      }));
                                }

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
