import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:timer_builder/timer_builder.dart';

class RadioCard extends StatefulWidget {
  final String radioName;
  RadioCard(this.radioName, {Key key}) : super(key: key);

 
  @override
  _RadioCardState createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  _RadioCardState();
  @override
  Widget build(BuildContext context) {
    String radio = widget.radioName;
    int freq = 1000;
    return TimerBuilder.periodic(Duration(milliseconds: 1000),
        builder: (context) {
      freq = Random().nextInt(46000000);
      return ExpansionCard(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(radio,
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
            // ignore: prefer_const_constructors
            Text("VFO A $freq  USB",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
            // ignore: prefer_const_constructors
            Text("VFO B 14.217.00  USB",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
          ],
        ),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: const Text(
              "Content goes over here !",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
    });
  }
}
