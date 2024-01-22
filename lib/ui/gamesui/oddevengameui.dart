import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/gameuiproviders/singlepanaprovider.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class OddEvenGameUi extends StatefulWidget {
  const OddEvenGameUi({super.key});

  @override
  State<OddEvenGameUi> createState() => _OddEvenGameUiState();
}

class _OddEvenGameUiState extends State<OddEvenGameUi> {
  TextEditingController singleDigitController = TextEditingController();
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
      appBar: appBarComman(const Text("Odd Even Game")),
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
                          Provider.of<SinglePanaGameProvider>(context,
                                  listen: false)
                              .setgameTypeChange(value);
                          dropValue = Provider.of<SinglePanaGameProvider>(
                                  context,
                                  listen: false)
                              .gameType;
                        }),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio(value: 1, groupValue: 1, onChanged: (val) {}),
                        const Text("Odd")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(value: 2, groupValue: 1, onChanged: (val) {}),
                        const Text("Even")
                      ],
                    ),
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
                        if (dropValue == null) {
                          customSnackbar(context, "Please Select Game Type");
                        } else if (pointController.text.isEmpty) {
                          customSnackbar(context, "Please enter points");
                        } else {
                          Provider.of<SinglePanaGameProvider>(context,
                                  listen: false)
                              .addTotalBids(singleDigitController.text,
                                  pointController.text, dropValue);
                          singleDigitController.clear();
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
            children: const [
              TableRow(children: [
                TableCell(
                    child: Center(
                        child: Text(
                  "Digit",
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
                  "Types",
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
                                      "${totalBids[index]['type']}",
                                      style: TextStyle(color: clrRed),
                                    )
                                  : Text("${totalBids[index]['type']}"),
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
