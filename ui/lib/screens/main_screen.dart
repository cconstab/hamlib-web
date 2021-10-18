//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:ui/main.dart';

import 'package:ui/screens/new_radio.dart';
import 'package:ui/theme/ui_theme.dart';
import 'package:ui/widgets/radio_card.dart';
import 'package:ui/data/radios.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String id = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? currentAtsign;
  late AtClient atClient;
  late AtClientManager atClientManager;
  


  @override
  void initState() {
    super.initState();
    atClientManager = AtClientManager.getInstance();
    atClient = atClientManager.atClient;
    currentAtsign = atClient.getCurrentAtSign();
    currentAtsign = currentAtsign!.toUpperCase();
  }

  @override
  void setState(VoidCallback fn) {
       super.setState(fn);
    // TODO: implement setState
        radios.sort((a, b) {
                  if (b.active) {
                    return 1;
                  }
                  return -1;
                });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          backgroundColor: UItheme.richBlackFOGRA29,
          appBar: AppBar(
            titleTextStyle: const TextStyle(
                fontFamily: 'LED', fontSize: 36, letterSpacing: 5),
            title: Text(
              '$currentAtsign UI',
            ),
            backgroundColor: UItheme.viridianGreen,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: UItheme.viridianGreen,
            onPressed: () async {
              print('pressed');
              //HamRadio newradio =
              //await Navigator.of(context).pushNamed(NewRadio.id);
              //radios.add(newradio);
              Navigator.of(context).pushNamed(NewRadio.id);
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
                    },
                    activeradio: (newvalue) {
                      setState(() {
                        hamradio.active = newvalue;
                      });
                    }))
                .toList(),
          )),
    );
  }
}
