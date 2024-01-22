import 'package:earninggame/ui/components/drawer.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ChangeMpinUi extends StatefulWidget {
  const ChangeMpinUi({super.key});

  @override
  State<ChangeMpinUi> createState() => _ChangeMpinUiState();
}

class _ChangeMpinUiState extends State<ChangeMpinUi> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController oldcontroller = TextEditingController();
  TextEditingController newController = TextEditingController();
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
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("Change MPIN"),
        actions: [
          SizedBox(
              width: 25, child: Image.asset("assets/demoimages/wallet.png")),
          const SizedBox(
            width: 5,
          ),
          const Center(
            child: Text(
              "500.00",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Center(
            child: InkWell(
                onTap: () {},
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
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 120,
            ),
            Center(
              child: SizedBox(
                height: 60,
                child: Image.asset("assets/demoimages/demoicon.png"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text("Enter Your Old MPIN"),
            customInputField(oldcontroller, TextInputType.number),
            const Text("Enter Your New MPIN"),
            customInputField(newController, TextInputType.number),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: customElevatedButtonTop(context, const Text("Change MPIN"),
                  () {
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      )),
      drawer: const DrawerManueUi(),
    );
  }
}
