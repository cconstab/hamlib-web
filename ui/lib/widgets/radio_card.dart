import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:ui/models/radio_model.dart';

class RadioCard extends StatefulWidget {
  final HamRadio hamradio;
  final Function deleteradio;
  final Function activeradio;

  const RadioCard({Key key, this.hamradio, this.deleteradio, this.activeradio})
      : super(key: key);

  @override
  _RadioCardState createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  _RadioCardState();
  @override
  Widget build(BuildContext context) {
    HamRadio radio = widget.hamradio;
    Function deletecard = widget.deleteradio;
    Function activeradio = widget.activeradio;

    return ExpansionCard(
        initiallyExpanded: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(radio.radioName,
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
            // ignore: prefer_const_constructors
            Text(
                "VFO A ${radio.vfoaFrequency.toString().padRight(10)} ${radio.vfoaModulationMode}",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
            // ignore: prefer_const_constructors
            Text(
                "VFO B ${radio.vfobFrequency.toString().padRight(10)} ${radio.vfobModulationMode}",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED', fontSize: 20, letterSpacing: 5)),
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
          Column(children: [
            Row(children: [
              TextButton.icon(
                  onPressed: deletecard,
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text(
                    'DELETE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'LED',
                        letterSpacing: 5),
                  )),
              const Spacer(),
              TextButton.icon(
                  onPressed: deletecard,
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text(
                    'EDIT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'LED',
                        letterSpacing: 5),
                  )),
            ]),
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: CheckboxListTile(
                  value: radio.active,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (newValue) {
                    setState(() {
                      print('hello');
                      activeradio.call(newValue);
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                  selectedTileColor: Colors.white,
                  //tileColor: Colors.white,
                  title: const Text(
                    'ACTIVE',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'LED',
                        letterSpacing: 5),
                  ),
                ))
          ])
        ]);
  }
}
