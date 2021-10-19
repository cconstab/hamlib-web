import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:ui/theme/ui_theme.dart';
import 'package:ui/models/radio_model.dart';

class NewRadio extends StatefulWidget {
  const NewRadio({Key? key}) : super(key: key);
  static const String id = '/newradio';

  @override
  _NewRadioState createState() => _NewRadioState();
}

class _NewRadioState extends State<NewRadio> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: UItheme.richBlackFOGRA29,
            appBar: AppBar(
              titleTextStyle: const TextStyle(
                  fontFamily: 'LED', fontSize: 36, letterSpacing: 5),
              title: const Text(
                'NEW RADIO',
                textAlign: TextAlign.center,
              ),
              backgroundColor: UItheme.viridianGreen,
            ),
            body: FormBuilder(
                key: _formKey,
                child: Column(children: [
                  FormBuilderTextField(
                      initialValue: '',
                      textCapitalization: TextCapitalization.characters,
                      name: 'radioName',
                      decoration: const InputDecoration(
                        labelText: 'RADIO NAME',
                        fillColor: Colors.white,
                        focusColor: Colors.lightGreenAccent,
                        labelStyle: TextStyle(
                          color: UItheme.viridianGreen,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.maxLength(context, 16),
                        FormBuilderValidators.minLength(context, 5),
                        FormBuilderValidators.required(context)
                      ]),
                      style: const TextStyle(
                          color: UItheme.viridianGreen,
                          fontSize: 30,
                          fontFamily: 'LED',
                          letterSpacing: 5)),
                  FormBuilderTextField(
                      initialValue: '',
                      name: 'ipAddress',
                      decoration: const InputDecoration(
                        labelText: 'IP ADDRESS',
                        fillColor: Colors.white,
                        focusColor: Colors.lightGreenAccent,
                        labelStyle: TextStyle(
                          color: UItheme.viridianGreen,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.ip(context,
                            errorText: 'Enter Valid IP'),
                        FormBuilderValidators.required(context),
                      ]),
                      style: const TextStyle(
                          color: UItheme.viridianGreen,
                          fontSize: 30,
                          fontFamily: 'LED',
                          letterSpacing: 5)),
                  FormBuilderTextField(
                      initialValue: '',
                      name: 'portNumber',
                      decoration: const InputDecoration(
                        labelText: 'PORT NUMBER',
                        fillColor: Colors.white,
                        focusColor: Colors.lightGreenAccent,
                        labelStyle: TextStyle(
                          color: UItheme.viridianGreen,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.max(context, 65535),
                        FormBuilderValidators.min(context, 1025),
                         FormBuilderValidators.numeric(context),
                        FormBuilderValidators.required(context),
                      ]),
                      style: const TextStyle(
                          color: UItheme.viridianGreen,
                          fontSize: 30,
                          fontFamily: 'LED',
                          letterSpacing: 5)),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 20),
                      Expanded(
                        child: MaterialButton(
                          color: UItheme.alloyOrange,
                          child: const Text(
                            "Reset",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _formKey.currentState!.reset();
                          },
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: MaterialButton(
                          color: UItheme.viridianGreen,
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              String radioname = _formKey
                                  .currentState!.fields['radioName']!.value;
                              String ipaddress = _formKey
                                  .currentState!.fields['ipAddress']!.value;
                              String portnumber = _formKey
                                  .currentState!.fields['portNumber']!.value;
                              int portnumberint = int.parse(portnumber);
                              print(_formKey.currentState!.value);
                              print('$radioname:$ipaddress:$portnumber');
                              var newradio = HamRadio(
                                  radioName: radioname,
                                  // active: false,
                                  // vfoaFrequency: 0,
                                  // vfoaModulationMode: '',
                                  // vfoaOperatingMode: '',
                                  // vfobFrequency: 0,
                                  // vfobModulationMode: '',
                                  // vfobOperatingMode: '',
                                  ipAddress: ipaddress,
                                  portNumber: portnumberint);
                              Navigator.pop(context, newradio);
                            } else {
                              print("validation failed");
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  )
                ]))));
  }
}
