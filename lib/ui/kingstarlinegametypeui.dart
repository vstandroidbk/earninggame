import 'package:earninggame/providers/starlinegamesprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/ui/gamestypekingstarlineui.dart';
import 'package:earninggame/ui/kingstarlinehistoryui.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/starlinegamesmodel.dart';
import '../models/starlineratesmodel.dart';
import '../utils/colors.dart';

class KingStarlineGamesUi extends StatefulWidget {
  const KingStarlineGamesUi({super.key});

  @override
  State<KingStarlineGamesUi> createState() => _KingStarlineGamesUiState();
}

class _KingStarlineGamesUiState extends State<KingStarlineGamesUi> {
  @override
  void initState() {
    super.initState();
    Provider.of<StarlineGamesProvider>(context, listen: false)
        .starlineGmRatesApiCall(context);
    Provider.of<StarlineGamesProvider>(context, listen: false)
        .starlineGamesApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: blackClr,
          title: const Text("King Starline Games"),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              decoration: const BoxDecoration(
                  // color: primaryColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return const KingsStarlineHistoryUi();
                          })).then((value) {
                            Provider.of<StarlineGamesProvider>(context,
                                    listen: false)
                                .starlineGmRatesApiCall(context);
                            Provider.of<StarlineGamesProvider>(context,
                                    listen: false)
                                .starlineGamesApiCall(context);
                          });
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.history),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "History",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Notification",
                            style: TextStyle(fontSize: 16),
                          ),
                          Switch(
                              activeColor: primaryDarkClr,
                              value: true,
                              onChanged: (val) {})
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<StarlineGamesProvider>(
                    builder: (context, starlineGamesProvider, child) {
                      GameRates? starGmRates = starlineGamesProvider
                          .getStartlineGmRatesData?.gameRates?[0];
                      return starlineGamesProvider.isloading
                          ? const CustomCircularProgress()
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: size.width * 0.46,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: greyClr, blurRadius: 2)
                                          ]),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     CupertinoPageRoute(builder: (context) {
                                          //   return const TestUi();
                                          // }));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Flexible(
                                              child: Text(
                                                'Singel Digit:-',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            Text(
                                              '${starGmRates?.singleDigitVal1} -${starGmRates?.singleDigitVal2}',
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Container(
                                      width: size.width * 0.46,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: greyClr, blurRadius: 2)
                                          ]),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     CupertinoPageRoute(builder: (context) {
                                          //   return const TestUi();
                                          // }));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Flexible(
                                              child: Text(
                                                'Singel Pana:-',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            Text(
                                              '${starGmRates?.singlePanaVal1} -${starGmRates?.singlePanaVal2}',
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: size.width * 0.46,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: greyClr, blurRadius: 2)
                                          ]),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     CupertinoPageRoute(builder: (context) {
                                          //   return const TestUi();
                                          // }));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Flexible(
                                              child: Text(
                                                'Double Pana:-',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            Text(
                                              '${starGmRates?.doublePanaVal1} -${starGmRates?.doublePanaVal2}',
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Container(
                                      width: size.width * 0.46,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: greyClr, blurRadius: 2)
                                          ]),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     CupertinoPageRoute(builder: (context) {
                                          //   return const TestUi();
                                          // }));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Flexible(
                                              child: Text(
                                                'Triple Pana:-',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            Text(
                                              '${starGmRates?.tripplePanaVal1} -${starGmRates?.tripplePanaVal2}',
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                    },
                  )
                ],
              ),
            ),
            Expanded(child: Consumer<StarlineGamesProvider>(
              builder: (context, starlineGamesProvider, child) {
                StarlineGamesModel listData =
                    starlineGamesProvider.getstarlineGamesData;
                return starlineGamesProvider.isgamesloading
                    ? const CustomCircularProgress()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: listData.result?.length ?? 0,
                                        itemBuilder: (context, index) {
                                          Result? data =
                                              listData.result?[index];
                                          return InkWell(
                                            onTap: () {
                                              if (data?.msgStatus == 2) {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        insetPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5),
                                                        content: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              SizedBox(
                                                                  width: 100,
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/demoimages/cancel.png",
                                                                  )),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                "Bidding Is Closed For Today",
                                                                style: TextStyle(
                                                                    color:
                                                                        clrRed),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                "${data?.openTime}",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Table(
                                                                children: const [
                                                                  TableRow(
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          child:
                                                                              Text("Result Time :"),
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Text("11:00 AM"),
                                                                        ),
                                                                      ]),
                                                                  TableRow(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                      ]),
                                                                  TableRow(
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          child:
                                                                              Text("Bid Last Time :"),
                                                                        ),
                                                                        Center(
                                                                            child:
                                                                                Text(" 09:55 AM")),
                                                                      ]),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              SizedBox(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    customElevatedButton(
                                                                        context,
                                                                        "OK",
                                                                        () {
                                                                  Navigator.pop(
                                                                      context);
                                                                }),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              } else {
                                                Provider.of<StarlineGamesProvider>(
                                                        context,
                                                        listen: false)
                                                    .stGameStatusCheckApiCall(
                                                        context, data?.gameId,
                                                        gmName: data?.gameName);
                                              }
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 15),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: greyClr,
                                                        blurRadius: 2)
                                                  ],
                                                  color: clrWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        data?.msgStatus == 2
                                                            ? Icons.alarm_off
                                                            : Icons
                                                                .alarm_on_outlined,
                                                        size: 60,
                                                        color:
                                                            data?.msgStatus == 2
                                                                ? greyDarkClr
                                                                : primaryColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${data?.openTime}",
                                                            style: const TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            "${data?.msg}",
                                                            style: TextStyle(
                                                                color: data?.msgStatus ==
                                                                        2
                                                                    ? clrRed
                                                                    : clrGreen),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10,
                                                                vertical: 5),
                                                        decoration: BoxDecoration(
                                                            color: primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color:
                                                                      greyClr,
                                                                  blurRadius: 2)
                                                            ]),
                                                        child: Text(
                                                          "${data?.openResult}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 17),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 7,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.play_circle,
                                                            size: 50,
                                                            color:
                                                                clrBlackLight,
                                                          ),
                                                          const Text(
                                                            "Play Game",
                                                            style: TextStyle(),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                  ],
                                )),
                          ],
                        ),
                      );
              },
            )),
          ],
        ));
  }
}
