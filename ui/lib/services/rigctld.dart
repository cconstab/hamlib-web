import 'dart:io';
import 'dart:typed_data';

import 'package:ui/models/radio_model.dart';


void rigCTLd(HamRadio hamradio) async {
 
  String serverResponse = '';

  // connect to the socket server
  final socket =
      await Socket.connect(hamradio.ipAddress, int.parse(hamradio.portNumber));

  socket.listen(
    // handle data from the server
    (Uint8List data) {
      serverResponse = String.fromCharCodes(data);

      // Grab Frequency)
      if (serverResponse.contains('get_freq:-Frequency:') &&
          serverResponse.contains('-RPRT 0')) {
        var freq = serverResponse.split(' ');
        String frequency = freq[1];
        frequency = frequency.replaceFirst(RegExp('r*-RPRT'), '');
        hamradio.vfoaFrequency = frequency;
      }
      // Grab Modulation Mode
      // Be aware sometimes the TCP packet
      // Can include both Frequency and Modulation Mode
      // Hence fancy RegExp!
      if (serverResponse.contains('get_mode:-Mode:') &&
          serverResponse.contains('Passband:')) {
        String mode = serverResponse.replaceFirst(RegExp('((.|\n)*).+?(?=Mode)'), '');
        List modelist = mode.split(' ');
        String mmode = modelist[1];
        mmode = mmode.replaceFirst(RegExp('r*-Passband:'), '');
        // If no Modulation mode give then 
        // Likley Digital or Dstar
        if (mmode == '') {
          mmode = 'DIG';
        }
        hamradio.vfoaModulationMode = mmode;
      }
    },

    // handle errors
    onError: (error) {
      socket.destroy();
    },

    // handle server ending connection
    onDone: () {
      socket.destroy();
    },
  );

  await sendMessage(socket, '-f -m\n');
}

Future<void> sendMessage(Socket socket, String message) async {
  socket.write(message);
  await Future.delayed(const Duration(seconds: 2));
  socket.destroy();
}
