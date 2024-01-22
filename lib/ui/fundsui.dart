import 'package:earninggame/ui/components/drawer.dart';
import 'package:earninggame/ui/funduis/addbankdetailoneui.dart';
import 'package:earninggame/ui/funduis/addfundui.dart';
import 'package:earninggame/ui/funduis/bankchangehistoryui.dart';
import 'package:earninggame/ui/funduis/funddeposithistoryui.dart';
import 'package:earninggame/ui/funduis/fundwithdrawhistoryui.dart';
import 'package:earninggame/ui/funduis/withdrawfundui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/profileprovider.dart';
import '../utils/colors.dart';
import 'notification.dart';

class FundsUi extends StatefulWidget {
  const FundsUi({super.key});

  @override
  State<FundsUi> createState() => _FundsUiState();
}

class _FundsUiState extends State<FundsUi> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map> funds = [
    {
      "leadingimage": "assets/images/Coins.png",
      "title": "Add Fund",
      "Subtitle": "You can add fund to your wallet"
    },
    {
      "leadingimage": "assets/images/Request Money.png",
      "title": "Withdraw Fund",
      "Subtitle": "You can withdraw winnings"
    },
    {
      "leadingimage": "assets/images/Bank Building.png",
      "title": "Withdraw Methods",
      "Subtitle": "You can add your band details for withdrawls"
    },
    {
      "leadingimage": "assets/images/Depositt.png",
      "title": "Fund Deposit History",
      "Subtitle": "You can see history of you deposit"
    },
    {
      "leadingimage": "assets/images/Order History.png",
      "title": "Fund Withdraw History",
      "Subtitle": "You can see history of you fund withdrawals"
    },
    {
      "leadingimage": "assets/images/Change.png",
      "title": "Bank Changes History",
      "Subtitle": "You can see history og your bank accounts"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: SizedBox(
                  width: 50,
                  height: 30,
                  child: Image.asset("assets/demoimages/menu-bar.png")),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent, // primaryColor,
        foregroundColor: blackClr,
        title: const Text(
          "Funds",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          SizedBox(
              width: 25, child: Image.asset("assets/demoimages/wallet.png")),
          const SizedBox(
            width: 5,
          ),
          Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
              return Center(
                child: Text(
                  "${profileProvider.profileModelData.profile?[0].walletBalance}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              );
            },
          ),
          const SizedBox(
            width: 15,
          ),
          Center(
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return const NotificationUi();
                  }));
                },
                child: CircleAvatar(
                    maxRadius: 17,
                    backgroundColor: greyDarkClr,
                    child: Icon(
                      Icons.notifications_active_outlined,
                      color: primaryColor,
                    ))),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: funds.length,
              itemBuilder: (context, index) {
                Map data = funds[index];
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const AddFundUi();
                      }));
                    } else if (index == 1) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const WithdrawFundUi();
                      }));
                    } else if (index == 2) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const AddBankDetailOneUi();
                      }));
                    } else if (index == 3) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const FundDepositHistoryUi();
                      }));
                    } else if (index == 4) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const FundWithdrawHistoryUi();
                      }));
                    } else if (index == 5) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const BankChangeHistoryUi();
                      }));
                    }
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(color: clrWhite, boxShadow: [
                      BoxShadow(color: primaryColor, blurRadius: 2)
                    ]),
                    child: ListTile(
                      leading: SizedBox(
                        height: 35,
                        child: Image.asset(data['leadingimage']),
                      ),
                      title: Text(
                        "${data['title']}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      subtitle: Text("${data['Subtitle']}"),
                      trailing: CircleAvatar(
                          backgroundColor: clrBlackLight,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: primaryColor,
                          )),
                    ),
                  ),
                );
              })),
      drawer: const DrawerManueUi(),
    );
  }
}
