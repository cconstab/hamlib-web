import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:ui/models/radio_model.dart';

class RadioCard extends StatefulWidget {
  final HamRadio hamradio;
  const RadioCard(this.hamradio, {Key key}) : super(key: key);

  @override
  _RadioCardState createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  _RadioCardState();
  @override
  Widget build(BuildContext context) {
    HamRadio radio = widget.hamradio;
    int freq = 1000;
    return TimerBuilder.periodic(Duration(milliseconds: 500),
        builder: (context) {
      freq = Random().nextInt(46000000);
      return ExpansionCard(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(radio.radioName,
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
            // ignore: prefer_const_constructors
            Text("VFO A $freq   ${radio.vfoaModulationMode}",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
            // ignore: prefer_const_constructors
            Text("VFO B 14.217.00 ${radio.vfobModulationMode}",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
          ],
        ),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: 
            
             Text(
              "IP Address ${radio.ipAddress}",
              style: TextStyle(color: Colors.white),
            )),
              Text(
              "Port Number ${radio.portNumber}",
              style: const TextStyle(color: Colors.white),

            )
        
        ],
      );
    });
  }
}
