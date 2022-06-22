import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductHomeWidget extends StatefulWidget {
  const ProductHomeWidget({Key key}) : super(key: key);

  @override
  _ProductHomeWidgetState createState() => _ProductHomeWidgetState();
}

class _ProductHomeWidgetState extends State<ProductHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0.35),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: Color(0xFFFDAE3C),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x1E000000),
              offset: Offset(3, 3),
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
