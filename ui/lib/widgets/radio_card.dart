import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:ui/Theme/ui_theme.dart';
import 'package:ui/models/radio_model.dart';
import 'package:ui/services/formats.dart';
import 'package:ui/services/rigctld.dart';

class RadioCard extends StatefulWidget {
  final HamRadio hamradio;
  final VoidCallback? deleteradio;
  final VoidCallback? editradio;
  final Function activeradio;

  const RadioCard(
      {Key? key,
      required this.hamradio,
      required this.deleteradio,
      required this.editradio,
      required this.activeradio})
      : super(key: key);

  @override
  _RadioCardState createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  _RadioCardState();

 

  @override
  Widget build(BuildContext context) {
    HamRadio radio = widget.hamradio;
    VoidCallback? deletecard = widget.deleteradio;
    VoidCallback? editcard = widget.editradio;
    Function activeradio = widget.activeradio;
    rigCTLd(widget.hamradio);

    return ExpansionTileCard(
        baseColor: UItheme.richBlackFOGRA29,
        expandedColor: UItheme.richBlackFOGRA29,
        expandedTextColor: Colors.white,
        initiallyExpanded: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(radio.radioName,
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED',
                        fontSize: 30,
                        letterSpacing: 5,
                        color: Colors.green)),
            // ignore: prefer_const_constructors
            Text(
                "VFO A ${frequencyFormat(radio.vfoaFrequency.toString()).padRight(10)} ${radio.vfoaModulationMode}",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED',
                        fontSize: 30,
                        letterSpacing: 5,
                        color: Colors.white)),
            // ignore: prefer_const_constructors
            Text(
                "VFO B ${frequencyFormat(radio.vfobFrequency.toString()).padRight(10)} ${radio.vfobModulationMode}",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(
                        fontFamily: 'LED',
                        fontSize: 30,
                        letterSpacing: 5,
                        color: Colors.white)),
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
                onPressed: editcard,
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  'EDIT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'LED',
                      letterSpacing: 5),
                ),
              ),
              const Spacer(),
            ]),
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: CheckboxListTile(
                  value: radio.active,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (newValue) {
                    setState(() {
                      activeradio.call(newValue);
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                  selectedTileColor: Colors.white,
                  //tileColor: Colors.white,
                  title: const Text(
                    'ACTIVE',
                    textAlign: TextAlign.left,
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
