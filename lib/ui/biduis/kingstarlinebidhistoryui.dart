import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/ksbidhistorymodel.dart';
import '../../providers/starlinegameresultprovider.dart';
import '../../utils/colors.dart';

class KingStarlineBidHistoryUi extends StatefulWidget {
  const KingStarlineBidHistoryUi({super.key});

  @override
  State<KingStarlineBidHistoryUi> createState() =>
      _KingStarlineBidHistoryUiState();
}

class _KingStarlineBidHistoryUiState extends State<KingStarlineBidHistoryUi> {
  @override
  void initState() {
    super.initState();
    Provider.of<StarlineGmResultProvider>(context, listen: false)
        .ksBidHistryApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
        title: const Text("King Starline Bid History"),
        actions: [
          InkWell(
            onTap: () {
              customFilter(context);
            },
            child: const Icon(
              Icons.filter_alt_outlined,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<StarlineGmResultProvider>(
                      builder: (context, starlineGmResultProvider, child) {
                    if (starlineGmResultProvider.isKsBidHistrorydataLoding) {
                      return const CustomCircularProgress();
                    } else {
                      int len=starlineGmResultProvider.starlineBidHistoryData?.data?.bidData.length ??0 ;
                      if (len  <=
                                0) {
                        return const SizedBox(
                                height: 500,
                                child: Center(
                                  child: Text(
                                    "No Data Found.",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              );
                      } else {
                        return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: starlineGmResultProvider
                                        .starlineBidHistoryData
                                        .data
                                        .bidData
                                        .length ??
                                    0,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  BidData data = starlineGmResultProvider
                                      .starlineBidHistoryData
                                      .data
                                      .bidData[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: clrWhite,
                                          boxShadow: [
                                            BoxShadow(
                                                color: greyClr, blurRadius: 8)
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                            ),
                                            child: Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                data.gameName ?? "---",
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            )),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Game Type",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    data.pana ?? '---',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Digits",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    data.digits ?? '---',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Points",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    data.points ?? '---',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: greyClr,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Bid Transaction Id",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  Text(
                                                    data.bidTxId ?? '---',
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Bid Date",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  Text(
                                                    data.bidDate ?? "---",
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Divider(
                                            color: greyClr,
                                          ),
                                          const Center(
                                            child: Text(
                                              "Transaction Time : ---", // 13/12/2023 02:18:14 PM",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Divider(
                                            color: greyClr,
                                          ),
                                          Center(
                                            child: Text(
                                              "---", // "Congratulation , You won(28) ",
                                              style: TextStyle(
                                                  color: clrGreen,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                      }
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
