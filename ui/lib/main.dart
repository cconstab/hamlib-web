import 'dart:async';

import 'package:flutter/material.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:at_utils/at_logger.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:at_app_flutter/at_app_flutter.dart';
import 'package:ui/Theme/ui_theme.dart';
import 'package:ui/Screens/homescreen.dart';

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
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // * load the AtClientPreference in the background
  Future<AtClientPreference> futurePreference = loadAtClientPreference();
  AtClientPreference? atClientPreference;

  final AtSignLogger _logger = AtSignLogger(AtEnv.appNamespace);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // * The onboarding screen (first screen)
      home: Scaffold(
        backgroundColor: uiTheme.richBlackFOGRA29,
        appBar: AppBar(
          title: const Text('HamLib-Web'),
          backgroundColor: uiTheme.viridianGreen,
        ),
        body: Builder(
          builder: (context) => Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        uiTheme.viridianGreen)),
                onPressed: () async {
                  var preference = await futurePreference;
                  setState(() {
                    atClientPreference = preference;
                  });
                  Onboarding(
                    context: context,
                    atClientPreference: atClientPreference!,
                    domain: AtEnv.rootDomain,
                    rootEnvironment: AtEnv.rootEnvironment,
                    appAPIKey: AtEnv.appApiKey,
                    onboard: (value, atsign) {
                      _logger.finer('Successfully onboarded $atsign');
                    },
                    onError: (error) {
                      _logger.severe('Onboarding throws $error error');
                    },
                    nextScreen: const HomeScreen(),
                  );
                },
                child: const Text('Let\'s go!'),
              ),
              
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          uiTheme.viridianGreen)),
                  onPressed: () {print('pressed');},
                  child: const Text('Let\'s go!'),
                  )),
        ),
      ),
    );
  }
}
