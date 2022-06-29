import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/toggle_like_product_white_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeProductDestacadosWidget extends StatefulWidget {
  const HomeProductDestacadosWidget({
    Key key,
    this.orderBy,
  }) : super(key: key);

  final String orderBy;

  @override
  _HomeProductDestacadosWidgetState createState() =>
      _HomeProductDestacadosWidgetState();
}

class _HomeProductDestacadosWidgetState
    extends State<HomeProductDestacadosWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if ((widget.orderBy) == 'likes')
            StreamBuilder<List<ProductsRecord>>(
              stream: queryProductsRecord(
                queryBuilder: (productsRecord) =>
                    productsRecord.where('isWeekFavorite', isEqualTo: true),
                limit: 5,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: SpinKitFadingCircle(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                List<ProductsRecord> rowProductsRecordList = snapshot.data;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(rowProductsRecordList.length, (rowIndex) {
                      final rowProductsRecord = rowProductsRecordList[rowIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                        child: AuthUserStreamWidget(
                          child: FutureBuilder<ApiCallResponse>(
                            future: GetOneVariantCall.call(
                              productId: rowProductsRecord.id,
                              userLocation: FFAppState().locationKey,
                              userType:
                                  valueOrDefault(currentUserDocument?.type, ''),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final stackGetOneVariantResponse = snapshot.data;
                              return Container(
                                width: 200,
                                child: Stack(
                                  alignment: AlignmentDirectional(1, 1),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child:
                                            StreamBuilder<List<VariantsRecord>>(
                                          stream: queryVariantsRecord(
                                            parent: rowProductsRecord.reference,
                                            queryBuilder: (variantsRecord) =>
                                                variantsRecord.where('id',
                                                    isEqualTo:
                                                        GetOneVariantCall.id(
                                                      (stackGetOneVariantResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString()),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitFadingCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<VariantsRecord>
                                                containerVariantsRecordList =
                                                snapshot.data;
                                            final containerVariantsRecord =
                                                containerVariantsRecordList
                                                        .isNotEmpty
                                                    ? containerVariantsRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: 170,
                                              height: 280,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0, 0.9),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 200,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, -1),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            rowProductsRecord
                                                                .title
                                                                .maybeHandleOverflow(
                                                              maxChars: 50,
                                                              replacement: '…',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 120,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0),
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          5,
                                                                          0),
                                                                  child: Text(
                                                                    '\$',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 0),
                                                                child: Text(
                                                                  GetOneVariantCall
                                                                      .price(
                                                                    (stackGetOneVariantResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
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
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, -1),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() =>
                                              FFAppState().currentVariant =
                                                  GetOneVariantCall.id(
                                                (stackGetOneVariantResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString());
                                          context.pushNamed(
                                            'ProductPage',
                                            queryParams: {
                                              'productId': serializeParam(
                                                  rowProductsRecord.id,
                                                  ParamType.String),
                                            }.withoutNulls,
                                          );
                                          await actions.productViewed(
                                            rowProductsRecord.id,
                                          );

                                          final usersUpdateData = {
                                            'recentlyViewed':
                                                FieldValue.arrayUnion(
                                                    [rowProductsRecord.id]),
                                          };
                                          await currentUserReference
                                              .update(usersUpdateData);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              rowProductsRecord.saleImage,
                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FDise%C3%B1o%20sin%20t%C3%ADtulo%20(1).png?alt=media&token=96c985a1-8023-4ffe-b992-4d534a2e3767',
                                            ),
                                            width: 140,
                                            height: 165,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.85, -0.85),
                                      child: ToggleLikeProductWhiteWidget(
                                        productId: rowProductsRecord.id,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          if ((widget.orderBy) == 'sales')
            StreamBuilder<List<ProductsRecord>>(
              stream: queryProductsRecord(
                queryBuilder: (productsRecord) =>
                    productsRecord.where('isMostSold', isEqualTo: true),
                limit: 5,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: SpinKitFadingCircle(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                List<ProductsRecord> rowProductsRecordList = snapshot.data;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(rowProductsRecordList.length, (rowIndex) {
                      final rowProductsRecord = rowProductsRecordList[rowIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                        child: AuthUserStreamWidget(
                          child: FutureBuilder<ApiCallResponse>(
                            future: GetOneVariantCall.call(
                              productId: rowProductsRecord.id,
                              userLocation: FFAppState().locationKey,
                              userType:
                                  valueOrDefault(currentUserDocument?.type, ''),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final stackGetOneVariantResponse = snapshot.data;
                              return Container(
                                width: 200,
                                child: Stack(
                                  alignment: AlignmentDirectional(1, 1),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child:
                                            StreamBuilder<List<VariantsRecord>>(
                                          stream: queryVariantsRecord(
                                            parent: rowProductsRecord.reference,
                                            queryBuilder: (variantsRecord) =>
                                                variantsRecord.where('id',
                                                    isEqualTo:
                                                        GetOneVariantCall.id(
                                                      (stackGetOneVariantResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString()),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitFadingCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<VariantsRecord>
                                                containerVariantsRecordList =
                                                snapshot.data;
                                            final containerVariantsRecord =
                                                containerVariantsRecordList
                                                        .isNotEmpty
                                                    ? containerVariantsRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: 170,
                                              height: 280,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(-1, -1),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0, 0.9),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 200,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, -1),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            rowProductsRecord
                                                                .title
                                                                .maybeHandleOverflow(
                                                              maxChars: 50,
                                                              replacement: '…',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 120,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0),
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          5,
                                                                          0),
                                                                  child: Text(
                                                                    '\$',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 0),
                                                                child: Text(
                                                                  GetOneVariantCall
                                                                      .price(
                                                                    (stackGetOneVariantResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
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
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.85, -0.85),
                                      child: ToggleLikeProductWhiteWidget(
                                        productId: rowProductsRecord.id,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, -1),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() =>
                                              FFAppState().currentVariant =
                                                  GetOneVariantCall.id(
                                                (stackGetOneVariantResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString());
                                          context.pushNamed(
                                            'ProductPage',
                                            queryParams: {
                                              'productId': serializeParam(
                                                  rowProductsRecord.id,
                                                  ParamType.String),
                                            }.withoutNulls,
                                          );
                                          await actions.productViewed(
                                            rowProductsRecord.id,
                                          );

                                          final usersUpdateData = {
                                            'recentlyViewed':
                                                FieldValue.arrayUnion(
                                                    [rowProductsRecord.id]),
                                          };
                                          await currentUserReference
                                              .update(usersUpdateData);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              rowProductsRecord.saleImage,
                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FDise%C3%B1o%20sin%20t%C3%ADtulo%20(1).png?alt=media&token=96c985a1-8023-4ffe-b992-4d534a2e3767',
                                            ),
                                            width: 140,
                                            height: 165,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          if ((widget.orderBy) == 'sale')
            StreamBuilder<List<ProductsRecord>>(
              stream: queryProductsRecord(
                queryBuilder: (productsRecord) =>
                    productsRecord.where('isInSale', isEqualTo: true),
                limit: 5,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: SpinKitFadingCircle(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                List<ProductsRecord> rowProductsRecordList = snapshot.data;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(rowProductsRecordList.length, (rowIndex) {
                      final rowProductsRecord = rowProductsRecordList[rowIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                        child: AuthUserStreamWidget(
                          child: FutureBuilder<ApiCallResponse>(
                            future: GetOneVariantCall.call(
                              productId: rowProductsRecord.id,
                              userLocation: FFAppState().locationKey,
                              userType:
                                  valueOrDefault(currentUserDocument?.type, ''),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final stackGetOneVariantResponse = snapshot.data;
                              return Container(
                                width: 200,
                                child: Stack(
                                  alignment: AlignmentDirectional(1, 0),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child:
                                            StreamBuilder<List<VariantsRecord>>(
                                          stream: queryVariantsRecord(
                                            parent: rowProductsRecord.reference,
                                            queryBuilder: (variantsRecord) =>
                                                variantsRecord.where('id',
                                                    isEqualTo:
                                                        GetOneVariantCall.id(
                                                      (stackGetOneVariantResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString()),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitFadingCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<VariantsRecord>
                                                containerVariantsRecordList =
                                                snapshot.data;
                                            final containerVariantsRecord =
                                                containerVariantsRecordList
                                                        .isNotEmpty
                                                    ? containerVariantsRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: 170,
                                              height: 280,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(-1, -1),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0, 0.9),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 200,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, -1),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            rowProductsRecord
                                                                .title
                                                                .maybeHandleOverflow(
                                                              maxChars: 50,
                                                              replacement: '…',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 120,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0),
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          5,
                                                                          0),
                                                                  child: Text(
                                                                    '\$',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 0),
                                                                child: Text(
                                                                  GetOneVariantCall
                                                                      .price(
                                                                    (stackGetOneVariantResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
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
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.8, -0.85),
                                      child: ToggleLikeProductWhiteWidget(
                                        productId: rowProductsRecord.id,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, -1),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() =>
                                              FFAppState().currentVariant =
                                                  GetOneVariantCall.id(
                                                (stackGetOneVariantResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString());
                                          context.pushNamed(
                                            'ProductPage',
                                            queryParams: {
                                              'productId': serializeParam(
                                                  rowProductsRecord.id,
                                                  ParamType.String),
                                            }.withoutNulls,
                                          );
                                          await actions.productViewed(
                                            rowProductsRecord.id,
                                          );

                                          final usersUpdateData = {
                                            'recentlyViewed':
                                                FieldValue.arrayUnion(
                                                    [rowProductsRecord.id]),
                                          };
                                          await currentUserReference
                                              .update(usersUpdateData);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              rowProductsRecord.saleImage,
                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FDise%C3%B1o%20sin%20t%C3%ADtulo%20(1).png?alt=media&token=96c985a1-8023-4ffe-b992-4d534a2e3767',
                                            ),
                                            width: 140,
                                            height: 165,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
