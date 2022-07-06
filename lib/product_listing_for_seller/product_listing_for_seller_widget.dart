import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListingForSellerWidget extends StatefulWidget {
  const ProductListingForSellerWidget({
    Key key,
    this.storeId,
  }) : super(key: key);

  final String storeId;

  @override
  _ProductListingForSellerWidgetState createState() =>
      _ProductListingForSellerWidgetState();
}

class _ProductListingForSellerWidgetState
    extends State<ProductListingForSellerWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StoresRecord>>(
      stream: queryStoresRecord(
        queryBuilder: (storesRecord) =>
            storesRecord.where('id', isEqualTo: widget.storeId),
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
        List<StoresRecord> productListingForSellerStoresRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final productListingForSellerStoresRecord =
            productListingForSellerStoresRecordList.isNotEmpty
                ? productListingForSellerStoresRecordList.first
                : null;
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
            title: Text(
              productListingForSellerStoresRecord.name,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    fontSize: 18,
                  ),
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
                        cartId: widget.storeId,
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
                        final buttonGetCartAmountResponse = snapshot.data;
                        return FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              'CarritoPorSellers',
                              params: {
                                'storeId': serializeParam(
                                    widget.storeId, ParamType.String),
                              }.withoutNulls,
                            );
                          },
                          text: GetCartAmountCall.amount(
                            (buttonGetCartAmountResponse?.jsonBody ?? ''),
                          ).toString(),
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                          options: FFButtonOptions(
                            width: 110,
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
                            borderRadius: BorderRadius.circular(120),
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
                            child: Icon(
                              Icons.filter_list_rounded,
                              color: Colors.black,
                              size: 20,
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
                              queryBuilder: (productsRecord) =>
                                  productsRecord.where('stores',
                                      arrayContains: widget.storeId),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
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
                                          userLocation:
                                              FFAppState().locationKey,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          final containerGetOneVariantResponse =
                                              snapshot.data;
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 1),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                            Container(
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  'Exclusivo en',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'PerfilDelSeller',
                                                                      params: {
                                                                        'storeId': serializeParam(
                                                                            widget.storeId,
                                                                            ParamType.String),
                                                                      }.withoutNulls,
                                                                      queryParams:
                                                                          {
                                                                        'calledFromPage': serializeParam(
                                                                            'List',
                                                                            ParamType.String),
                                                                        'productId': serializeParam(
                                                                            '\"\"',
                                                                            ParamType.String),
                                                                        'variantId': serializeParam(
                                                                            '\"\"',
                                                                            ParamType.String),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    productListingForSellerStoresRecord
                                                                        .name
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          15,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          fontSize:
                                                                              11,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ProductPage',
                                                              params: {
                                                                'productId': serializeParam(
                                                                    gridViewProductsRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                gridViewProductsRecord
                                                                    .mainImage,
                                                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                              ),
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (columnVariantsRecord
                                                              .tags
                                                              .toList()
                                                              ?.contains(
                                                                  'Oferta') ??
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      5, 0, 5),
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
                                                                size: 10,
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
                                                                  'Oferta',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            11,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            gridViewProductsRecord
                                                                .title,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ],
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
                                                                    color: Color(
                                                                        0xFF1EEBBD),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
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
                                                                GetOneVariantCall
                                                                    .price(
                                                                  (containerGetOneVariantResponse
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
                                                                          0xFF1EEBBD),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                                                    0, 5, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              'Stock ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                            ),
                                                            FutureBuilder<
                                                                ApiCallResponse>(
                                                              future:
                                                                  GetVariantInventoryByStoreCall
                                                                      .call(
                                                                productId:
                                                                    gridViewProductsRecord
                                                                        .id,
                                                                variantId:
                                                                    columnVariantsRecord
                                                                        .id,
                                                                store: widget
                                                                    .storeId,
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
                                                                            0xFFC9C9C9),
                                                                        fontSize:
                                                                            11,
                                                                      ),
                                                                );
                                                              },
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
                                                              MainAxisSize.max,
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
                                                  );
                                                },
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
                              queryBuilder: (productsRecord) =>
                                  productsRecord.where('stores',
                                      arrayContains: widget.storeId),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
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
                                          userLocation:
                                              FFAppState().locationKey,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          final containerGetOneVariantResponse =
                                              snapshot.data;
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 1),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                            Container(
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  'Exclusivo en',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'PerfilDelSeller',
                                                                      params: {
                                                                        'storeId': serializeParam(
                                                                            widget.storeId,
                                                                            ParamType.String),
                                                                      }.withoutNulls,
                                                                      queryParams:
                                                                          {
                                                                        'calledFromPage': serializeParam(
                                                                            'List',
                                                                            ParamType.String),
                                                                        'productId': serializeParam(
                                                                            '\"\"',
                                                                            ParamType.String),
                                                                        'variantId': serializeParam(
                                                                            '\"\"',
                                                                            ParamType.String),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    productListingForSellerStoresRecord
                                                                        .name
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          15,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          fontSize:
                                                                              11,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ProductPage',
                                                              params: {
                                                                'productId': serializeParam(
                                                                    gridViewProductsRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                gridViewProductsRecord
                                                                    .mainImage,
                                                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                              ),
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (columnVariantsRecord
                                                              .tags
                                                              .toList()
                                                              ?.contains(
                                                                  'Oferta') ??
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      5, 0, 5),
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
                                                                size: 10,
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
                                                                  'Oferta',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            11,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            gridViewProductsRecord
                                                                .title
                                                                .maybeHandleOverflow(
                                                              maxChars: 27,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ],
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
                                                                    color: Color(
                                                                        0xFF1EEBBD),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
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
                                                                GetOneVariantCall
                                                                    .price(
                                                                  (containerGetOneVariantResponse
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
                                                                          0xFF1EEBBD),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                                                    0, 5, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              'Stock ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                            ),
                                                            FutureBuilder<
                                                                ApiCallResponse>(
                                                              future:
                                                                  GetVariantInventoryByStoreCall
                                                                      .call(
                                                                productId:
                                                                    gridViewProductsRecord
                                                                        .id,
                                                                variantId:
                                                                    columnVariantsRecord
                                                                        .id,
                                                                store: widget
                                                                    .storeId,
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
                                                                            0xFFC9C9C9),
                                                                        fontSize:
                                                                            11,
                                                                      ),
                                                                );
                                                              },
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
                                                              MainAxisSize.max,
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
                                                  );
                                                },
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
      },
    );
  }
}
