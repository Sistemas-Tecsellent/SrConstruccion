import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AjustesWidget extends StatefulWidget {
  const AjustesWidget({Key key}) : super(key: key);

  @override
  _AjustesWidgetState createState() => _AjustesWidgetState();
}

class _AjustesWidgetState extends State<AjustesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0x004B39EF),
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Ajustes',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                  child: Text(
                    'Cuenta',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 15, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('miCuenta');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Color(0xFF2F2F2F),
                        size: 20,
                      ),
                      title: Text(
                        'Editar Perfil',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF2F2F2F),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      tileColor: Color(0x00F5F5F5),
                      dense: false,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                  child: Text(
                    'Ajustes',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('NotificationesAjustes');
                    },
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.bell,
                        color: Color(0xFF2F2F2F),
                        size: 20,
                      ),
                      title: Text(
                        'Notificaciones',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF2F2F2F),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      tileColor: Color(0x00F5F5F5),
                      dense: false,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('SobreSrConstruccion');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.lightbulb_outlined,
                        color: Color(0xFF2F2F2F),
                        size: 20,
                      ),
                      title: Text(
                        'Sobre Sr. Construcción',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF2F2F2F),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      tileColor: Color(0x00F5F5F5),
                      dense: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
