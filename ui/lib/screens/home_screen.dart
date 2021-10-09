import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/Theme/ui_theme.dart';

import 'package:ui/widgets/onboarding_dialog.dart';

class HomeScreen extends StatelessWidget {
  static final String id = '/home';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UItheme.richBlackFOGRA29,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "HamLib-Web UI",
            style: GoogleFonts.poppins(
              fontSize: 36,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
              color: UItheme.viridianGreen
            ),
          ),
          OnboardingDialog()
        ],
      )),
    );
  }
}