import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EnvioGratisWidget extends StatefulWidget {
  const EnvioGratisWidget({Key key}) : super(key: key);

  @override
  _EnvioGratisWidgetState createState() => _EnvioGratisWidgetState();
}

class _EnvioGratisWidgetState extends State<EnvioGratisWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        FaIcon(
          FontAwesomeIcons.shippingFast,
          color: Color(0xFF5AE93E),
          size: 9,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
          child: Text(
            'Envio Gratis',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF5AE93E),
                  fontSize: 9,
                ),
          ),
        ),
      ],
    );
  }
}
