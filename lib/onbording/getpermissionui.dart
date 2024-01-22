import 'package:earninggame/onbording/mobilenoui.dart';
import 'package:earninggame/providers/permissionprovider.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PermissionUi extends StatefulWidget {
  const PermissionUi({super.key});

  @override
  State<PermissionUi> createState() => _PermissionUiState();
}

class _PermissionUiState extends State<PermissionUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: SizedBox(
                      width: 100,
                      child: Image.asset(
                        "assets/demoimages/demoicon.png",
                        // color: primaryDarkClr,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<PermissionProvider>(
                  builder: (context, permissionProvider, child) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: permissionProvider.permisssion.length,
                        itemBuilder: (context, index) {
                          Map data = permissionProvider.permisssion[index];
                          return RadioListTile(
                            // toggleable: true,
                            activeColor: primaryColor,
                            secondary: SizedBox(
                                width: 40,
                                child: Image.asset(
                                  "${data['icon']}",
                                  color: primaryColor,
                                )),
                            value: 1,
                            groupValue: data['value'],
                            onChanged: (val) {
                              Provider.of<PermissionProvider>(context,
                                      listen: false)
                                  .setPermission(val, index);
                            },
                            isThreeLine: true,
                            controlAffinity: ListTileControlAffinity.trailing,
                            subtitle: Text("${data['subtitle']}"),
                            title: Text(
                              "${data['title']}",
                              // style: TextStyle(color: primaryColor),
                            ),
                          );
                        });
                  },
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child:
                  customElevatedButton(context, "ALLOW ALL ACCESS ", () async {
                // const microPermission = Permission.microphone;
                // debugPrint(
                //     "permission ====================== ${await microPermission.status}");
                // if (await microPermission.isDenied) {
                //   microPermission.request();
                //   debugPrint(
                //       "permission denied================================ denied");
                //   // openAppSettings();
                // } else if (microPermission.status ==
                //     PermissionStatus.permanentlyDenied) {
                //   openAppSettings();
                //   debugPrint(
                //       "permission denied forever================================ permantly");
                // } else {
                //   microPermission.request();
                //
                //   print("done =================================login done");
                // }
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return const MobileNoUi();
                }));
              }))
        ],
      )),
    );
  }
}
