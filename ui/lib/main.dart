import 'dart:async';

import 'package:flutter/material.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:at_app_flutter/at_app_flutter.dart';
import 'package:ui/screens/main_screen.dart';
import 'package:ui/theme/ui_theme.dart';
import 'package:ui/screens/home_screen.dart';

void main() {
  AtEnv.load();
  runApp(const MyApp());
}


Future<AtClientPreference> loadAtClientPreference() async {
  var dir = await path_provider.getApplicationSupportDirectory();
  return AtClientPreference()
        ..rootDomain = AtEnv.rootDomain
        ..namespace = AtEnv.appNamespace
        ..hiveStoragePath = dir.path
        ..commitLogPath = dir.path
        ..isLocalStoreRequired = true
      // TODO set the rest of your AtClientPreference here
      ;
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // * load the AtClientPreference in the background
  Future<AtClientPreference> futurePreference = loadAtClientPreference();
  bool isFirstLoad = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HamLib-Web UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: UItheme.richBlackFOGRA29,
      ),
      // * The onboarding screen (first screen)
      routes: {
        HomeScreen.id: (_) => const HomeScreen(),
        MainScreen.id: (_) => const MainScreen()
      },
      initialRoute: HomeScreen.id,
    );
  }
}
