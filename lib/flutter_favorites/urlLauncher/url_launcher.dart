import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherScreen extends StatefulWidget {
  const UrlLauncherScreen({super.key});

  @override
  State<UrlLauncherScreen> createState() => _UrlLauncherScreenState();
}

class _UrlLauncherScreenState extends State<UrlLauncherScreen> {
  Map<String, dynamic> selctedValue = {"id": 0, "name": "externalApplication"};
  int valueINT = 0;

  List<Map<String, dynamic>> items = [
    {"id": 0, "name": "externalApplication"},
    {"id": 1, "name": "externalNonBrowserApplication"},
    {"id": 2, "name": "inAppBrowserView"},
    {"id": 3, "name": "inAppWebView"},
    {"id": 4, "name": "platformDefault"},
  ];
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Type link that you want to open",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        hintText: "Past URL",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        disabledBorder: OutlineInputBorder(),
                        border: InputBorder.none),
                    controller: urlController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Choose URL Open Type : ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    height: 55,
                    width: double.infinity,
                    child: DropdownButton<int>(
                        iconEnabledColor: Colors.white,
                        dropdownColor: Colors.blue,
                        isExpanded: true,
                        value: selctedValue["id"],
                        items: items
                            .map((e) => DropdownMenuItem<int>(
                                value: e["id"],
                                child: Text(
                                  e["name"] as String,
                                  style: const TextStyle(color: Colors.white),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            valueINT = value!;
                            selctedValue = items[valueINT];
                            print(value);
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          log(valueINT.toString());
                          log("luacnhing...");
                          switch (valueINT) {
                            case 0:
                              await launchUrl(Uri.parse(urlController.text),
                                  mode: LaunchMode.externalApplication);
                              break;
                            case 1:
                              launchUrl(Uri.parse(urlController.text),
                                  mode:
                                      LaunchMode.externalNonBrowserApplication);
                              break;
                            case 2:
                              launchUrl(Uri.parse(urlController.text),
                                  mode: LaunchMode.inAppBrowserView);
                              break;
                            case 3:
                              launchUrl(Uri.parse(urlController.text),
                                  mode: LaunchMode.inAppWebView);
                              break;
                            case 4:
                              launchUrl(Uri.parse(urlController.text),
                                  mode: LaunchMode.platformDefault);
                              break;
                          }
                        },
                        child: const Text(
                          "Open",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
