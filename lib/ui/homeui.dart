import 'package:earninggame/models/homemodel.dart';
import 'package:earninggame/providers/homeprovider.dart';
import 'package:earninggame/providers/profileprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/ui/components/drawer.dart';
import 'package:earninggame/ui/gamestypeui.dart';
import 'package:earninggame/ui/kingjackpot.dart';
import 'package:earninggame/ui/kingstarlinegametypeui.dart';
import 'package:earninggame/ui/notification.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../providers/gameuiproviders/maingamesprovider.dart';
import '../utils/constants.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false)
        .profileDataApiCall(context);
    Provider.of<HomeProvider>(context, listen: false).homeDataApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: SizedBox(
                  width: 50,
                  height: 30,
                  child: Image.asset("assets/demoimages/menu-bar.png")),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent, //primaryColor,
        foregroundColor: blackClr,
        title: SizedBox(
            width: 50, child: Image.asset("assets/demoimages/demoicon.png")),
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
                  "${profileProvider.profileModelData.profile?[0].walletBalance}",
                  style: const TextStyle(fontWeight: FontWeight.w600),
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
      // backgroundColor: greyLightClr,
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            HomeModel data = homeProvider.getHomeModelData;
            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: const BoxDecoration(
                      // color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                        child: Marquee(
                          text:
                              "24X7 HelpLine Number 08001055 . Available Languages English         ",
                          style: TextStyle(color: clrRedDark),
                          accelerationDuration: const Duration(seconds: 1),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customElevatedButtonTop(
                              context,
                              Row(
                                children: [
                                  SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        "assets/demoimages/play.png",
                                        color: clrBlackLight,
                                      )),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text(
                                    "King Starline",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ), () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return const KingStarlineGamesUi();
                            })).then((value) {
                              Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .profileDataApiCall(context);
                              Provider.of<HomeProvider>(context, listen: false)
                                  .homeDataApiCall(context);
                            });
                          }, horizontalPadding: 10.0, verticalPadding: 10.0),
                          customElevatedButtonTop(
                              context,
                              Row(
                                children: [
                                  SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        "assets/demoimages/play.png",
                                        color: clrBlackLight,
                                      )),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    galidisswar,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ), () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return const KingJackpotGamesUi();
                            })).then((value) {
                              Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .profileDataApiCall(context);
                              Provider.of<HomeProvider>(context, listen: false)
                                  .homeDataApiCall(context);
                            });
                          }, horizontalPadding: 10.0, verticalPadding: 10.0),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              child: Image.asset(
                                  "assets/demoimages/whatsapp.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            homeProvider.isloading
                                ? ''
                                : data.mobileNo ?? "....",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: homeProvider.isloading
                      ? const CustomCircularProgress()
                      : data.result?.length == 0 || data.result?.length == null
                          ? const Center(
                              child: Text(
                                "No Data Found",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 17),
                              ),
                            )
                          : ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: data.result?.length ?? 0,
                              shrinkWrap: true,
                              // separatorBuilder: (context, index) {
                              //   return
                              // },
                              itemBuilder: (context, index) {
                                Result? gamedata = data.result?[index];
                                return Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: InkWell(
                                    onTap: () {
                                      if (gamedata?.msgStatus == 2) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                insetPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                content: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.95,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Image.asset(
                                                            "assets/demoimages/cancel.png"),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Bidding Is Closed For Today",
                                                        style: TextStyle(
                                                            color: clrRedDark),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "${data.result?[index].gameName}",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        child:
                                                            customElevatedButton(
                                                                context, "OK",
                                                                () {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      } else {
                                        Provider.of<MainGamesProvider>(context,
                                                listen: false)
                                            .mainGameStatusCheckApiCall(
                                                context, gamedata?.gameId,
                                                gmName: gamedata?.gameName);
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      decoration: BoxDecoration(
                                          color: clrWhite,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: primaryColor,
                                                blurRadius: 1)
                                          ]),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${gamedata?.gameName}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                "${gamedata?.msg}",
                                                style: gamedata?.msgStatus == 2
                                                    ? TextStyle(color: clrRed)
                                                    : TextStyle(
                                                        color: clrGreen),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                flex: 3,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${gamedata?.openResult}${gamedata?.closeResult}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 17,
                                                          color:
                                                              primaryDarkClr),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const Text(
                                                                "Open Bids :"),
                                                            Text(
                                                                "${gamedata?.openTime}")
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text(
                                                                "Close Bids :"),
                                                            Text(
                                                                "${gamedata?.closeTime}")
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 2,
                                                child: Column(
                                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                        width: 40,
                                                        child: Image.asset(
                                                          "assets/demoimages/play.png",
                                                          color: clrBlackLight,
                                                        )),
                                                    const Text(
                                                      "Play Now",
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                )
              ],
            );
          },
        ),
      ),
      drawer: const DrawerManueUi(),
    );
  }
}
