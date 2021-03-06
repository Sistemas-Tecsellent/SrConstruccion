import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CarritoPorSellersWidget extends StatefulWidget {
  const CarritoPorSellersWidget({
    Key key,
    this.storeId,
    this.storeName,
  }) : super(key: key);

  final String storeId;
  final String storeName;

  @override
  _CarritoPorSellersWidgetState createState() =>
      _CarritoPorSellersWidgetState();
}

class _CarritoPorSellersWidgetState extends State<CarritoPorSellersWidget> {
  ApiCallResponse pendingShipmentPrice;
  Completer<ApiCallResponse> _apiRequestCompleter;
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
                return Container(
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
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                          if (GetSellerWiseCartTotalCall.canPay(
                                (containerGetSellerWiseCartTotalResponse
                                        ?.jsonBody ??
                                    ''),
                              ) ??
                              true)
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
                                        'Tarjeta Cr??dito / D??bito',
                                        buttonInvoiceProfilesRecord.id,
                                        'Gastos en General',
                                        widget.storeId,
                                      );
                                      pendingShipmentPrice =
                                          await GetIfCheckoutIsByTruckCall.call(
                                        uid: currentUserUid,
                                        checkoutId: widget.storeId,
                                      );
                                      if (getJsonField(
                                        (pendingShipmentPrice?.jsonBody ?? ''),
                                        r'''$.pendingShipmentPrice''',
                                      )) {
                                        context.pushNamed(
                                          'CalculandoCostoDeEnvioPorSeller',
                                          queryParams: {
                                            'checkoutId': serializeParam(
                                                widget.storeId,
                                                ParamType.String),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        context.pushNamed(
                                          'CheckoutSeller',
                                          params: {
                                            'storeName': serializeParam(
                                                carritoPorSellersStoresRecord
                                                    .name,
                                                ParamType.String),
                                          }.withoutNulls,
                                          queryParams: {
                                            'storeId': serializeParam(
                                                widget.storeId,
                                                ParamType.String),
                                          }.withoutNulls,
                                        );
                                      }
                                    } else {
                                      context.pushNamed('login');
                                    }

                                    setState(() {});
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
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                );
                              },
                            ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: FutureBuilder<ApiCallResponse>(
                future: (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                      ..complete(GetSellerWiseCartCall.call(
                        uid: currentUserUid,
                        storeId: widget.storeId,
                      )))
                    .future,
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
                                                                    setState(() =>
                                                                        _apiRequestCompleter =
                                                                            null);
                                                                    await waitForApiRequestCompleter();
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
                                                                  .fromSTEB(10,
                                                                      5, 10, 0),
                                                          child: InkWell(
                                                            onLongPress:
                                                                () async {
                                                              context.pushNamed(
                                                                'ProductPageSeller',
                                                                params: {
                                                                  'storeName': serializeParam(
                                                                      rowProductsRecord
                                                                          .ownerName,
                                                                      ParamType
                                                                          .String),
                                                                  'productId': serializeParam(
                                                                      rowProductsRecord
                                                                          .id,
                                                                      ParamType
                                                                          .String),
                                                                }.withoutNulls,
                                                                queryParams: {
                                                                  'storeId': serializeParam(
                                                                      rowProductsRecord
                                                                          .owner,
                                                                      ParamType
                                                                          .String),
                                                                }.withoutNulls,
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
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                        child:
                                                                            Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            rowProductsRecord.title,
                                                                            maxLines:
                                                                                2,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (functions
                                                                              .isGreaterThanZero(valueOrDefault<int>(
                                                                            getJsonField(
                                                                              productsInCartItem,
                                                                              r'''$.expressShipAmount''',
                                                                            ),
                                                                            0,
                                                                          )) ??
                                                                          true)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              10,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 60,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.bolt,
                                                                                        color: Color(0xFF6CD554),
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Express\n30 min.',
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF6CD554),
                                                                                            fontSize: 10,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FontStyle.italic,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 5, 0),
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
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 50,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Text(
                                                                                      'x',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFFAEAEAE),
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          productsInCartItem,
                                                                                          r'''$.expressShipAmount''',
                                                                                        ).toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFFAEAEAE),
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .isGreaterThanZero(valueOrDefault<int>(
                                                                            getJsonField(
                                                                              productsInCartItem,
                                                                              r'''$.normalShipAmount''',
                                                                            ),
                                                                            0,
                                                                          )) ??
                                                                          true)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              10,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 64,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x00EEEEEE),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.access_time_outlined,
                                                                                          color: Colors.black,
                                                                                          size: 12,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                          child: Text(
                                                                                            'Est??ndar',
                                                                                            textAlign: TextAlign.end,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Colors.black,
                                                                                                  fontSize: 10,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 5, 0),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        if (functions.areStringsEqual(
                                                                                                getJsonField(
                                                                                                  productsInCartItem,
                                                                                                  r'''$.price''',
                                                                                                ).toString(),
                                                                                                'publicPrice') ??
                                                                                            true)
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              containerVariantsRecord.publicPrice,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: '',
                                                                                            ),
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Color(0xFF1EEBBD),
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        if (functions.areStringsEqual(
                                                                                                getJsonField(
                                                                                                  productsInCartItem,
                                                                                                  r'''$.price''',
                                                                                                ).toString(),
                                                                                                'wholesalePrice') ??
                                                                                            true)
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              containerVariantsRecord.wholesalePrice,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: '',
                                                                                            ),
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Color(0xFF1EEBBD),
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        if (functions.areStringsEqual(
                                                                                                getJsonField(
                                                                                                  productsInCartItem,
                                                                                                  r'''$.price''',
                                                                                                ).toString(),
                                                                                                'megaWholesalePrice') ??
                                                                                            true)
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              containerVariantsRecord.megaWholesalePrice,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: '',
                                                                                            ),
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Color(0xFF1EEBBD),
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Container(
                                                                                width: 50,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Text(
                                                                                      'x',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFFAEAEAE),
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          productsInCartItem,
                                                                                          r'''$.normalShipAmount''',
                                                                                        ).toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFFAEAEAE),
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .isGreaterThanZero(valueOrDefault<int>(
                                                                            getJsonField(
                                                                              productsInCartItem,
                                                                              r'''$.pickupInStoreAmount''',
                                                                            ),
                                                                            0,
                                                                          )) ??
                                                                          true)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              10,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 64,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x00EEEEEE),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.storefront,
                                                                                          color: Colors.black,
                                                                                          size: 12,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                          child: Text(
                                                                                            'Recoger',
                                                                                            textAlign: TextAlign.end,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Colors.black,
                                                                                                  fontSize: 10,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 5, 0),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        if (functions.areStringsEqual(
                                                                                                getJsonField(
                                                                                                  productsInCartItem,
                                                                                                  r'''$.price''',
                                                                                                ).toString(),
                                                                                                'publicPrice') ??
                                                                                            true)
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              containerVariantsRecord.publicPrice,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: '',
                                                                                            ),
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Color(0xFF1EEBBD),
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        if (functions.areStringsEqual(
                                                                                                getJsonField(
                                                                                                  productsInCartItem,
                                                                                                  r'''$.price''',
                                                                                                ).toString(),
                                                                                                'wholesalePrice') ??
                                                                                            true)
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              containerVariantsRecord.wholesalePrice,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: '',
                                                                                            ),
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Color(0xFF1EEBBD),
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        if (functions.areStringsEqual(
                                                                                                getJsonField(
                                                                                                  productsInCartItem,
                                                                                                  r'''$.price''',
                                                                                                ).toString(),
                                                                                                'megaWholesalePrice') ??
                                                                                            true)
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              containerVariantsRecord.megaWholesalePrice,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: '',
                                                                                            ),
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Color(0xFF1EEBBD),
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Container(
                                                                                width: 50,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Text(
                                                                                      'x',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFFAEAEAE),
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          productsInCartItem,
                                                                                          r'''$.pickupInStoreAmount''',
                                                                                        ).toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFFAEAEAE),
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            5),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Unidad: ',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Color(0xFFAEAEAE),
                                                                                    fontSize: 11,
                                                                                  ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                containerVariantsRecord.unit,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      fontSize: 11,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Text(
                                                                            'Subtotal: ',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFFAEAEAE),
                                                                                  fontSize: 11,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                2,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              '\$',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    fontSize: 16,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                    productsInCartItem,
                                                                                    r'''$.subtotal''',
                                                                                  ).toString(),
                                                                                  '0',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
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
                                                                  'Compra 2 m??s y ll??vate un 5% OFF',
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
                                queryParams: {
                                  'storeId': serializeParam(
                                      widget.storeId, ParamType.String),
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
                              borderRadius: BorderRadius.circular(5),
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

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
