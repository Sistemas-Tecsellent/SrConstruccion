import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/filters_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListingSrConstruccionWidget extends StatefulWidget {
  const ProductListingSrConstruccionWidget({
    Key key,
    this.orderByPopularity,
    this.orderByPrice,
    this.filterBySale,
  }) : super(key: key);

  final bool orderByPopularity;
  final bool orderByPrice;
  final bool filterBySale;

  @override
  _ProductListingSrConstruccionWidgetState createState() =>
      _ProductListingSrConstruccionWidgetState();
}

class _ProductListingSrConstruccionWidgetState
    extends State<ProductListingSrConstruccionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0x00FFFFFF),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<ApiCallResponse>(
                  future: GetCartAmountCall.call(
                    uid: currentUserUid,
                    cartId: currentUserUid,
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
                    final buttonGetCartAmountResponse = snapshot.data;
                    return FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Carrito');
                      },
                      text: GetCartAmountCall.amount(
                        (buttonGetCartAmountResponse?.jsonBody ?? ''),
                      ).toString(),
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 120,
                        height: 40,
                        color: Color(0xFF1EEBBD),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFD1D1D1),
                          ),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: FiltersWidget(),
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.filter_list_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                      child: StreamBuilder<List<ProductsRecord>>(
                        stream: queryProductsRecord(
                          limit: 50,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitFadingCircle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<ProductsRecord> gridViewProductsRecordList =
                              snapshot.data;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              childAspectRatio: 0.65,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewProductsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewProductsRecord =
                                  gridViewProductsRecordList[gridViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 15, 15),
                                child: AuthUserStreamWidget(
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: GetOneVariantCall.call(
                                      productId: gridViewProductsRecord.id,
                                      userLocation: FFAppState().locationKey,
                                      userType: valueOrDefault(
                                          currentUserDocument?.type, ''),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitFadingCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      final containerGetOneVariantResponse =
                                          snapshot.data;
                                      return InkWell(
                                        onTap: () async {
                                          if ((gridViewProductsRecord.owner) ==
                                              'srconstruccion') {
                                            context.pushNamed(
                                              'ProductPage',
                                              params: {
                                                'productId': serializeParam(
                                                    gridViewProductsRecord.id,
                                                    ParamType.String),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            context.pushNamed(
                                              'ProductPageSeller',
                                              params: {
                                                'storeName': serializeParam(
                                                    gridViewProductsRecord
                                                        .ownerName,
                                                    ParamType.String),
                                                'productId': serializeParam(
                                                    gridViewProductsRecord.id,
                                                    ParamType.String),
                                              }.withoutNulls,
                                              queryParams: {
                                                'storeId': serializeParam(
                                                    gridViewProductsRecord
                                                        .owner,
                                                    ParamType.String),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: StreamBuilder<
                                                List<VariantsRecord>>(
                                              stream: queryVariantsRecord(
                                                parent: gridViewProductsRecord
                                                    .reference,
                                                queryBuilder: (variantsRecord) =>
                                                    variantsRecord.where('id',
                                                        isEqualTo:
                                                            GetOneVariantCall
                                                                .id(
                                                          (containerGetOneVariantResponse
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
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<VariantsRecord>
                                                    columnVariantsRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final columnVariantsRecord =
                                                    columnVariantsRecordList
                                                            .isNotEmpty
                                                        ? columnVariantsRecordList
                                                            .first
                                                        : null;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 5),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'MarcaSingle',
                                                                params: {
                                                                  'brandId': serializeParam(
                                                                      gridViewProductsRecord
                                                                          .brand,
                                                                      ParamType
                                                                          .String),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  gridViewProductsRecord
                                                                      .brandLogo,
                                                                  'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              gridViewProductsRecord
                                                                  .mainImage,
                                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                            ),
                                                            width: 100,
                                                            height: 100,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (columnVariantsRecord
                                                                .tags
                                                                .toList()
                                                                ?.contains(
                                                                    'Oferta') ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        3,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .tag,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  size: 9,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Oferta',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              9,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (columnVariantsRecord
                                                                .tags
                                                                .toList()
                                                                ?.contains(
                                                                    'Envio Gratis') ??
                                                            true)
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .shippingFast,
                                                                color: Color(
                                                                    0xFF5AE93E),
                                                                size: 11,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Envio Gratis',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFF5AE93E),
                                                                        fontSize:
                                                                            11,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 150,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        gridViewProductsRecord
                                                            .title
                                                            .maybeHandleOverflow(
                                                                maxChars: 40),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 150,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        gridViewProductsRecord
                                                            .sku
                                                            .maybeHandleOverflow(
                                                                maxChars: 40),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF909090),
                                                                  fontSize: 12,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 50,
                                                            height: 15,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Text(
                                                              columnVariantsRecord
                                                                  .unit,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            '\$',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Text(
                                                            GetOneVariantCall
                                                                .price(
                                                              (containerGetOneVariantResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                      child: StreamBuilder<List<ProductsRecord>>(
                        stream: queryProductsRecord(
                          limit: 30,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitFadingCircle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<ProductsRecord> gridViewProductsRecordList =
                              snapshot.data;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              childAspectRatio: 0.61,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewProductsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewProductsRecord =
                                  gridViewProductsRecordList[gridViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 15, 15),
                                child: AuthUserStreamWidget(
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: GetOneVariantCall.call(
                                      productId: gridViewProductsRecord.id,
                                      userLocation: FFAppState().locationKey,
                                      userType: valueOrDefault(
                                          currentUserDocument?.type, ''),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitFadingCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      final containerGetOneVariantResponse =
                                          snapshot.data;
                                      return InkWell(
                                        onTap: () async {
                                          if ((gridViewProductsRecord.owner) ==
                                              'srconstruccion') {
                                            context.pushNamed(
                                              'ProductPage',
                                              params: {
                                                'productId': serializeParam(
                                                    gridViewProductsRecord.id,
                                                    ParamType.String),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            context.pushNamed(
                                              'ProductPageSeller',
                                              params: {
                                                'storeName': serializeParam(
                                                    gridViewProductsRecord
                                                        .ownerName,
                                                    ParamType.String),
                                                'productId': serializeParam(
                                                    gridViewProductsRecord.id,
                                                    ParamType.String),
                                              }.withoutNulls,
                                              queryParams: {
                                                'storeId': serializeParam(
                                                    gridViewProductsRecord
                                                        .owner,
                                                    ParamType.String),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10,
                                                color: Color(0x17000000),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 10),
                                            child: StreamBuilder<
                                                List<VariantsRecord>>(
                                              stream: queryVariantsRecord(
                                                parent: gridViewProductsRecord
                                                    .reference,
                                                queryBuilder: (variantsRecord) =>
                                                    variantsRecord.where('id',
                                                        isEqualTo:
                                                            GetOneVariantCall
                                                                .id(
                                                          (containerGetOneVariantResponse
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
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<VariantsRecord>
                                                    columnVariantsRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final columnVariantsRecord =
                                                    columnVariantsRecordList
                                                            .isNotEmpty
                                                        ? columnVariantsRecordList
                                                            .first
                                                        : null;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 5),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'MarcaSingle',
                                                                params: {
                                                                  'brandId': serializeParam(
                                                                      gridViewProductsRecord
                                                                          .brand,
                                                                      ParamType
                                                                          .String),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  gridViewProductsRecord
                                                                      .brandLogo,
                                                                  'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            gridViewProductsRecord
                                                                .mainImage,
                                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                          ),
                                                          width: 100,
                                                          height: 100,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (columnVariantsRecord
                                                                .tags
                                                                .toList()
                                                                ?.contains(
                                                                    'Oferta') ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .tag,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  size: 9,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Oferta',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              9,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (columnVariantsRecord
                                                                .tags
                                                                .toList()
                                                                ?.contains(
                                                                    'Envio Gratis') ??
                                                            true)
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .shippingFast,
                                                                color: Color(
                                                                    0xFF5AE93E),
                                                                size: 9,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Envio Gratis',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFF5AE93E),
                                                                        fontSize:
                                                                            9,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Container(
                                                        width: 139,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 139,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                          gridViewProductsRecord
                                                              .title,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 13,
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
                                                                  0, 5, 0, 0),
                                                      child: Container(
                                                        width: 140,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              gridViewProductsRecord
                                                                  .sku
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0xFF909090),
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 50,
                                                            height: 15,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Text(
                                                              columnVariantsRecord
                                                                  .unit,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            '\$',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Text(
                                                            GetOneVariantCall
                                                                .price(
                                                              (containerGetOneVariantResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
