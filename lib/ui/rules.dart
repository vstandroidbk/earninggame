import 'package:flutter/material.dart';

import '../utils/colors.dart';

class RulesUi extends StatefulWidget {
  const RulesUi({super.key});

  @override
  State<RulesUi> createState() => _RulesUiState();
}

class _RulesUiState extends State<RulesUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("Notice Board / Rules"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Withdraw Information",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const Text(
              "If Users Entered Wrong Bank Details We Are Not Responsible.",
              textAlign: TextAlign.center,
            ),
            const Text(
              "Before Requesting Withdraw Re-check Your Bank Details.",
              textAlign: TextAlign.center,
            ),
            const Text(
              "After Withdraw Request If There Is No Vaild Wallet Balance The Request Will Be Auto Declined.",
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 25,
                    child: Image.asset("assets/demoimages/whatsapp.png")),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "9897734033",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            const Text(
              "Unfair - Bets",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const Text(
              "If Admin Found Any Unfair-bets, Blocking Of Digits,Canning Or Match Fix Bets. Admin Has All Rights To Take Necessary Actions To Block The User",
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            const Text(
              "Cheating - Bets",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const Text(
              "If Admin Found Any Cheating, Hacking, Phishing. Admin Has All Rights To Take Necessary Actions To Block The User.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
