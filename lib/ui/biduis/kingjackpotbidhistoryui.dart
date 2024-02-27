import 'package:earninggame/providers/kingjackpotprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/gdbidhistorymodel.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class KingJackpotBidHistoryUi extends StatefulWidget {
  const KingJackpotBidHistoryUi({super.key});

  @override
  State<KingJackpotBidHistoryUi> createState() =>
      _KingJackpotBidHistoryUiState();
}

class _KingJackpotBidHistoryUiState extends State<KingJackpotBidHistoryUi> {
  @override
  void initState() {
    super.initState();
    Provider.of<GaliProvider>(context,listen: false).galiBidHisApiCall(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
        title: Text("$galidisswar Bid History"),
        actions: [
          InkWell(
            onTap: () {
              // customFilter(context);
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
                  Consumer<GaliProvider>(builder: (context,galiProvider,child){
                    return galiProvider.isBidHisLoding?const CustomCircularProgress():galiProvider.getGaliBidHisData.bidData.length <= 0?const SizedBox(height: 500,child:  Center(child: Text("No Data Found",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),)): ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: galiProvider.getGaliBidHisData.bidData.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          BidData data=galiProvider.getGaliBidHisData.bidData[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: clrWhite,
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                    ),
                                    child:  Center(
                                        child: Padding(
                                          padding:const EdgeInsets.all(4.0),
                                          child: Text(
                                            data.gameName??'--',//"MADHUR DAY(close)",
                                            style:const TextStyle(fontSize: 16),
                                          ),
                                        )),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children:  [
                                          const Text(
                                            "Game Type",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            data.pana??'--',//"Single Digit",
                                            style:const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children:  [
                                         const Text(
                                            "Digits",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                         const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            data.digits??'--',
                                            style:const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children:  [
                                          const  Text(
                                            "Points",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            data.points??'--',
                                            style:const TextStyle(
                                                fontWeight: FontWeight.w600,
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
                                        children:  [
                                          const Text(
                                            "Bid Transaction Id",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            data.bidTxId??'---',
                                            style:const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children:  [
                                          const Text(
                                            "Bid Date",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            data.bidDate??"---",//"12/12/2023",
                                            style:const TextStyle(fontSize: 12),
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
                                      "Transaction Time : ---",// 13/12/2023 02:18:14 PM",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Divider(
                                    color: greyClr,
                                  ),
                                  Center(
                                    child: Text(
                                      "---",//"Congratulation , You won(28) ",
                                      style: TextStyle(
                                          color: clrGreen, fontSize: 12),
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
