import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/envio_gratis_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerFeedWidget extends StatefulWidget {
  const SellerFeedWidget({
    Key key,
    this.storeId,
  }) : super(key: key);

  final String storeId;

  @override
  _SellerFeedWidgetState createState() => _SellerFeedWidgetState();
}

class _SellerFeedWidgetState extends State<SellerFeedWidget> {
  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<ProductsRecord>>(
        stream: queryProductsRecord(
          queryBuilder: (productsRecord) => productsRecord
              .where('id',
                  whereIn: (currentUserDocument?.likedProducts?.toList() ?? []))
              .where('owner', isEqualTo: widget.storeId),
          limit: 20,
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
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(rowProductsRecordList.length, (rowIndex) {
              final rowProductsRecord = rowProductsRecordList[rowIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: FutureBuilder<ApiCallResponse>(
                  future: GetOneVariantCall.call(
                    productId: rowProductsRecord.id,
                    userLocation: FFAppState().locationKey,
                    userType: valueOrDefault(currentUserDocument?.type, ''),
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
                    final cageGetOneVariantResponse = snapshot.data;
                    return Container(
                      width: 180,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x17000000),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: StreamBuilder<List<VariantsRecord>>(
                          stream: queryVariantsRecord(
                            parent: rowProductsRecord.reference,
                            queryBuilder: (variantsRecord) =>
                                variantsRecord.where('id',
                                    isEqualTo: GetOneVariantCall.id(
                                      (cageGetOneVariantResponse?.jsonBody ??
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<VariantsRecord> columnVariantsRecordList =
                                snapshot.data;
                            final columnVariantsRecord =
                                columnVariantsRecordList.isNotEmpty
                                    ? columnVariantsRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'MarcaSingle',
                                          params: {
                                            'brandId': serializeParam(
                                                rowProductsRecord.brand,
                                                ParamType.String),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            rowProductsRecord.brandLogo,
                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Exclusivo en',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        StreamBuilder<List<StoresRecord>>(
                                          stream: queryStoresRecord(
                                            queryBuilder: (storesRecord) =>
                                                storesRecord.where('id',
                                                    isEqualTo: widget.storeId),
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
                                            List<StoresRecord>
                                                textStoresRecordList =
                                                snapshot.data;
                                            final textStoresRecord =
                                                textStoresRecordList.isNotEmpty
                                                    ? textStoresRecordList.first
                                                    : null;
                                            return InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'PerfilDelSeller',
                                                  queryParams: {
                                                    'storeId': serializeParam(
                                                        widget.storeId,
                                                        ParamType.String),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Text(
                                                textStoresRecord.name
                                                    .maybeHandleOverflow(
                                                  maxChars: 15,
                                                  replacement: '???',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                StreamBuilder<List<StoresRecord>>(
                                  stream: queryStoresRecord(
                                    queryBuilder: (storesRecord) => storesRecord
                                        .where('id', isEqualTo: widget.storeId),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<StoresRecord> imageStoresRecordList =
                                        snapshot.data;
                                    // Return an empty Container when the document does not exist.
                                    if (snapshot.data.isEmpty) {
                                      return Container();
                                    }
                                    final imageStoresRecord =
                                        imageStoresRecordList.isNotEmpty
                                            ? imageStoresRecordList.first
                                            : null;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'ProductPageSeller',
                                          params: {
                                            'storeName': serializeParam(
                                                imageStoresRecord.name,
                                                ParamType.String),
                                            'productId': serializeParam(
                                                rowProductsRecord.id,
                                                ParamType.String),
                                          }.withoutNulls,
                                          queryParams: {
                                            'storeId': serializeParam(
                                                widget.storeId,
                                                ParamType.String),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            rowProductsRecord.mainImage,
                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                          ),
                                          width: 150,
                                          height: 115,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (columnVariantsRecord.tags
                                                      .toList()
                                                      ?.contains('Oferta') ??
                                                  true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons.tag,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 9,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2, 0, 0, 0),
                                                        child: Text(
                                                          'Oferta',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 9,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (columnVariantsRecord.tags
                                                      .toList()
                                                      ?.contains(
                                                          'Envio Gratis') ??
                                                  true)
                                                Expanded(
                                                  child: EnvioGratisWidget(),
                                                ),
                                            ],
                                          ),
                                          Container(
                                            width: 139,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1, -0.45),
                                              child: Text(
                                                rowProductsRecord.title
                                                    .maybeHandleOverflow(
                                                  maxChars: 40,
                                                  replacement: '???',
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 139,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1, -0.45),
                                              child: Text(
                                                rowProductsRecord.sku
                                                    .maybeHandleOverflow(
                                                  maxChars: 40,
                                                  replacement: '???',
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF909090),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  columnVariantsRecord.unit,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 9,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -0.7),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 5),
                                                  child: Text(
                                                    '\$',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -0.7),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                                  child: Text(
                                                    GetOneVariantCall.price(
                                                      (cageGetOneVariantResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
