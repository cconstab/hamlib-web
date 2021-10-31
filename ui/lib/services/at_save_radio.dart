import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:ui/models/radio_model.dart';

void saveHamradio(List<HamRadio> radios) async {
  String? currentAtsign;
  late AtClient atClient;
  late AtClientManager atClientManager;

  atClientManager = AtClientManager.getInstance();
  atClient = atClientManager.atClient;
  currentAtsign = atClient.getCurrentAtSign();
  currentAtsign = currentAtsign!.toUpperCase();

// Save the Number of radios
//
  var key = AtKey()
    ..key = 'numberRadios'
    ..sharedWith = currentAtsign;

  await atClient.put(key, radios.length.toString());

// Cylce throug radios and save them in 
// .radio extended namespace
// Only need to save Name, IP, Port 
// The rest is dynamic
  radios.map((hamradio) async {
    var index = radios.indexOf(hamradio);
    String radioindex = index.toString() + '.radio';
    var key = AtKey()
      ..key = radioindex
      ..sharedWith = currentAtsign;
    await atClient.put(key, hamradio.toJsonBasic().toString());
  }).toList();

}
