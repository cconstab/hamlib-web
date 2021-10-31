import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:ui/models/radio_model.dart';

Future<List> getHamradio(List<HamRadio> radios) async {
  String? currentAtsign;
  late AtClient atClient;
  late AtClientManager atClientManager;

  atClientManager = AtClientManager.getInstance();
  atClient = atClientManager.atClient;
  currentAtsign = atClient.getCurrentAtSign();
  currentAtsign = currentAtsign!.toUpperCase();

  var key = AtKey()
    ..key = 'numberRadios'
    ..sharedWith = currentAtsign;

  var atRadiocount = await atClient.get(key);
  int radioCount = int.parse(atRadiocount.value);

  for (var i = 0; i < radioCount; i++) {


    
  }

  // Pull in radios from @platform
  var keys = await atClient.getKeys(sharedWith: '@ai6bh');
  print('keys' + keys.toString());
  return (radios);
}
