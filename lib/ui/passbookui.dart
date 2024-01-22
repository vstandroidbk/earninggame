import 'package:earninggame/utils/colors.dart';
import 'package:flutter/material.dart';

class PassbookUi extends StatefulWidget {
  const PassbookUi({super.key});

  @override
  State<PassbookUi> createState() => _PassbookUiState();
}

class _PassbookUiState extends State<PassbookUi> {
  List<Map> tableData = [
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Last DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 300",
      "transaction": "+ \u{20B9} 500",
      "current": "\u{20B9} 800"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Morning DAY : Single Digit : OPEN ) : 5",
      "previous": "\u{20B9} 600",
      "transaction": "- \u{20B9} 200",
      "current": "\u{20B9} 400"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Last DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 300",
      "transaction": "+ \u{20B9} 500",
      "current": "\u{20B9} 800"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Morning DAY : Single Digit : OPEN ) : 5",
      "previous": "\u{20B9} 600",
      "transaction": "- \u{20B9} 200",
      "current": "\u{20B9} 400"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Last DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 300",
      "transaction": "+ \u{20B9} 500",
      "current": "\u{20B9} 800"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Morning DAY : Single Digit : OPEN ) : 5",
      "previous": "\u{20B9} 600",
      "transaction": "- \u{20B9} 200",
      "current": "\u{20B9} 400"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Last DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 300",
      "transaction": "+ \u{20B9} 500",
      "current": "\u{20B9} 800"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Morning DAY : Single Digit : OPEN ) : 5",
      "previous": "\u{20B9} 600",
      "transaction": "- \u{20B9} 200",
      "current": "\u{20B9} 400"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Last DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 300",
      "transaction": "+ \u{20B9} 500",
      "current": "\u{20B9} 800"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Morning DAY : Single Digit : OPEN ) : 5",
      "previous": "\u{20B9} 600",
      "transaction": "- \u{20B9} 200",
      "current": "\u{20B9} 400"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Last DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 300",
      "transaction": "+ \u{20B9} 500",
      "current": "\u{20B9} 800"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Morning DAY : Single Digit : OPEN ) : 5",
      "previous": "\u{20B9} 600",
      "transaction": "- \u{20B9} 200",
      "current": "\u{20B9} 400"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Last DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 300",
      "transaction": "+ \u{20B9} 500",
      "current": "\u{20B9} 800"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Morning DAY : Single Digit : OPEN ) : 5",
      "previous": "\u{20B9} 600",
      "transaction": "- \u{20B9} 200",
      "current": "\u{20B9} 400"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Last DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 300",
      "transaction": "+ \u{20B9} 500",
      "current": "\u{20B9} 800"
    },
    {
      "date": "21-12-2023",
      "particulars": "Bid (Morning DAY : Single Digit : OPEN ) : 5",
      "previous": "\u{20B9} 600",
      "transaction": "- \u{20B9} 200",
      "current": "\u{20B9} 400"
    }
  ];
  @override
  Widget build(BuildContext context) {
    final tableraw = <TableRow>[];
    tableraw.add(TableRow(
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        children: const [
          TableCell(
              child: Center(
                  child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Transaction Date"),
          ))),
          TableCell(
              child: Center(
                  child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Particulars"),
          ))),
          TableCell(
              child: Center(
                  child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Previous Amount"),
          ))),
          TableCell(
              child: Center(
                  child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Transaction Amount"),
          ))),
          TableCell(
              child: Center(
                  child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Current amount"),
          )))
        ]));
    for (Map data in tableData) {
      tableraw.add(TableRow(children: [
        TableCell(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(data["date"]),
              const Text("08:20 PM"),
            ],
          ),
        ))),
        TableCell(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data["particulars"]),
        ))),
        TableCell(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data["previous"]),
        ))),
        TableCell(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data["transaction"]),
        ))),
        TableCell(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data["current"]),
        )))
      ]));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passbook"),
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Table(
                      border: TableBorder.all(color: greyLightClr, width: 2),
                      // defaultColumnWidth: const FixedColumnWidth(200.0),
                      columnWidths: const {
                        0: FixedColumnWidth(150),
                        1: FixedColumnWidth(350),
                        2: FixedColumnWidth(250),
                        3: FixedColumnWidth(200),
                        4: FixedColumnWidth(150),
                      },
                      children: tableraw),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
