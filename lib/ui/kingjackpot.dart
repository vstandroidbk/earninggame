import 'package:earninggame/models/galigamesmodel.dart';
import 'package:earninggame/providers/gameuiproviders/gdgamesprovider.dart';
import 'package:earninggame/providers/kingjackpotprovider.dart';
import 'package:earninggame/ui/gamestypekingjackpotui.dart';
import 'package:earninggame/ui/kingjackpothistoryui.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/galiratesmodel.dart';
import '../utils/components.dart';
import 'components/circularprogressindicator.dart';

class KingJackpotGamesUi extends StatefulWidget {
  const KingJackpotGamesUi({super.key});

  @override
  State<KingJackpotGamesUi> createState() => _KingJackpotGamesUiState();
}

class _KingJackpotGamesUiState extends State<KingJackpotGamesUi> {
  @override
  void initState() {
    super.initState();
    Provider.of<GaliProvider>(context, listen: false)
        .getGaliRatesApiCall(context);
    Provider.of<GaliProvider>(context, listen: false).galiGamesApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: blackClr,
          title: Text(galidisswar),
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
                            return const KingJackpotHistory();
                          })).then((value) {
                            Provider.of<GaliProvider>(context, listen: false)
                                .getGaliRatesApiCall(context);
                            Provider.of<GaliProvider>(context, listen: false)
                                .galiGamesApiCall(context);
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
                    height: 15,
                  ),
                  Consumer<GaliProvider>(
                    builder: (context, galiProvider, child) {
                      GameRates? starGmRates =
                          galiProvider.galiGmRatesData?.gameRates?[0];
                      return galiProvider.isloading
                          ? const CustomCircularProgress()
                          : galiProvider.galiGmRatesData?.status == false
                              ? const Text("No data found")
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
                                                    color: greyClr,
                                                    blurRadius: 2)
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                                Text(
                                                  '${starGmRates?.singleDigitVal1} -${starGmRates?.singleDigitVal2}',
                                                  style: const TextStyle(
                                                      fontSize: 15),
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
                                                    color: greyClr,
                                                    blurRadius: 2)
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                                Text(
                                                  '${starGmRates?.singlePanaVal1} -${starGmRates?.singlePanaVal2}',
                                                  style: const TextStyle(
                                                      fontSize: 15),
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
                                                    color: greyClr,
                                                    blurRadius: 2)
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                                Text(
                                                  '${starGmRates?.doublePanaVal1} -${starGmRates?.doublePanaVal2}',
                                                  style: const TextStyle(
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Consumer<GaliProvider>(
                          builder: (context, galiProvider, child) {
                            GaliGamesModel? galigamesData =
                                galiProvider.galiGameData;

                            List<Result>? listData = galigamesData?.result;
                            return galiProvider.isGameloading
                                ? const CustomCircularProgress()
                                : galigamesData?.status == false
                                    ? const Center(
                                        child: Text("No data found"),
                                      )
                                    : Column(
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: listData?.length ?? 0,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      childAspectRatio: 1.1,
                                                      crossAxisSpacing: 0,
                                                      mainAxisSpacing: 0),
                                              itemBuilder: (context, index) {
                                                Result? data = listData?[index];
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
                                                                      horizontal:
                                                                          5),
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
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            100,
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/demoimages/cancel.png",
                                                                        )),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Text(
                                                                      "Bidding Is Closed For Today",
                                                                      style: TextStyle(
                                                                          color:
                                                                              clrRed),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Text(
                                                                      "${data?.openTime}",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Table(
                                                                      children: const [
                                                                        TableRow(
                                                                            children: [
                                                                              Align(
                                                                                alignment: Alignment.centerRight,
                                                                                child: Text("Result Time :"),
                                                                              ),
                                                                              Center(
                                                                                child: Text("11:00 AM"),
                                                                              ),
                                                                            ]),
                                                                        TableRow(
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                            ]),
                                                                        TableRow(
                                                                            children: [
                                                                              Align(
                                                                                alignment: Alignment.centerRight,
                                                                                child: Text("Bid Last Time :"),
                                                                              ),
                                                                              Center(child: Text(" 09:55 AM")),
                                                                            ]),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    SizedBox(
                                                                      width: double
                                                                          .infinity,
                                                                      child: customElevatedButton(
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
                                                        Provider.of<GdGamesProvider>(
                                                            context,
                                                            listen: false)
                                                            .gdGameStatusCheckApiCall(
                                                            context, data?.gameId,
                                                            gmName: data?.gameName);
                                                    }
                                                  },
                                                  child: Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: greyClr,
                                                              blurRadius: 5)
                                                        ],
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8))),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "${data?.openTime}",
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      CircleAvatar(
                                                                        maxRadius:
                                                                            18,
                                                                        backgroundColor:
                                                                            blackClr,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "${data?.openResult}${data?.closeResult}",
                                                                            style:
                                                                                const TextStyle(fontSize: 18),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Icon(
                                                                    data?.msgStatus ==
                                                                            2
                                                                        ? Icons
                                                                            .alarm_off
                                                                        : Icons
                                                                            .alarm_on_outlined,
                                                                    size: 55,
                                                                    color: index ==
                                                                            0
                                                                        ? greyDarkClr
                                                                        : primaryColor,
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 3,
                                                              ),
                                                              Text(
                                                                "${data?.msg}",
                                                                style: TextStyle(
                                                                    color: data?.msgStatus ==
                                                                            2
                                                                        ? clrRed
                                                                        : clrGreen),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration: BoxDecoration(
                                                                color: data?.msgStatus ==
                                                                        2
                                                                    ? greyClr
                                                                    : primaryColor,
                                                                borderRadius: const BorderRadius
                                                                        .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8))),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .play_circle,
                                                                    size: 40,
                                                                    color: data?.msgStatus ==
                                                                            2
                                                                        ? greyLightClr
                                                                        : clrBlackLight,
                                                                  ),
                                                                  Text(
                                                                    "Play Game",
                                                                    style: TextStyle(
                                                                        color: data?.msgStatus ==
                                                                                2
                                                                            ? clrWhite
                                                                            : blackClr,
                                                                        fontSize:
                                                                            18),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                        ],
                                      );
                          },
                        ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
