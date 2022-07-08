import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandOfertasWidget extends StatefulWidget {
  const BrandOfertasWidget({Key key}) : super(key: key);

  @override
  _BrandOfertasWidgetState createState() => _BrandOfertasWidgetState();
}

class _BrandOfertasWidgetState extends State<BrandOfertasWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
