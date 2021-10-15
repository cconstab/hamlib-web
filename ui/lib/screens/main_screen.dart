//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:ui/theme/ui_theme.dart';
import 'package:ui/widgets/radio_card.dart';
import 'package:ui/data/radios.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);
  static const String id = '/main';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              print('pressed');
            },
            child: const Icon(Mdi.plus),
          ),
          body: ListView(
            children: radios
                .map((hamradio) => RadioCard(
                    key: UniqueKey(),
                    hamradio: hamradio,
                    deleteradio: () {
                      setState(() {
                        radios.remove(hamradio);
                        print('SetState');
                      });
                    }))
                .toList(),
          )),
    );
  }
}
