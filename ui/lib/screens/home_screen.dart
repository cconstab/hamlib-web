import 'package:flutter/material.dart';
import 'package:ui/Theme/ui_theme.dart';

import 'package:ui/widgets/onboarding_dialog.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UItheme.richBlackFOGRA29,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            "HAMLIB-WEB UI",
            style:  TextStyle(fontFamily: 'LED', fontSize: 38, letterSpacing: 5, color: UItheme.viridianGreen, fontWeight: FontWeight.bold),

          ),
          OnboardingDialog()
        ],
      )),
    );
  }
}