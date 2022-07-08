import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListOptionsWidget extends StatefulWidget {
  const WishListOptionsWidget({Key key}) : super(key: key);

  @override
  _WishListOptionsWidgetState createState() => _WishListOptionsWidgetState();
}

class _WishListOptionsWidgetState extends State<WishListOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        constraints: BoxConstraints(
          maxWidth: 500,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Divider(
                          thickness: 3,
                          indent: 180,
                          endIndent: 180,
                          color: Color(0xFFDBE2E7),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 16, 0),
                                  child: Text(
                                    'Mis Favoritos',
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF090F13),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed('WishListProducts');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Productos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Stack(
                                      children: [
                                        if (functions.isGreaterThan(
                                                valueOrDefault<int>(
                                                  (currentUserDocument
                                                              ?.likedProducts
                                                              ?.toList() ??
                                                          [])
                                                      .length,
                                                  0,
                                                ),
                                                1) ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: AuthUserStreamWidget(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions
                                                      .substractOne(
                                                          valueOrDefault<int>(
                                                        (currentUserDocument
                                                                    ?.likedProducts
                                                                    ?.toList() ??
                                                                [])
                                                            .length,
                                                        0,
                                                      ))
                                                      .toString(),
                                                  '0',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFC5C5C5),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        if (functions.isEqualTo(
                                                valueOrDefault<int>(
                                                  (currentUserDocument
                                                              ?.likedProducts
                                                              ?.toList() ??
                                                          [])
                                                      .length,
                                                  0,
                                                ),
                                                1) ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: AuthUserStreamWidget(
                                              child: Text(
                                                '0',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFC5C5C5),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed('WishListSellers');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Tiendas',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Stack(
                                      children: [
                                        if (functions.isGreaterThan(
                                                valueOrDefault<int>(
                                                  (currentUserDocument
                                                              ?.likedStores
                                                              ?.toList() ??
                                                          [])
                                                      .length,
                                                  0,
                                                ),
                                                1) ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: AuthUserStreamWidget(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions
                                                      .substractOne(
                                                          valueOrDefault<int>(
                                                        (currentUserDocument
                                                                    ?.likedStores
                                                                    ?.toList() ??
                                                                [])
                                                            .length,
                                                        0,
                                                      ))
                                                      .toString(),
                                                  '0',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFC5C5C5),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        if (functions.isEqualTo(
                                                valueOrDefault<int>(
                                                  (currentUserDocument
                                                              ?.likedStores
                                                              ?.toList() ??
                                                          [])
                                                      .length,
                                                  0,
                                                ),
                                                1) ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: AuthUserStreamWidget(
                                              child: Text(
                                                '0',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFC5C5C5),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.storefront,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('WishMarcas');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Marcas',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Stack(
                                    children: [
                                      if (functions.isGreaterThan(
                                              valueOrDefault<int>(
                                                (currentUserDocument
                                                            ?.likedBrands
                                                            ?.toList() ??
                                                        [])
                                                    .length,
                                                0,
                                              ),
                                              1) ??
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: AuthUserStreamWidget(
                                            child: Text(
                                              valueOrDefault<String>(
                                                functions
                                                    .substractOne(
                                                        valueOrDefault<int>(
                                                      (currentUserDocument
                                                                  ?.likedBrands
                                                                  ?.toList() ??
                                                              [])
                                                          .length,
                                                      0,
                                                    ))
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFFC5C5C5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (functions.isEqualTo(
                                              valueOrDefault<int>(
                                                (currentUserDocument
                                                            ?.likedBrands
                                                            ?.toList() ??
                                                        [])
                                                    .length,
                                                0,
                                              ),
                                              1) ??
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: AuthUserStreamWidget(
                                            child: Text(
                                              '0',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFFC5C5C5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.list_alt_sharp,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
