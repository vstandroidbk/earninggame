import 'package:earninggame/ui/biduis/gameresultui.dart';
import 'package:earninggame/ui/biduis/kingjackpotbidhistoryui.dart';
import 'package:earninggame/ui/components/drawer.dart';
import 'package:earninggame/ui/notification.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profileprovider.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import 'biduis/bidhistoryui.dart';
import 'biduis/kingjackpotresulthistory.dart';
import 'biduis/kingstarlinebidhistoryui.dart';
import 'biduis/kingstarlineresulthistoryui.dart';

class MybidsUi extends StatefulWidget {
  const MybidsUi({super.key});

  @override
  State<MybidsUi> createState() => _MybidsUiState();
}

class _MybidsUiState extends State<MybidsUi> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map> funds = [
    {
      "leadingimage": "assets/images/Activity History.png",
      "title": "Bid History",
      "Subtitle": "You can view your market bid history"
    },
    {
      "leadingimage": "assets/images/Update Left Rotation.png",
      "title": "Game Results",
      "Subtitle": "You can view your market result history"
    },
    {
      "leadingimage": "assets/images/Activity Historyy.png",
      "title": "King Starline Bid History",
      "Subtitle": "You can add your band details for withdrawls"
    },
    {
      "leadingimage": "assets/images/Update Left Rotation.png",
      "title": "King Starline Result History",
      "Subtitle": "You can view starline result"
    },
    {
      "leadingimage": "assets/images/Calendar.png",
      "title": "$galidisswar Bid History",
      "Subtitle": "You can view your jackpot bid history"
    },
    {
      "leadingimage": "assets/images/Check Document.png",
      "title": "$galidisswar result History ",
      "Subtitle": "You can view jackpot result"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: SizedBox(
                  width: 50,
                  height: 30,
                  child: Image.asset(
                    "assets/demoimages/menu-bar.png",
                  )),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
        title: const Text(
          "My Bids",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          SizedBox(
              width: 25, child: Image.asset("assets/demoimages/wallet.png")),
          const SizedBox(
            width: 5,
          ),
          Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
              return Center(
                child: Text(
                  "${profileProvider.amountTemporary}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              );
            },
          ),
          const SizedBox(
            width: 15,
          ),
          Center(
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return const NotificationUi();
                  }));
                },
                child: CircleAvatar(
                    maxRadius: 17,
                    backgroundColor: greyDarkClr,
                    child: Icon(
                      Icons.notifications_active_outlined,
                      color: primaryColor,
                    ))),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: funds.length,
              itemBuilder: (context, index) {
                Map data = funds[index];
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const BidHistoryUi();
                      }));
                    } else if (index == 1) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const GamesResultUi();
                      }));
                    } else if (index == 2) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const KingStarlineBidHistoryUi();
                      }));
                    } else if (index == 3) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const KingStarlineResultHistoryUi();
                      }));
                    } else if (index == 4) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const KingJackpotBidHistoryUi();
                      }));
                    } else if (index == 5) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const KingJackpotResultHistoryUi();
                      }));
                    }
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(color: clrWhite, boxShadow: [
                      BoxShadow(color: primaryColor, blurRadius: 2)
                    ]),
                    child: ListTile(
                      leading: SizedBox(
                        height: 35,
                        child:
                            Image.asset(data['leadingimage'], color: imgColr),
                      ),
                      title: Text(
                        "${data['title']}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      subtitle: Text("${data['Subtitle']}"),
                      trailing: CircleAvatar(
                          backgroundColor: clrBlackLight,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: primaryColor,
                          )),
                    ),
                  ),
                );
              })),
      drawer: const DrawerManueUi(),
    );
  }
}
