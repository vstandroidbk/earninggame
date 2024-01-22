import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';

class KingsStarlineHistoryUi extends StatefulWidget {
  const KingsStarlineHistoryUi({super.key});

  @override
  State<KingsStarlineHistoryUi> createState() => _KingsStarlineHistoryUiState();
}

class _KingsStarlineHistoryUiState extends State<KingsStarlineHistoryUi> {
  DateTime nowDate = DateTime.now();
  late String dateToday;
  @override
  void initState() {
    super.initState();
    dateToday = DateFormat("yyyy-MM-dd").format(nowDate);
  }

  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("King Startline History"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select Date :"),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.parse(selectedDate ?? dateToday),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2024),
                          builder: (context, childs) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: primaryColor,
                                colorScheme:
                                    ColorScheme.light(primary: primaryColor),
                                buttonTheme: const ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary),
                              ),
                              child: childs!,
                            );
                          },
                        );

                        if (pickedDate != null) {
                          setState(() {
                            selectedDate =
                                DateFormat("yyyy-MM-dd").format(pickedDate);
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: greyClr, blurRadius: 10)
                            ]),
                        child: Text(
                          selectedDate ?? dateToday,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                // separatorBuilder: (context, index) {
                //   return
                // },
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: greyLightClr,
                        borderRadius: BorderRadius.circular(5),
                        // boxShadow: [
                        //   BoxShadow(color: greyLightClr, blurRadius: 10)
                        // ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "10:00 AM",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          Text(
                            "71",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
