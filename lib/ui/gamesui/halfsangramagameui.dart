import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/gameuiproviders/singlepanaprovider.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class HalfSangramAGameUi extends StatefulWidget {
  const HalfSangramAGameUi({super.key});

  @override
  State<HalfSangramAGameUi> createState() => _HalfSangramAGameUiState();
}

class _HalfSangramAGameUiState extends State<HalfSangramAGameUi> {
  TextEditingController openDigitController = TextEditingController();
  TextEditingController closePanaController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  String? dropValue;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<SinglePanaGameProvider>(context, listen: false)
          .removeAllBids();
      Provider.of<SinglePanaGameProvider>(context, listen: false)
          .setgameTypeChange(null);
      dropValue =
          Provider.of<SinglePanaGameProvider>(context, listen: false).gameType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComman(const Text("Half Sangram A Game")),
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
                      "Enter Open Digit",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                        child: customInputFieldPin(
                            openDigitController, TextInputType.number, context,
                            maxlength: 1, textalign: true),
                      ),
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 30,
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enter Close Pana",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                        // decoration: BoxDecoration(boxShadow: [
                        //   BoxShadow(color: greyClr, blurRadius: 8),
                        // ], borderRadius: BorderRadius.circular(20)),
                        child: customInputFieldPin(
                            closePanaController, TextInputType.number, context,
                            maxlength: 3, textalign: true),
                      ),
                    )
                  ],
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
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 190,
                    child: customElevatedButton(
                      context,
                      "Add",
                      () {
                        if (openDigitController.text.isEmpty) {
                          customSnackbar(context, "Please enter Open Digit");
                        } else if (closePanaController.text.isEmpty) {
                          customSnackbar(context, "Please enter Close Pana");
                        } else if (pointController.text.isEmpty) {
                          customSnackbar(context, "Please enter points");
                        } else {
                          Provider.of<SinglePanaGameProvider>(context,
                                  listen: false)
                              .addTotalBids(
                                  "${openDigitController.text}-${closePanaController.text}",
                                  pointController.text,
                                  dropValue);
                          openDigitController.clear();
                          closePanaController.clear();
                          pointController.clear();
                        }
                      },
                      horizontalPadding: 10.0,
                      verticalPadding: 10.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Table(
            columnWidths: const {
              // 0: FixedColumnWidth(110),
              // 1: FixedColumnWidth(110),
              // 2: FixedColumnWidth(110),
              // 3: FixedColumnWidth(110)
            },
            children: const [
              TableRow(children: [
                TableCell(
                    child: Center(
                        child: Text(
                  "Sangram",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))),
                TableCell(
                    child: Center(
                        child: Text(
                  "Points",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))),
                TableCell(
                    child: Center(
                        child: Text(
                  "",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))),
                TableCell(child: Center(child: Text(""))),
              ])
            ],
          ),
          Divider(
            color: greyClr,
            thickness: 2,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<SinglePanaGameProvider>(
                  builder: (context, singlePanaGameProvider, child) {
                    List<TableRow> tablerow = [];
                    List<Map> totalBids = singlePanaGameProvider.totalBids;
                    List.generate(totalBids.length, (index) {
                      return tablerow.add(TableRow(
                          decoration:
                              BoxDecoration(color: clrWhite, boxShadow: [
                            BoxShadow(color: greyClr, blurRadius: 4),
                          ]),
                          children: [
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${totalBids[index]['digit']}"),
                            ))),
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${totalBids[index]['points']}"),
                            ))),
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: totalBids[index]['type'] == "closed"
                                  ? Text(
                                      "",
                                      style: TextStyle(color: clrRed),
                                    )
                                  : const Text(""),
                            ))),
                            TableCell(
                                child: InkWell(
                              onTap: () {
                                Provider.of<SinglePanaGameProvider>(context,
                                        listen: false)
                                    .removeBids(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete_forever,
                                  color: clrRed,
                                ),
                              ),
                            )),
                          ]));
                    });
                    return Table(
                      columnWidths: const {
                        // 0: FixedColumnWidth(110),
                        // 1: FixedColumnWidth(110),
                        // 2: FixedColumnWidth(110),
                        // 3: FixedColumnWidth(110)
                      },
                      children: tablerow,
                    );
                  },
                )
              ],
            ),
          )),
          Divider(
            thickness: 2,
            color: primaryColor,
          ),
          Consumer<SinglePanaGameProvider>(
            builder: (context, singlePanaGameProvider, child) {
              int totalpoints = 0;
              List<Map> totalBids = singlePanaGameProvider.totalBids;
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
                      Text("${singlePanaGameProvider.totalBids.length}"),
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
                      child: customElevatedButton(
                        context,
                        "Submit",
                        () {
                          popupWorkingMoneyReduction(context, () {
                            Navigator.pop(context);
                            popUpInsufficientBalance(context);
                          });
                        },
                        verticalPadding: 3.0,
                      ))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
