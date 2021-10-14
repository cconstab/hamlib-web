//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:ui/theme/ui_theme.dart';
import 'package:ui/widgets/radio_card.dart';
import 'package:ui/models/radio_model.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);
  static const String id = '/main';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

List<HamRadio> radios = [
  HamRadio(
    radioName:"ICOM 7100",
    vfoaFrequency: 4000,
    vfoaModulationMode: "USB",
    vfoaOperatingMode: "Phone",
    vfobFrequency: 2000,
    vfobModulationMode: "LSB",
    vfobOperatingMode: "DSTAR",
    ipAddress: "192.168.1.2",
    portNumber: 7100
  ),
  HamRadio(
    radioName:"YAESU FT991a",
    vfoaFrequency: 4500,
    vfoaModulationMode: "USB",
    vfoaOperatingMode: "Digital",
    vfobFrequency: 3000,
    vfobModulationMode: "LSB",
    vfobOperatingMode: "Phone",
    ipAddress: "192.168.1.2",
    portNumber: 9100
  )

];

  // RadioCard bob =  RadioCard('ICOM 7100');
  // RadioCard bob1 =  RadioCard('YAESU FTDX3000');
  // RadioCard bob2 =  RadioCard('YAESU FT991');
  // RadioCard bob3 =  RadioCard('ICOM 705');
  // RadioCard bob4 =  RadioCard('YAESU FT300');
  // RadioCard bob5 =  RadioCard('YAESU FT400D');
  // RadioCard bob6 =  RadioCard('YAESU FT400D');
  // int i=29999;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: UItheme.richBlackFOGRA29,
          appBar: AppBar(
            titleTextStyle: const TextStyle(
                fontFamily: 'LED', fontSize: 36, letterSpacing: 5),
            title: const Text(
              'HAMLIB-WEB UI',
            ),
            backgroundColor: UItheme.viridianGreen,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: UItheme.viridianGreen,
            onPressed: () {
              // ignore: avoid_print
              print('pressed');
              //bob.changeFreq(i++);
            },
            child: const Icon(Mdi.plus),
          ),
          body: ListView(
            children: radios.map((hamradios) => RadioCard(hamradios)).toList(),
          )),
    );
  }
}
