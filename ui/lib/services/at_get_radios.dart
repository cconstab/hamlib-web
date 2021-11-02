import 'dart:convert';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:ui/models/radio_model.dart';

Future<List<HamRadio>> getHamradio(List<HamRadio> radios) async {
  String? currentAtsign;
  late AtClient atClient;
  late AtClientManager atClientManager;

  print('MADE IT TO METHOD');

  atClientManager = AtClientManager.getInstance();
  atClient = atClientManager.atClient;
  currentAtsign = atClient.getCurrentAtSign();
  currentAtsign = currentAtsign!.toUpperCase();

  var key = AtKey()
    ..key = 'numberRadios'
    ..sharedWith = currentAtsign;

  var atRadiocount = await atClient.get(key);
  if (atRadiocount.value != null) {
    // radios = [];
    List<HamRadio> newradios = [];
    print('GET RADIO COUNT:' + atRadiocount.value);
    var val = atRadiocount.value;
    int radioCount = int.parse(val);

    for (var i = 0; i < radioCount; i++) {
      print(i.toString());

      var key = AtKey()
        ..key = i.toString() + '.radio'
        ..sharedWith = currentAtsign;
      var value = await atClient.get(key);
      String valueString = value.value;

      var radioMap = jsonDecode(valueString);
      var newradio = HamRadio.fromJsonBasic(radioMap);
      newradios.add(newradio);
    }
    radios = newradios;
  }

  return (radios);
}
