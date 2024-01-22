import 'package:earninggame/utils/colors.dart';
import 'package:flutter/material.dart';

class TestUi extends StatefulWidget {
  const TestUi({super.key});

  @override
  State<TestUi> createState() => _TestUiState();
}

class _TestUiState extends State<TestUi> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Ui update 2"),
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 300,
              color: Colors.teal,
            ),
            TabBar(
                labelColor: blackClr,
                controller: tabController,
                tabs: const [
                  Text("one"),
                  Text("one"),
                ]),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    // height: 400,
                    fit: FlexFit.loose,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                          controller: tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 400,
                                  color: blackClr,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  height: 400,
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 400,
                                  color: blackClr,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              color: Colors.green.shade400,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              color: Colors.yellow.shade300,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              color: Colors.blueGrey.shade400,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              color: Colors.redAccent.shade100,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              color: Colors.purple.shade200,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
