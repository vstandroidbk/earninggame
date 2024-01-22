import 'package:earninggame/utils/components.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class IdeaUi extends StatefulWidget {
  const IdeaUi({super.key});

  @override
  State<IdeaUi> createState() => _IdeaUiState();
}

class _IdeaUiState extends State<IdeaUi> {
  TextEditingController ideaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("Idea"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            customInputFieldPin(
                textalign: 12,
                ideaController,
                TextInputType.multiline,
                context,
                maxLines: 6,
                maxlength: 500,
                hintText: "Type your idea here"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: customElevatedButton(context, "Submit Your Idea", () {
                Navigator.pop(context);
                Navigator.pop(context);
                // Navigator.push(context, CupertinoPageRoute(builder: (context) {
                //   return const HomeUi();
                // }));
              }),
            )
          ],
        ),
      ),
    );
  }
}
