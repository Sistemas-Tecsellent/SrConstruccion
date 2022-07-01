import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SubcategoriasWidget extends StatefulWidget {
  const SubcategoriasWidget({Key key}) : super(key: key);

  @override
  _SubcategoriasWidgetState createState() => _SubcategoriasWidgetState();
}

class _SubcategoriasWidgetState extends State<SubcategoriasWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed('ServiciosSingle');
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Ferreteria.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Servicios',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'CategoriaSingle',
                      queryParams: {
                        'categoryId':
                            serializeParam('pisosYBanios', ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Baos.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Baños',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'CategoriaSingle',
                      queryParams: {
                        'categoryId':
                            serializeParam('carpinteria', ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Carpinteria.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Carpintería',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'CategoriaSingle',
                      queryParams: {
                        'categoryId':
                            serializeParam('electrico', ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Electricidad.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Electricidad',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'CategoriaSingle',
                      queryParams: {
                        'categoryId':
                            serializeParam('ferreteria', ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Ferreteria.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Ferreteria',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'CategoriaSingle',
                      queryParams: {
                        'categoryId':
                            serializeParam('maquinaria', ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Maquinaria.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Maquinaria',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'CategoriaSingle',
                      queryParams: {
                        'categoryId': serializeParam(
                            'materialesDeConstruccion', ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Materiales.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Materiales',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'CategoriaSingle',
                      queryParams: {
                        'categoryId':
                            serializeParam('pinturas', ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Pintura.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Pintura',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'CategoriaSingle',
                      queryParams: {
                        'categoryId':
                            serializeParam('aceros', ParamType.String),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: 85,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Aceros.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x12000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: AlignmentDirectional(0, 0.9),
                    child: Text(
                      'Aceros',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
