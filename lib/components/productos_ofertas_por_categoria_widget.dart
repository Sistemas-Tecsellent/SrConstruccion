import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductosOfertasPorCategoriaWidget extends StatefulWidget {
  const ProductosOfertasPorCategoriaWidget({
    Key key,
    this.filtro,
    this.categoryId,
  }) : super(key: key);

  final String filtro;
  final String categoryId;

  @override
  _ProductosOfertasPorCategoriaWidgetState createState() =>
      _ProductosOfertasPorCategoriaWidgetState();
}

class _ProductosOfertasPorCategoriaWidgetState
    extends State<ProductosOfertasPorCategoriaWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, -0.65),
            child: Image.network(
              'https://picsum.photos/seed/498/600',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
