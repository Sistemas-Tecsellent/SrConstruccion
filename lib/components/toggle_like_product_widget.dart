import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleLikeProductWidget extends StatefulWidget {
  const ToggleLikeProductWidget({
    Key key,
    this.productId,
  }) : super(key: key);

  final String productId;

  @override
  _ToggleLikeProductWidgetState createState() =>
      _ToggleLikeProductWidgetState();
}

class _ToggleLikeProductWidgetState extends State<ToggleLikeProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: ToggleIcon(
        onPressed: () async {
          setState(() => FFAppState().token = !FFAppState().token);
        },
        value: FFAppState().token,
        onIcon: Icon(
          Icons.favorite_sharp,
          color: FlutterFlowTheme.of(context).primaryColor,
          size: 25,
        ),
        offIcon: Icon(
          Icons.favorite_border,
          color: FlutterFlowTheme.of(context).primaryColor,
          size: 25,
        ),
      ),
    );
  }
}
