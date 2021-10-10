import 'package:flutter/material.dart';
import 'package:ui/Theme/ui_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/components/create_radio_widget.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/main';
  const MainScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UItheme.richBlackFOGRA29,
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
            child: AppBar(
                backgroundColor: UItheme.viridianGreen,
                automaticallyImplyLeading: true,
                flexibleSpace: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40, 40, 0, 0),
                  child: Text(
                    'HamLib-Web',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 36,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        color: UItheme.mahogany),
                  ),
                ))),
        floatingActionButton: FloatingActionButton(
          backgroundColor: UItheme.middleBlueGreen,
          elevation: 8,
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: 500,
                  child: CreateRadioWidget(),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
