import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerProductWidget extends StatefulWidget {
  const SellerProductWidget({
    Key key,
    this.store,
    this.productId,
    this.variantId,
  }) : super(key: key);

  final String store;
  final String productId;
  final String variantId;

  @override
  _SellerProductWidgetState createState() => _SellerProductWidgetState();
}

class _SellerProductWidgetState extends State<SellerProductWidget> {
  String radioButtonValue;
  int countControllerValue;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 1),
      child: StreamBuilder<List<StoresRecord>>(
        stream: queryStoresRecord(
          queryBuilder: (storesRecord) =>
              storesRecord.where('id', isEqualTo: widget.store),
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
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          List<StoresRecord> containerStoresRecordList = snapshot.data;
          final containerStoresRecord = containerStoresRecordList.isNotEmpty
              ? containerStoresRecordList.first
              : null;
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
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
              child: StreamBuilder<List<ProductsRecord>>(
                stream: queryProductsRecord(
                  queryBuilder: (productsRecord) =>
                      productsRecord.where('id', isEqualTo: widget.productId),
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<ProductsRecord> columnProductsRecordList = snapshot.data;
                  final columnProductsRecord =
                      columnProductsRecordList.isNotEmpty
                          ? columnProductsRecordList.first
                          : null;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 20),
                            child: StreamBuilder<List<VariantsRecord>>(
                              stream: queryVariantsRecord(
                                parent: columnProductsRecord.reference,
                                queryBuilder: (variantsRecord) =>
                                    variantsRecord.where('id',
                                        isEqualTo: FFAppState().currentVariant),
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
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Divider(
                                      thickness: 3,
                                      indent: 550,
                                      endIndent: 550,
                                      color: Color(0xFFDBE2E7),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 5, 0),
                                            child: Text(
                                              'Comprando en',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              containerStoresRecord.name,
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Text(
                                              'Elige la unidad',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FutureBuilder<
                                                      ApiCallResponse>(
                                                    future:
                                                        GetApplicableVariantsCall
                                                            .call(
                                                      productId:
                                                          columnProductsRecord
                                                              .id,
                                                      userLocation: FFAppState()
                                                          .locationKey,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                SpinKitFadingCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final rowGetApplicableVariantsResponse =
                                                          snapshot.data;
                                                      return Builder(
                                                        builder: (context) {
                                                          final units =
                                                              getJsonField(
                                                                    (rowGetApplicableVariantsResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.variants''',
                                                                  )?.toList() ??
                                                                  [];
                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: List.generate(
                                                                  units.length,
                                                                  (unitsIndex) {
                                                                final unitsItem =
                                                                    units[
                                                                        unitsIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      setState(() =>
                                                                          FFAppState().currentVariant =
                                                                              getJsonField(
                                                                            unitsItem,
                                                                            r'''$.id''',
                                                                          ).toString());
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            30,
                                                                            10,
                                                                            30,
                                                                            10),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            unitsItem,
                                                                            r'''$.unit''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 16,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      constraints: BoxConstraints(
                                        maxWidth: 500,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color: Color(0x16000000),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 20, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    columnProductsRecord
                                                        .mainImage,
                                                    'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                  ),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  height: 130,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 300,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: Text(
                                                          columnProductsRecord
                                                              .title,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Text(
                                                        formatNumber(
                                                          columnVariantsRecord
                                                              .publicPrice,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                          currency: '',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF1EEBBD),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 10),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            child: FutureBuilder<
                                                                ApiCallResponse>(
                                                              future:
                                                                  GetVariantInventoryByStoreCall
                                                                      .call(
                                                                productId: widget
                                                                    .productId,
                                                                variantId:
                                                                    columnVariantsRecord
                                                                        .id,
                                                                store: widget
                                                                    .store,
                                                                priceType: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.type,
                                                                    ''),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          SpinKitFadingCircle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            50,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final textGetVariantInventoryByStoreResponse =
                                                                    snapshot
                                                                        .data;
                                                                return Text(
                                                                  GetVariantInventoryByStoreCall
                                                                      .inventory(
                                                                    (textGetVariantInventoryByStoreResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFF8A8A8A),
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 10),
                                                          child: Text(
                                                            ' piezas disponibles',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF8A8A8A),
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 50,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 300,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                      ),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFE9E9E9),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child:
                                                            FlutterFlowCountController(
                                                          decrementIconBuilder:
                                                              (enabled) =>
                                                                  FaIcon(
                                                            FontAwesomeIcons
                                                                .minus,
                                                            color: enabled
                                                                ? Color(
                                                                    0xDD000000)
                                                                : Color(
                                                                    0xFFEEEEEE),
                                                            size: 20,
                                                          ),
                                                          incrementIconBuilder:
                                                              (enabled) =>
                                                                  FaIcon(
                                                            FontAwesomeIcons
                                                                .plus,
                                                            color: enabled
                                                                ? Color(
                                                                    0xFF1EEBBD)
                                                                : Color(
                                                                    0xFFEEEEEE),
                                                            size: 20,
                                                          ),
                                                          countBuilder:
                                                              (count) => Text(
                                                            count.toString(),
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Roboto',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          count:
                                                              countControllerValue ??=
                                                                  0,
                                                          updateCount: (count) =>
                                                              setState(() =>
                                                                  countControllerValue =
                                                                      count),
                                                          stepSize: 1,
                                                          minimum: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 10),
                                      child: Text(
                                        'Elige tu tipo de Envío',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FlutterFlowRadioButton(
                                            options: [
                                              'Express 30 min',
                                              '1-5 días',
                                              'Recoger en Tienda'
                                            ].toList(),
                                            initialValue: 'Recoger en Tienda',
                                            onChanged: (value) {
                                              setState(() =>
                                                  radioButtonValue = value);
                                            },
                                            optionHeight: 50,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                    ),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.vertical,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            inactiveRadioButtonColor:
                                                Color(0xFF8A8A8A),
                                            toggleable: false,
                                            horizontalAlignment:
                                                WrapAlignment.center,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await actions
                                              .addProductSellerWiseCart(
                                            columnProductsRecord.id,
                                            columnVariantsRecord.id,
                                            valueOrDefault<String>(
                                              radioButtonValue,
                                              'Recoger en Tienda',
                                            ),
                                            countControllerValue,
                                            containerStoresRecord.id,
                                          );
                                          context.pushNamed(
                                            'CarritoPorSellers',
                                            params: {
                                              'storeId': serializeParam(
                                                  widget.store,
                                                  ParamType.String),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'Agregar al carrito',
                                        options: FFButtonOptions(
                                          width: 300,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 5,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
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
        },
      ),
    );
  }
}
