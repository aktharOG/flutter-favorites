import 'package:flutter/material.dart';
import 'package:flutter_favorites/flutter_favorites/sharedPreference/shared_preference.dart';
import 'package:flutter_favorites/flutter_favorites/sharedPreference/home.dart';
import 'package:flutter_favorites/flutter_favorites/urlLauncher/url_launcher.dart';

Future<void> main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      home: const UrlLauncherScreen(),
    );
  }
}
