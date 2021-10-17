import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:ui/theme/ui_theme.dart';

class NewRadio extends StatefulWidget {
  const NewRadio({Key key}) : super(key: key);
  static const String id = '/newradio';

  @override
  _NewRadioState createState() => _NewRadioState();
}

class _NewRadioState extends State<NewRadio> {
  final _formKey = GlobalKey <FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var p;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: UItheme.richBlackFOGRA29,
      appBar: AppBar(
        titleTextStyle:
            const TextStyle(fontFamily: 'LED', fontSize: 36, letterSpacing: 5),
        title: const Text(
          'HAMLIB-WEB UI',
        ),
        backgroundColor: UItheme.viridianGreen,
      ),
      body: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                initialValue: 'RADIO NAME',
                textCapitalization: TextCapitalization.characters,
                name: 'radioName',
                      style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'LED',
                      letterSpacing: 5)),
              FormBuilderTextField(
                initialValue: 'IP ADDRESS',
                name: 'ipAddress',
                      style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'LED',
                      letterSpacing: 5)),
              FormBuilderTextField(
                initialValue: 'PORT NUMBER',
                name: 'portNumber',
                      style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'LED',
                      letterSpacing: 5)),             
            ],
          )),
    ));
  }
}
