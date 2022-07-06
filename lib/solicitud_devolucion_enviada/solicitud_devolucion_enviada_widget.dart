import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SolicitudDevolucionEnviadaWidget extends StatefulWidget {
  const SolicitudDevolucionEnviadaWidget({Key key}) : super(key: key);

  @override
  _SolicitudDevolucionEnviadaWidgetState createState() =>
      _SolicitudDevolucionEnviadaWidgetState();
}

class _SolicitudDevolucionEnviadaWidgetState
    extends State<SolicitudDevolucionEnviadaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Image.asset(
                  'assets/images/mcatd_1.png',
                  width: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 10),
                child: Text(
                  '¡Tu solicitud de devolución fue enviada!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 10),
                child: Text(
                  'Estamos validando tu información',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 2, 20, 0),
                child: Text(
                  'Esto tomará de 1 a 5 días hábiles. Te notificaremos cuando haya una respuesta.\n\nPodrás ver el estado de la devolución en tu historial de pedidos.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pop();
                      },
                      text: 'Continuar',
                      options: FFButtonOptions(
                        width: 250,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
