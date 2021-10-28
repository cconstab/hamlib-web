import 'dart:io';
import 'dart:typed_data';

import 'package:ui/models/radio_model.dart';

void rigCTLd(HamRadio hamradio) async {
  String frequency = '144000000';
  String mmode = '---';
  String serverResponse = '';

  // connect to the socket server
  final socket =
      await Socket.connect(hamradio.ipAddress, int.parse(hamradio.portNumber));
  print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

  socket.listen(
    // handle data from the server
    (Uint8List data) {
      serverResponse = String.fromCharCodes(data);
      print('Server: $serverResponse');
    },

    // handle errors
    onError: (error) {
      print(error);
      socket.destroy();
    },

    // handle server ending connection
    onDone: () {
      print('Server left.');
      socket.destroy();
    },
  );

  // send some messages to the server
  await sendMessage(socket, 'f\n');
  frequency = serverResponse.trim();
  hamradio.vfoaSet(frequency, mmode);
}

Future<void> sendMessage(Socket socket, String message) async {
  print('Client: $message');
  socket.write(message);
  await Future.delayed(Duration(seconds: 2));
}
