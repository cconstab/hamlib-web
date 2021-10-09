import '../components/create_radio_widget.dart';
// import '../flutter_flow/flutter_flow_animations.dart';
// import '../flutter_flow/flutter_flow_icon_button.dart';
import 'package:ui/theme/ui_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../settings/settings_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'appBarOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    createAnimations(animationsMap.values, this);
    startAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
        child: AppBar(
          backgroundColor: UItheme.viridianGreen,
          automaticallyImplyLeading: true,
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: Text(
              'HamLib-Web',
              textAlign: TextAlign.center,
              style: UItheme.title1.override(
                fontFamily: 'Poppins',
              ),
            ),
          ),
          actions: [],
          elevation: 4,
        ),
      ).animated([animationsMap['appBarOnPageLoadAnimation']]),
      backgroundColor: UItheme.richBlackFOGRA29,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: UItheme.middleBlueGreen,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
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
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: InkWell(
                  onLongPress: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsWidget(),
                      ),
                    );
                  },
                  child: Text(
                    'Icom IC-7100\n14.20000 Mhz\nUSB',
                    textAlign: TextAlign.center,
                    style: UItheme.bodyText1.override(
                      fontFamily: 'Share Tech',
                      color: UItheme.middleBlueGreen,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: InkWell(
                  onLongPress: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.scale,
                        alignment: Alignment.bottomCenter,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: SettingsWidget(),
                      ),
                    );
                  },
                  child: Text(
                    'Icom IC-705\n144.20000 Mhz\nUSB',
                    textAlign: TextAlign.center,
                    style: UItheme.bodyText1.override(
                      fontFamily: 'Share Tech',
                      color: UItheme.middleBlueGreen,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: InkWell(
                  onLongPress: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsWidget(),
                      ),
                    );
                  },
                  child: Text(
                    'FT991a\n446.000 Mhz\nFM',
                    textAlign: TextAlign.center,
                    style: UItheme.bodyText1.override(
                      fontFamily: 'Share Tech',
                      color: UItheme.middleBlueGreen,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
