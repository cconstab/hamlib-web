import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:ui/models/radio_model.dart';

class RadioCard extends StatefulWidget {
  final HamRadio hamradio;
  final Function delete;
  const RadioCard({Key key, this.hamradio, this.delete}) : super(key: key);

  @override
  _RadioCardState createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  _RadioCardState();
  @override
  Widget build(BuildContext context) {
    HamRadio radio = widget.hamradio;
    Function delete = widget.delete;
    return ExpansionCard(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(radio.radioName,
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
          // ignore: prefer_const_constructors
          Text(
              "VFO A ${radio.vfoaFrequency.toString().padRight(10)} ${radio.vfoaModulationMode}",
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
          // ignore: prefer_const_constructors
          Text(
              "VFO B ${radio.vfobFrequency.toString().padRight(10)} ${radio.vfobModulationMode}",
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
        ],
      ),
      children: <Widget>[
        const SizedBox(height: 12.0),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "IP ADDRESS  ${radio.ipAddress}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'LED',
                      letterSpacing: 5),
                  textAlign: TextAlign.left,
                ),
              ],
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PORT NUMBER  ${radio.portNumber}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'LED',
                  letterSpacing: 5),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            TextButton.icon(
                onPressed: delete,
                icon: const Icon(Icons.delete, color: Colors.white),
                label: const Text(
                  'DELETE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'LED',
                      letterSpacing: 5),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  'EDIT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'LED',
                      letterSpacing: 5),
                )),
          ],
        )
      ],
    );
  }
}
