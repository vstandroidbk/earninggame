import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SettingUi extends StatefulWidget {
  const SettingUi({super.key});

  @override
  State<SettingUi> createState() => _SettingUiState();
}

class _SettingUiState extends State<SettingUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("Settings"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: greyLightClr),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(color: primaryColor),
                      child: const Center(
                          child: Text(
                        "Notification setting",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ))),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Main Notification"),
                            Switch(
                                activeColor: primaryDarkClr,
                                value: true,
                                onChanged: (val) {})
                          ],
                        ),
                        const Divider(
                          height: 0,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Game Notification"),
                            Switch(
                                activeColor: primaryDarkClr,
                                value: false,
                                onChanged: (val) {})
                          ],
                        ),
                        const Divider(
                          height: 0,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("King Starline Notification"),
                            Switch(
                                activeColor: primaryDarkClr,
                                value: true,
                                onChanged: (val) {})
                          ],
                        ),
                        const Divider(
                          height: 0,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("King Jackpot Notification"),
                            Switch(
                                activeColor: primaryDarkClr,
                                value: true,
                                onChanged: (val) {})
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
