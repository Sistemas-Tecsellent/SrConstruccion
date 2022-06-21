import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeInProductWidget extends StatefulWidget {
  const LikeInProductWidget({
    Key key,
    this.productId,
    this.color,
  }) : super(key: key);

  final String productId;
  final Color color;

  @override
  _LikeInProductWidgetState createState() => _LikeInProductWidgetState();
}

class _LikeInProductWidgetState extends State<LikeInProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: AuthUserStreamWidget(
        child: custom_widgets.LikedProductIc(
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
