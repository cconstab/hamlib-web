import 'dart:async';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:ui/models/radio_model.dart';
import 'package:at_commons/at_commons.dart';

updateAtsign(HamRadio hamradio) async {
  String? currentAtsign;
  late AtClient atClient;
  late AtClientManager atClientManager;

  atClientManager = AtClientManager.getInstance();
  atClient = atClientManager.atClient;
  currentAtsign = atClient.getCurrentAtSign();

  String message =
      ' listening on ${hamradio.vfoaFrequency} ${hamradio.vfoaModulationMode}';
  // Save radio Frequency and Mode
  var metaData = Metadata()
    ..isPublic = true
    ..isEncrypted = false
    ..ttl = 60;

  var key = AtKey()
    ..key = hamradio.radioName
    ..sharedBy = currentAtsign
    ..metadata = metaData;

  print('Updating: ' + key.toString() + '  :::  ' + message);
  await atClient.put(key, message);
}
