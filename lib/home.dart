import 'package:flutter/material.dart';
import 'package:flutter_favorites/flutter_favorites/shared_preference.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  String name = "No Saved Data";
  
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  saveData() {
    SharedPrefrenceService().saveString(controller.text);
    controller.clear();
    getData();
    setState(() {});
  }

  getData() {
    if (SharedPrefrenceService().getString() != null) {
      name = SharedPrefrenceService().getString();
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Saved Data In SharedPreference",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(name),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Enter Name")),
              ),
            ),
            ElevatedButton(onPressed: saveData, child: const Text("Save")),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
