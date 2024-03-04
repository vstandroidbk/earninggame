import 'package:earninggame/ui/fundsui.dart';
import 'package:earninggame/ui/homeui.dart';
import 'package:earninggame/ui/mybidaui.dart';
import 'package:earninggame/ui/passbookui.dart';
import 'package:earninggame/ui/supportui.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationUi extends StatefulWidget {
  final int widgetIndex;
  const NavigationUi({super.key, required this.widgetIndex});

  @override
  State<NavigationUi> createState() => _NavigationUiState();
}

class _NavigationUiState extends State<NavigationUi> {
  final GlobalKey formGlobalKey=GlobalKey<FormState>();
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.widgetIndex;
  }

  List widgetsClass = [
    const MybidsUi(),
    const PassbookUi(),
    const HomeUi(),
    const FundsUi(),
    const SupportUi()
  ];
  bool exit = false;
  @override
  Widget build(BuildContext context) {
    if (exit) {
      SystemNavigator.pop();
    }
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                contentPadding: EdgeInsets.zero,
                content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: primaryColor,
                        padding: const EdgeInsets.all(10),
                        child: const Center(
                          child: Text(
                            "Quit",
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 100,
                        child: Image.asset("assets/demoimages/logoutexit.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Are you sure want to quit ?"),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: customElevatedButton(context, "NO", () {
                              Navigator.pop(context);
                            }),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: customElevatedButton(context, "YES", () {
                              setState(() {
                                exit = true;
                              });
                            }),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            });
        return exit;
      },
      child: Scaffold(
        body: widgetsClass[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (value) {
              if (value == 4) {
                alertCustomerSupport(context,formGlobalKey);
              } else if (value == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PassbookUi();
                }));
              } else {
                setState(() {
                  currentIndex = value;
                });
              }
            },
            selectedItemColor: primaryColor,
            unselectedItemColor: blackClr,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/images/Auctiona.png",
                      color: currentIndex == 0 ? primaryColor : blackClr,
                    ),
                  ),
                  label: "My Bids"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/images/Cashbooka.png",
                      color: currentIndex == 1 ? primaryColor : blackClr,
                    ),
                  ),
                  label: "Passbook"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 40,
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            top: 0,
                            child: Image.asset(
                              "assets/images/Homea.png",
                              color:
                                  currentIndex == 2 ? primaryColor : blackClr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/images/BouncedCheck.png",
                      color: currentIndex == 3 ? primaryColor : blackClr,
                    ),
                  ),
                  label: "Funds"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/images/HelpingHand.png",
                      color: currentIndex == 4 ? primaryColor : blackClr,
                    ),
                  ),
                  label: "Support")
            ]),
      ),
    );
  }
}
