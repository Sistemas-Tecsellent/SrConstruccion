import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPageSellerWidget extends StatefulWidget {
  const ProductPageSellerWidget({
    Key key,
    this.storeId,
    this.storeName,
    this.productId,
  }) : super(key: key);

  final String storeId;
  final String storeName;
  final String productId;

  @override
  _ProductPageSellerWidgetState createState() =>
      _ProductPageSellerWidgetState();
}

class _ProductPageSellerWidgetState extends State<ProductPageSellerWidget> {
  ApiCallResponse oneVariant;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int expressCountValue;
  int normalShipmentCountValue;
  int pickupShipmentCountValue;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      oneVariant = await GetOneVariantCall.call(
        productId: widget.productId,
        userLocation: FFAppState().locationKey,
        userType: valueOrDefault<String>(
          valueOrDefault(currentUserDocument?.type, ''),
          'public',
        ),
      );
      setState(() => FFAppState().currentVariant = getJsonField(
            (oneVariant?.jsonBody ?? ''),
            r'''$.variant.id''',
          ).toString());
    });
  }

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
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<List<StoresRecord>>(
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
              List<StoresRecord> columnStoresRecordList = snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final columnStoresRecord = columnStoresRecordList.isNotEmpty
                  ? columnStoresRecordList.first
                  : null;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<ProductsRecord>>(
                      stream: queryProductsRecord(
                        queryBuilder: (productsRecord) => productsRecord
                            .where('id', isEqualTo: widget.productId),
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
                        List<ProductsRecord> containerProductsRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final containerProductsRecord =
                            containerProductsRecordList.isNotEmpty
                                ? containerProductsRecordList.first
                                : null;
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(),
                          child: StreamBuilder<List<VariantsRecord>>(
                            stream: queryVariantsRecord(
                              parent: containerProductsRecord.reference,
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
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 20),
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
                                              columnStoresRecord.name,
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
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height: 330,
                                        constraints: BoxConstraints(
                                          maxWidth: 500,
                                          maxHeight: 500,
                                        ),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              color: Color(0x15000000),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              containerProductsRecord.mainImage,
                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.89,
                                            constraints: BoxConstraints(
                                              maxWidth: 500,
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Text(
                                                containerProductsRecord.title,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              if ((valueOrDefault(
                                                      currentUserDocument?.type,
                                                      '')) ==
                                                  'public')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: AuthUserStreamWidget(
                                                    child: Text(
                                                      formatNumber(
                                                        columnVariantsRecord
                                                            .publicPrice,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              if ((valueOrDefault(
                                                      currentUserDocument?.type,
                                                      '')) ==
                                                  'wholesale')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: AuthUserStreamWidget(
                                                    child: Text(
                                                      formatNumber(
                                                        columnVariantsRecord
                                                            .wholesalePrice,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              if ((valueOrDefault(
                                                      currentUserDocument?.type,
                                                      '')) ==
                                                  'megaWholesale')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: AuthUserStreamWidget(
                                                    child: Text(
                                                      formatNumber(
                                                        columnVariantsRecord
                                                            .megaWholesalePrice,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              if (!(loggedIn) ?? true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Text(
                                                    formatNumber(
                                                      columnVariantsRecord
                                                          .publicPrice,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: '',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                            ],
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
                                                          containerProductsRecord
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
                                                          final variants =
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
                                                                  variants
                                                                      .length,
                                                                  (variantsIndex) {
                                                                final variantsItem =
                                                                    variants[
                                                                        variantsIndex];
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
                                                                            variantsItem,
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
                                                                            variantsItem,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FutureBuilder<ApiCallResponse>(
                                            future:
                                                CheckIfProductInCartCall.call(
                                              uid: currentUserUid,
                                              variantId:
                                                  columnVariantsRecord.id,
                                              cartId: columnStoresRecord.id,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final columnCheckIfProductInCartResponse =
                                                  snapshot.data;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 0, 20),
                                                    child: Text(
                                                      'Ordenar por tiempo de entrega',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  if (FFAppState()
                                                          .localStores
                                                          ?.contains(
                                                              widget.storeId) ??
                                                      true)
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    20, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .bolt,
                                                                  color: Color(
                                                                      0xFF76E735),
                                                                  size: 24,
                                                                ),
                                                                Container(
                                                                  width: 68,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00EEEEEE),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Express\n30 min.',
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
                                                                                Color(0xFF76E735),
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            formatNumber(
                                                                              columnVariantsRecord.publicPrice,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.periodDecimal,
                                                                              currency: '',
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          AuthUserStreamWidget(
                                                                            child:
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: GetVariantInventoryByStoreCall.call(
                                                                                productId: containerProductsRecord.id,
                                                                                variantId: columnVariantsRecord.id,
                                                                                store: columnStoresRecord.id,
                                                                                priceType: valueOrDefault(currentUserDocument?.type, ''),
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
                                                                                final containerGetVariantInventoryByStoreResponse = snapshot.data;
                                                                                return Container(
                                                                                  width: 89,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        getJsonField(
                                                                                          (containerGetVariantInventoryByStoreResponse?.jsonBody ?? ''),
                                                                                          r'''$.inventory''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Color(0xFFAEAEAE),
                                                                                              fontSize: 11,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        'disponibles',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Color(0xFFAEAEAE),
                                                                                              fontSize: 10,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 130,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
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
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor
                                                                      : Color(
                                                                          0xFFEEEEEE),
                                                                  size: 20,
                                                                ),
                                                                countBuilder:
                                                                    (count) =>
                                                                        Text(
                                                                  count
                                                                      .toString(),
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Roboto',
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                                count: expressCountValue ??=
                                                                    CheckIfProductInCartCall
                                                                        .expressShipAmount(
                                                                  (columnCheckIfProductInCartResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                updateCount: (count) =>
                                                                    setState(() =>
                                                                        expressCountValue =
                                                                            count),
                                                                stepSize: 1,
                                                                minimum: 0,
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
                                                                0, 10, 0, 20),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    20, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .clock,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 20,
                                                                ),
                                                                Container(
                                                                  width: 68,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00EEEEEE),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Estándar\n1-5 días',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              if ((valueOrDefault(currentUserDocument?.type, '')) == 'public')
                                                                                AuthUserStreamWidget(
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      columnVariantsRecord.publicPrice,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: '',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if ((valueOrDefault(currentUserDocument?.type, '')) == 'wholesale')
                                                                                AuthUserStreamWidget(
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      columnVariantsRecord.wholesalePrice,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: '',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if ((valueOrDefault(currentUserDocument?.type, '')) == 'megaWholesale')
                                                                                AuthUserStreamWidget(
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      columnVariantsRecord.megaWholesalePrice,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: '',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                89,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00EEEEEE),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  '+100',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color(0xFFAEAEAE),
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'disponibles',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color(0xFFAEAEAE),
                                                                                        fontSize: 11,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 130,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
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
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor
                                                                      : Color(
                                                                          0xFFEEEEEE),
                                                                  size: 20,
                                                                ),
                                                                countBuilder:
                                                                    (count) =>
                                                                        Text(
                                                                  count
                                                                      .toString(),
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Roboto',
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                                count: normalShipmentCountValue ??=
                                                                    CheckIfProductInCartCall
                                                                        .normalShipAmount(
                                                                  (columnCheckIfProductInCartResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                updateCount: (count) =>
                                                                    setState(() =>
                                                                        normalShipmentCountValue =
                                                                            count),
                                                                stepSize: 1,
                                                                minimum: 0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 20),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    20, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .storefront,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 20,
                                                                ),
                                                                Container(
                                                                  width: 68,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00EEEEEE),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Recoger\nen tienda',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              if ((valueOrDefault(currentUserDocument?.type, '')) == 'public')
                                                                                AuthUserStreamWidget(
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      columnVariantsRecord.publicPrice,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: '',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if ((valueOrDefault(currentUserDocument?.type, '')) == 'wholesale')
                                                                                AuthUserStreamWidget(
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      columnVariantsRecord.wholesalePrice,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: '',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if ((valueOrDefault(currentUserDocument?.type, '')) == 'megaWholesale')
                                                                                AuthUserStreamWidget(
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      columnVariantsRecord.megaWholesalePrice,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: '',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                89,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00EEEEEE),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                AuthUserStreamWidget(
                                                                                  child: FutureBuilder<ApiCallResponse>(
                                                                                    future: GetVariantInventoryByStoreCall.call(
                                                                                      productId: containerProductsRecord.id,
                                                                                      variantId: columnVariantsRecord.id,
                                                                                      store: columnStoresRecord.id,
                                                                                      priceType: valueOrDefault(currentUserDocument?.type, ''),
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
                                                                                      final textGetVariantInventoryByStoreResponse = snapshot.data;
                                                                                      return Text(
                                                                                        valueOrDefault<String>(
                                                                                          GetVariantInventoryByStoreCall.inventory(
                                                                                            (textGetVariantInventoryByStoreResponse?.jsonBody ?? ''),
                                                                                          ).toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Color(0xFFAEAEAE),
                                                                                              fontSize: 11,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'disponibles',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color(0xFFAEAEAE),
                                                                                        fontSize: 11,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 130,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
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
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor
                                                                      : Color(
                                                                          0xFFEEEEEE),
                                                                  size: 20,
                                                                ),
                                                                countBuilder:
                                                                    (count) =>
                                                                        Text(
                                                                  count
                                                                      .toString(),
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Roboto',
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                                count: pickupShipmentCountValue ??=
                                                                    CheckIfProductInCartCall
                                                                        .pickupInStoreAmount(
                                                                  (columnCheckIfProductInCartResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                updateCount: (count) =>
                                                                    setState(() =>
                                                                        pickupShipmentCountValue =
                                                                            count),
                                                                stepSize: 1,
                                                                minimum: 0,
                                                              ),
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
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await actions
                                                .addProductSellerWiseCart(
                                              containerProductsRecord.id,
                                              columnVariantsRecord.id,
                                              '\"\"',
                                              expressCountValue,
                                              columnStoresRecord.id,
                                              expressCountValue,
                                              normalShipmentCountValue,
                                              pickupShipmentCountValue,
                                            );
                                            context.pushNamed(
                                              'CarritoPorSellers',
                                              params: {
                                                'storeName': serializeParam(
                                                    columnStoresRecord.name,
                                                    ParamType.String),
                                              }.withoutNulls,
                                              queryParams: {
                                                'storeId': serializeParam(
                                                    columnStoresRecord.id,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
