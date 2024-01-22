import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/material.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({super.key});

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  TextEditingController msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: primaryColor,
              minRadius: 25,
              child: Text(
                "c",
                style: TextStyle(fontSize: 30, color: blackClr),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "CHAT SUPPORT",
                  style: TextStyle(fontSize: 19),
                ),
                // Icon(Icons./)
                Text(
                  "Online",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: greyLightClr,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12))),
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Ram "),
                                Text(
                                  "I have other issue. ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("18 Dec 05:20 pm"))
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Dev "),
                                Text(
                                  "I have other issue. ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("18 Dec 05:20 pm"))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: customInputField(msgController, TextInputType.text,
                    hintText: "Type a message.....",
                    prefixIcon: const Icon(Icons.emoji_emotions_rounded)),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: primaryColor,
                foregroundColor: greyClr,
                minRadius: 25,
                child: const Icon(Icons.mic),
              )
            ],
          )
        ],
      ),
    );
  }
}
