import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/seller_product_widget.dart';
import '../components/sugerencias_recomendaciones_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CarritoPorSellersWidget extends StatefulWidget {
  const CarritoPorSellersWidget({
    Key key,
    this.storeId,
  }) : super(key: key);

  final String storeId;

  @override
  _CarritoPorSellersWidgetState createState() =>
      _CarritoPorSellersWidgetState();
}

class _CarritoPorSellersWidgetState extends State<CarritoPorSellersWidget> {
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
        List<StoresRecord> carritoPorSellersStoresRecordList = snapshot.data;
        final carritoPorSellersStoresRecord =
            carritoPorSellersStoresRecordList.isNotEmpty
                ? carritoPorSellersStoresRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              'Mi Carrito',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: Color(0x00FDC054),
            elevation: 0,
            label: FutureBuilder<ApiCallResponse>(
              future: GetSellerWiseCartTotalCall.call(
                uid: currentUserUid,
                storeId: widget.storeId,
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
                final containerGetSellerWiseCartTotalResponse = snapshot.data;
                return InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: SugerenciasRecomendacionesWidget(),
                        );
                      },
                    );
                    context.pushNamed('Checkout');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x00FF5963),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x20000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: StreamBuilder<List<AddressesRecord>>(
                      stream: queryAddressesRecord(
                        parent: currentUserReference,
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<AddressesRecord> rowAddtoCartAddressesRecordList =
                            snapshot.data;
                        final rowAddtoCartAddressesRecord =
                            rowAddtoCartAddressesRecordList.isNotEmpty
                                ? rowAddtoCartAddressesRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            StreamBuilder<List<InvoiceProfilesRecord>>(
                              stream: queryInvoiceProfilesRecord(
                                parent: currentUserReference,
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
                                List<InvoiceProfilesRecord>
                                    buttonInvoiceProfilesRecordList =
                                    snapshot.data;
                                final buttonInvoiceProfilesRecord =
                                    buttonInvoiceProfilesRecordList.isNotEmpty
                                        ? buttonInvoiceProfilesRecordList.first
                                        : null;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    if (loggedIn) {
                                      await actions
                                          .setCheckoutSessionSellerWise(
                                        rowAddtoCartAddressesRecord.name,
                                        'Tarjeta Crédito / Débito',
                                        buttonInvoiceProfilesRecord.id,
                                        'Gastos en General',
                                        widget.storeId,
                                      );
                                      context.pushNamed(
                                        'CheckoutSeller',
                                        params: {
                                          'storeId': serializeParam(
                                              widget.storeId, ParamType.String),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed('login');
                                    }
                                  },
                                  text: GetSellerWiseCartTotalCall.message(
                                    (containerGetSellerWiseCartTotalResponse
                                            ?.jsonBody ??
                                        ''),
                                  ).toString(),
                                  options: FFButtonOptions(
                                    width: 300,
                                    height: 54,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 5,
                                  ),
                                );
                              },
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
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: FutureBuilder<ApiCallResponse>(
                future: GetSellerWiseCartCall.call(
                  uid: currentUserUid,
                  storeId: widget.storeId,
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
                  final columnGetSellerWiseCartResponse = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            carritoPorSellersStoresRecord.logo,
                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          carritoPorSellersStoresRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
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
                        Builder(
                          builder: (context) {
                            final productsInCart = getJsonField(
                                  (columnGetSellerWiseCartResponse?.jsonBody ??
                                      ''),
                                  r'''$''',
                                )?.toList() ??
                                [];
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(productsInCart.length,
                                    (productsInCartIndex) {
                                  final productsInCartItem =
                                      productsInCart[productsInCartIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: StreamBuilder<List<ProductsRecord>>(
                                      stream: queryProductsRecord(
                                        queryBuilder: (productsRecord) =>
                                            productsRecord.where('id',
                                                isEqualTo: getJsonField(
                                                  productsInCartItem,
                                                  r'''$.productId''',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ProductsRecord>
                                            rowProductsRecordList =
                                            snapshot.data;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data.isEmpty) {
                                          return Container();
                                        }
                                        final rowProductsRecord =
                                            rowProductsRecordList.isNotEmpty
                                                ? rowProductsRecordList.first
                                                : null;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: StreamBuilder<
                                                  List<VariantsRecord>>(
                                                stream: queryVariantsRecord(
                                                  parent: rowProductsRecord
                                                      .reference,
                                                  queryBuilder:
                                                      (variantsRecord) =>
                                                          variantsRecord.where(
                                                              'id',
                                                              isEqualTo:
                                                                  getJsonField(
                                                                productsInCartItem,
                                                                r'''$.variantId''',
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
                                                      containerVariantsRecordList =
                                                      snapshot.data;
                                                  // Return an empty Container when the document does not exist.
                                                  if (snapshot.data.isEmpty) {
                                                    return Container();
                                                  }
                                                  final containerVariantsRecord =
                                                      containerVariantsRecordList
                                                              .isNotEmpty
                                                          ? containerVariantsRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 500,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0,
                                                          color:
                                                              Color(0x1E000000),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      5, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await actions
                                                                        .removeProductSellerWiseCart(
                                                                      widget
                                                                          .storeId,
                                                                      currentUserUid,
                                                                      containerVariantsRecord
                                                                          .id,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    'Eliminar ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Color(0xFFF60A0A),
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
                                                                      10,
                                                                      10,
                                                                      10,
                                                                      0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        SellerProductWidget(
                                                                      store: widget
                                                                          .storeId,
                                                                      productId:
                                                                          rowProductsRecord
                                                                              .id,
                                                                      variantId:
                                                                          containerVariantsRecord
                                                                              .id,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.95,
                                                                          0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        rowProductsRecord
                                                                            .mainImage,
                                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                      ),
                                                                      width: 70,
                                                                      height:
                                                                          70,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              6,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        rowProductsRecord
                                                                            .title
                                                                            .maybeHandleOverflow(maxChars: 25),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ),
                                                                    Stack(
                                                                      children: [
                                                                        if ((valueOrDefault(currentUserDocument?.type,
                                                                                '')) ==
                                                                            'public')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Text(
                                                                                formatNumber(
                                                                                  containerVariantsRecord.publicPrice,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                  currency: '',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Color(0xFF1EEBBD),
                                                                                      fontSize: 18,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if ((valueOrDefault(currentUserDocument?.type,
                                                                                '')) ==
                                                                            'wholesale')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Text(
                                                                                formatNumber(
                                                                                  containerVariantsRecord.wholesalePrice,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                  currency: '',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Color(0xFF1EEBBD),
                                                                                      fontSize: 18,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if ((valueOrDefault(currentUserDocument?.type,
                                                                                '')) ==
                                                                            'megaWholesale')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Text(
                                                                                formatNumber(
                                                                                  containerVariantsRecord.megaWholesalePrice,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                  currency: '',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Color(0xFF1EEBBD),
                                                                                      fontSize: 18,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 0, 5),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  productsInCartItem,
                                                                  r'''$.amount''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
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
                                                                  containerVariantsRecord
                                                                      .unit,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20,
                                                                      0,
                                                                      20,
                                                                      10),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Tipo de Envío',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFAEAEAE),
                                                                      fontSize:
                                                                          12,
                                                                    ),
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
                                                                  getJsonField(
                                                                    productsInCartItem,
                                                                    r'''$.deliveryType''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
                                                                      20,
                                                                      0,
                                                                      20,
                                                                      20),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                                desktop: false,
                                                              ))
                                                                Text(
                                                                  'Compra 2 más y llévate un 5% OFF',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 80),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await ClearSellerWiseCartCall.call(
                                uid: currentUserUid,
                                storeId: widget.storeId,
                              );
                              context.pushNamed(
                                'PerfilDelSeller',
                                params: {
                                  'storeId': serializeParam(
                                      widget.storeId, ParamType.String),
                                }.withoutNulls,
                                queryParams: {
                                  'calledFromPage':
                                      serializeParam('\"\"', ParamType.String),
                                }.withoutNulls,
                              );
                            },
                            text: 'Vaciar Carrito',
                            options: FFButtonOptions(
                              width: 170,
                              height: 40,
                              color: Color(0xFFF1F1F1),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFFAEAEAE),
                                    fontSize: 14,
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
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
