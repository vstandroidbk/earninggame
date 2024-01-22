import 'package:earninggame/providers/gameuiproviders/singledigitbulkprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class SingleDigitBulkUi extends StatefulWidget {
  const SingleDigitBulkUi({super.key});

  @override
  State<SingleDigitBulkUi> createState() => _SingleDigitBulkUiState();
}

class _SingleDigitBulkUiState extends State<SingleDigitBulkUi> {
  TextEditingController singleDigitController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  String? dropValue;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<SingleDigitBulkGameProvider>(context, listen: false)
          .removeAllBids();
      Provider.of<SingleDigitBulkGameProvider>(context, listen: false)
          .setgameTypeChange(null);
      dropValue =
          Provider.of<SingleDigitBulkGameProvider>(context, listen: false)
              .gameType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBarComman(const Text("Single Digit Bulk Game")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select Game Type",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                        child: customDropDownMenueButton(dropValue, (value) {
                          Provider.of<SingleDigitBulkGameProvider>(context,
                                  listen: false)
                              .setgameTypeChange(value);
                          dropValue = Provider.of<SingleDigitBulkGameProvider>(
                                  context,
                                  listen: false)
                              .gameType;
                        }),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enter Point",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                        // decoration: BoxDecoration(boxShadow: [
                        //   BoxShadow(color: greyClr, blurRadius: 8),
                        // ], borderRadius: BorderRadius.circular(20)),
                        child: customInputFieldPin(
                            pointController, TextInputType.number, context,
                            maxlength: 6, textalign: true),
                      ),
                    )
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (int x = 1; x <= 10; x++) ...[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                            onLongPress: () {},
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                foregroundColor: blackClr,
                                backgroundColor: primaryColor),
                            child: Stack(clipBehavior: Clip.none, children: [
                              Text(
                                x == 10 ? "0" : '$x',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Positioned(
                                  right: -50,
                                  top: -15,
                                  child: Text(
                                    "20",
                                    style: TextStyle(fontSize: 12),
                                  ))
                            ])),
                      ),
                    ]
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Expanded(
                //       child: ElevatedButton(
                //           onLongPress: () {},
                //           onPressed: () {},
                //           style: ElevatedButton.styleFrom(
                //               padding: const EdgeInsets.symmetric(vertical: 20),
                //               foregroundColor: blackClr,
                //               backgroundColor: primaryColor),
                //           child:
                //               Stack(clipBehavior: Clip.none, children: const [
                //             Text(
                //               '1',
                //               style: TextStyle(fontSize: 18),
                //             ),
                //             Positioned(
                //                 right: -50,
                //                 top: -15,
                //                 child: Text(
                //                   "20",
                //                   style: TextStyle(fontSize: 12),
                //                 ))
                //           ])),
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     Expanded(
                //       child: ElevatedButton(
                //           onLongPress: () {},
                //           onPressed: () {},
                //           style: ElevatedButton.styleFrom(
                //               padding: const EdgeInsets.symmetric(vertical: 20),
                //               foregroundColor: blackClr,
                //               backgroundColor: primaryColor),
                //           child:
                //               Stack(clipBehavior: Clip.none, children: const [
                //             Text(
                //               '2',
                //               style: TextStyle(fontSize: 18),
                //             ),
                //             Positioned(
                //                 right: -50,
                //                 top: -15,
                //                 child: Text(
                //                   "20",
                //                   style: TextStyle(fontSize: 12),
                //                 ))
                //           ])),
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     Expanded(
                //       child: ElevatedButton(
                //           onLongPress: () {},
                //           onPressed: () {},
                //           style: ElevatedButton.styleFrom(
                //               padding: const EdgeInsets.symmetric(vertical: 20),
                //               foregroundColor: blackClr,
                //               backgroundColor: primaryColor),
                //           child:
                //               Stack(clipBehavior: Clip.none, children: const [
                //             Text(
                //               '3',
                //               style: TextStyle(fontSize: 18),
                //             ),
                //             Positioned(
                //                 right: -50,
                //                 top: -15,
                //                 child: Text(
                //                   "20",
                //                   style: TextStyle(fontSize: 12),
                //                 ))
                //           ])),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: const [],
            ),
          )),
          Divider(
            thickness: 2,
            color: primaryColor,
          ),
          Consumer<SingleDigitBulkGameProvider>(
            builder: (context, singleDigitBulkGameProvider, child) {
              int totalpoints = 0;
              List<Map> totalBids = singleDigitBulkGameProvider.totalBids;
              List.generate(totalBids.length, (index) {
                int points = int.parse(totalBids[index]['points'].toString());
                totalpoints += points;
              });
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text("Bids"),
                      Text("${singleDigitBulkGameProvider.totalBids.length}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Points"),
                      Text("$totalpoints"),
                    ],
                  ),
                  SizedBox(
                      width: 100,
                      child: customElevatedButton(context, "Submit", () {
                        popupWorkingMoneyReduction(context, () {
                          Navigator.pop(context);
                          popUpInsufficientBalance(context);
                        });
                      }))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
