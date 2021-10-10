import 'package:ui/screens/main_screen.dart';

import '../theme/ui_theme.dart';
//import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
// import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateRadioWidget extends StatefulWidget {
  const CreateRadioWidget({Key key}) : super(key: key);

  @override
  _CreateRadioWidgetState createState() => _CreateRadioWidgetState();
}

class _CreateRadioWidgetState extends State<CreateRadioWidget> {
   TextEditingController textController1;
   TextEditingController textController2;
   TextEditingController textController3;
   TextEditingController textController4;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: 'Icom 705');
    textController2 = TextEditingController(text: '192.168.1.x');
    textController3 = TextEditingController(text: '1705');
    textController4 = TextEditingController(text: 'Listening on');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        decoration: BoxDecoration(
          color: UItheme.richBlackFOGRA29,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create New Radio',
                          style: UItheme.title1.override(
                            fontFamily: 'Poppins',
                            color: UItheme.middleBlueGreen,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'Enter Network & text details',
                            textAlign: TextAlign.start,
                            style: UItheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: UItheme.viridianGreen,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: TextFormField(
                  onChanged: (_) => setState(() {}),
                  controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Radio Name',
                    labelStyle: UItheme.title3.override(
                      fontFamily: 'Poppins',
                      color: UItheme.viridianGreen,
                    ),
                    hintText: 'Name of  this radio',
                    hintStyle: UItheme.title3.override(
                      fontFamily: 'Poppins',
                      color: UItheme.viridianGreen,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: textController1.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController1.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: UItheme.mahogany,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: UItheme.title3.override(
                    fontFamily: 'Poppins',
                    color: UItheme.viridianGreen,
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Must have radio name';
                    }
                    if (val.length < 4) {
                      return 'Minimum 4 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: TextFormField(
                  onChanged: (_) => setState(() {}),
                  controller: textController2,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'IP Address',
                    labelStyle: UItheme.title3.override(
                      fontFamily: 'Poppins',
                      color: UItheme.viridianGreen,
                    ),
                    hintText: 'IP address of rigctld server',
                    hintStyle: UItheme.title3.override(
                      fontFamily: 'Poppins',
                      color: UItheme.viridianGreen,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: textController2.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController2.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: UItheme.mahogany,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: UItheme.title3.override(
                    fontFamily: 'Poppins',
                    color: UItheme.viridianGreen,
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Must have radio name';
                    }
                    if (val.length < 4) {
                      return 'Minimum 4 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: TextFormField(
                  onChanged: (_) => setState(() {}),
                  controller: textController3,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Port number',
                    labelStyle: UItheme.title3.override(
                      fontFamily: 'Poppins',
                      color: UItheme.viridianGreen,
                    ),
                    hintText: 'TCP port of rigctld server',
                    hintStyle: UItheme.title3.override(
                      fontFamily: 'Poppins',
                      color: UItheme.viridianGreen,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: textController3.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController3.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: UItheme.mahogany,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: UItheme.title3.override(
                    fontFamily: 'Poppins',
                    color: UItheme.viridianGreen,
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Must have radio name';
                    }
                    if (val.length < 4) {
                      return 'Minimum 4 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: TextFormField(
                  onChanged: (_) => setState(() {}),
                  controller: textController4,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Custom text',
                    labelStyle: UItheme.title3.override(
                      fontFamily: 'Poppins',
                      color: UItheme.viridianGreen,
                    ),
                    hintText: 'Text mesage for other Hams',
                    hintStyle: UItheme.title3.override(
                      fontFamily: 'Poppins',
                      color: UItheme.viridianGreen,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: textController4.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController4.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: UItheme.mahogany,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: UItheme.title3.override(
                    fontFamily: 'Poppins',
                    color: UItheme.viridianGreen,
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Must have radio name';
                    }
                    if (val.length < 4) {
                      return 'Minimum 4 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton1 = true);
                        try {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton1 = false);
                        }
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: UItheme.richBlackFOGRA29,
                        textStyle: UItheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: UItheme.viridianGreen,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                      loading: _loadingButton1,
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton2 = true);
                        try {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen()
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton2 = false);
                        }
                      },
                      text: 'Submit',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: UItheme.viridianGreen,
                        textStyle: UItheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                      loading: _loadingButton2,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
