import 'package:earninggame/ui/changempin.dart';
import 'package:earninggame/ui/gameratesui.dart';
import 'package:earninggame/ui/ideaui.dart';
import 'package:earninggame/ui/notification.dart';
import 'package:earninggame/ui/passbookui.dart';
import 'package:earninggame/ui/rules.dart';
import 'package:earninggame/ui/settingui.dart';
import 'package:earninggame/ui/updatepassui.dart';
import 'package:earninggame/ui/videos.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:earninggame/utils/sharepreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../navigation.dart';

class DrawerManueUi extends StatefulWidget {
  const DrawerManueUi({super.key});

  @override
  State<DrawerManueUi> createState() => _DrawerManueUiState();
}

class _DrawerManueUiState extends State<DrawerManueUi> {
  List<Map>? sidebarManues;
  @override
  void initState() {
    super.initState();
    sidebarManues = [
      {
        "image": "assets/images/Homee.png",
        "title": "Home",
        "ontap": () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return NavigationUi(widgetIndex: 2);
          }));
        }
      },
      {
        "image": "assets/images/Auctionn.png",
        "title": "My Bids",
        "ontap": () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return NavigationUi(widgetIndex: 0);
          }));
        }
      },
      {
        "image": "assets/images/Lock.png",
        "title": "MPIN",
        "ontap": () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const ChangeMpinUi();
          }));
        }
      },
      {
        "image": "assets/images/Lock.png",
        "title": "Update Password",
        "ontap": () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const UpdatePassUi();
          }));
        }
      },
      {
        "image": "assets/images/Cashbook.png",
        "title": "Passbook",
        "ontap": () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const PassbookUi();
          }));
        }
      },
      {
        "image": "assets/images/Chat.png",
        "title": "Support",
        "ontap": () {
          alertCustomerSupport(context);
          // Navigator.push(context, CupertinoPageRoute(builder: (context) {
          //   return NavigationUi(widgetIndex: 4);
          // }));
        }
      },
      {
        "image": "assets/images/Bouncedcheckk.png",
        "title": "Funds",
        "ontap": () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return NavigationUi(widgetIndex: 3);
          }));
        }
      },
      {
        "image": "assets/demoimages/notification.png",
        "title": "Notification",
        "ontap": () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const NotificationUi();
          }));
        }
      },
      {
        "image": "assets/images/Video.png",
        "title": "Videos",
        "ontap": () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const VideosUi();
          }));
        }
      },
      {
        "image": "assets/images/Error.png",
        "title": "Notice Board / Rules",
        "ontap": () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const RulesUi();
          }));
        }
      },
      {
        "image": "assets/images/Features List.png",
        "title": "Game Rates",
        "ontap": () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const GameRatesUi();
          }));
        }
      },
      {
        "image": "assets/images/Positive Dynamic.png",
        "title": "Charts",
        "ontap": () {
          Navigator.pop(context);
          // Navigator.push(context, CupertinoPageRoute(builder: (context) {
          //   return NavigationUi(widgetIndex: 2);
          // }));
        }
      },
      {
        "image": "assets/images/Ideaa.png",
        "title": "Submit Idea",
        "ontap": () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const IdeaUi();
          }));
        }
      },
      {
        "image": "assets/images/Syncsettings.png",
        "title": "Settings",
        "ontap": () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return const SettingUi();
          }));
        }
      },
      {
        "image": "assets/images/Rightt.png",
        "title": "Share Application",
        "ontap": () {
          // Navigator.push(context, CupertinoPageRoute(builder: (context) {
          //   return NavigationUi(widgetIndex: 2);
          // }));
          Share.share('check out  https://play.google.com/store/apps/details?id=com.rovio.baba&pcampaignid=merch_published_cluster_promotion_battlestar_collection_new_games&hl=en_IN&gl=US');
        }
      },
      {
        "image": "assets/images/MoveUp.png",
        "title": "Logout",
        "ontap": () {
          clearPreference(context);
        }
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: primaryColor,
      elevation: 300,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    minRadius: 30,
                    backgroundColor: primaryColor,
                    child: SizedBox(
                        height: 35,
                        child: Image.asset("assets/demoimages/man.png")),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameUser.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(numberUser.toString())
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 40,
                      color: greyClr,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sidebarManues!.length,
                  itemBuilder: (context, index) {
                    Map data = sidebarManues![index];
                    return Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        InkWell(
                          onTap: data['ontap'],
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            // color: greyLightClr,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 25,
                                  child: Image.asset(data['image']),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
