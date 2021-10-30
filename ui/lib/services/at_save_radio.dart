import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:ui/models/radio_model.dart';

void saveHamradio(List<HamRadio> radios) {
  String? currentAtsign;
  late AtClient atClient;
  late AtClientManager atClientManager;

    atClientManager = AtClientManager.getInstance();
    atClient = atClientManager.atClient;
    currentAtsign = atClient.getCurrentAtSign();
    currentAtsign = currentAtsign!.toUpperCase();

  print(currentAtsign);

  radios.map((hamradio) {
    print(hamradio.radioName);
    print(hamradio.ipAddress);
    print(hamradio.portNumber);
  }).toList();
}
