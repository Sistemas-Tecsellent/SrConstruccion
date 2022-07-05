import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/sugerencias_recomendaciones_widget.dart';
import '../components/toggle_like_product_widget.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    Key key,
    this.productId,
    this.variantId,
  }) : super(key: key);

  final String productId;
  final String variantId;

  @override
  _ProductPageWidgetState createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  ApiCallResponse oneVariant;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageController imagenPVController;
  int expressCountDValue;
  int normalShipmentCountDValue;
  double ratingBarValue1;
  double ratingBarValue2;
  PageController pageViewController;
  int expressCountValue;
  int normalShipmentCountValue;
  double ratingBarValue3;
  double ratingBarValue4;

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
      if (loggedIn) {
        await actions.productViewed(
          widget.productId,
        );

        final usersUpdateData = {
          'recentlyViewed': FieldValue.arrayUnion([widget.productId]),
        };
        await currentUserReference.update(usersUpdateData);
      }
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
        actions: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loggedIn ?? true)
                FutureBuilder<ApiCallResponse>(
                  future: GetCartAmountCall.call(
                    uid: widget.productId,
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
                        size: 30,
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
                        borderRadius: 25,
                      ),
                    );
                  },
                ),
            ],
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0x00FDC054),
        elevation: 0,
        label: InkWell(
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    if (loggedIn) {
                      await actions.addProductToCart(
                        widget.productId,
                        FFAppState().currentVariant,
                        expressCountDValue,
                        normalShipmentCountDValue,
                        FFAppState().locationKey,
                        FFAppState().locationKeyCity,
                      );
                      context.pushNamed('Carrito');
                    } else {
                      context.pushNamed('login');
                    }
                  },
                  text: 'Agregar al carrito',
                  options: FFButtonOptions(
                    width: 300,
                    height: 54,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
              final columnProductsRecord = columnProductsRecordList.isNotEmpty
                  ? columnProductsRecordList.first
                  : null;
              return SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.99,
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ),
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
                              List<VariantsRecord> productoVariantsRecordList =
                                  snapshot.data;
                              final productoVariantsRecord =
                                  productoVariantsRecordList.isNotEmpty
                                      ? productoVariantsRecordList.first
                                      : null;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1000,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
                                              height: 500,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    0, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                'MarcaSingle');
                                                          },
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                columnProductsRecord
                                                                    .brandLogo,
                                                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        borderWidth: 1,
                                                        buttonSize: 60,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .share,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 25,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                      if (loggedIn ?? true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 20, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await actions
                                                                  .likeProduct(
                                                                currentUserUid,
                                                                widget
                                                                    .productId,
                                                              );
                                                            },
                                                            child:
                                                                ToggleLikeProductWidget(
                                                              productId: widget
                                                                  .productId,
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
                                                    height: 380,
                                                    child: PageView(
                                                      controller:
                                                          imagenPVController ??=
                                                              PageController(
                                                                  initialPage:
                                                                      0),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            columnProductsRecord
                                                                .mainImage,
                                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                          ),
                                                          fit: BoxFit.scaleDown,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
                                              height: 999,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00FAF1E2),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25,
                                                                        0,
                                                                        25,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      formatNumber(
                                                                        productoVariantsRecord
                                                                            .publicPrice,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.periodDecimal,
                                                                        currency:
                                                                            '',
                                                                      ),
                                                                      'Cotizar',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Color(0xFF1EEBBD),
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      formatNumber(
                                                                        productoVariantsRecord
                                                                            .publicPrice,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.periodDecimal,
                                                                        currency:
                                                                            '',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0xFFE7E7E7),
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            decoration:
                                                                                TextDecoration.lineThrough,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 5, 25, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                columnProductsRecord
                                                                    .sales
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFAEAEAE),
                                                                      fontSize:
                                                                          13,
                                                                    ),
                                                              ),
                                                              Text(
                                                                ' vendidos',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFAEAEAE),
                                                                      fontSize:
                                                                          13,
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
                                                                  20, 10, 0, 0),
                                                      child: Text(
                                                        columnProductsRecord
                                                            .title,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 10, 0, 0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00EEEEEE),
                                                        ),
                                                        child: Text(
                                                          columnProductsRecord
                                                              .description,
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(25, 10,
                                                                  25, 10),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (productoVariantsRecord
                                                                  .tags
                                                                  .toList()
                                                                  ?.contains(
                                                                      'Oferta') ??
                                                              true)
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          3,
                                                                          0,
                                                                          0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .tag,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    size: 13,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              13,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          if (productoVariantsRecord
                                                                  .tags
                                                                  .toList()
                                                                  ?.contains(
                                                                      'Envio Gratis') ??
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  FaIcon(
                                                                    FontAwesomeIcons
                                                                        .shippingFast,
                                                                    color: Color(
                                                                        0xFF5AE93E),
                                                                    size: 12,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
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
                                                                            color:
                                                                                Color(0xFF5AE93E),
                                                                            fontSize:
                                                                                13,
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
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'CotizacionFormulario');
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        await launchURL(
                                                                            'http://tienda.srconstruccion.com');
                                                                      },
                                                                      text:
                                                                          'Cotizar',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .forum_rounded,
                                                                        size:
                                                                            15,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            130,
                                                                        height:
                                                                            30,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: Colors.white,
                                                                              fontSize: 14,
                                                                            ),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            500,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 10,
                                                                  20, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Text(
                                                              'Escoger unidad',
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
                                                          FutureBuilder<
                                                              ApiCallResponse>(
                                                            future:
                                                                GetApplicableVariantsCall
                                                                    .call(
                                                              productId: widget
                                                                  .productId,
                                                              userLocation:
                                                                  FFAppState()
                                                                      .locationKey,
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
                                                                    height: 50,
                                                                    child:
                                                                        SpinKitFadingCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 50,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final rowGetApplicableVariantsResponse =
                                                                  snapshot.data;
                                                              return Builder(
                                                                builder:
                                                                    (context) {
                                                                  final unit =
                                                                      getJsonField(
                                                                            (rowGetApplicableVariantsResponse?.jsonBody ??
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
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: List.generate(
                                                                          unit.length,
                                                                          (unitIndex) {
                                                                        final unitItem =
                                                                            unit[unitIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              10,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              setState(() => FFAppState().currentVariant = getJsonField(
                                                                                    unitItem,
                                                                                    r'''$.id''',
                                                                                  ).toString());
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                borderRadius: BorderRadius.circular(50),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    unitItem,
                                                                                    r'''$.unit''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 20, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          20),
                                                                  child: Text(
                                                                    'Descuentos y Promociones',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 0, 0, 0),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            if ((productoVariantsRecord
                                                                    .discountRange1) !=
                                                                0)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 190,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            190,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0),
                                                                            bottomRight:
                                                                                Radius.circular(0),
                                                                            topLeft:
                                                                                Radius.circular(5),
                                                                            topRight:
                                                                                Radius.circular(5),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            'Llévate un ${valueOrDefault<String>(
                                                                              formatNumber(
                                                                                productoVariantsRecord.discount1,
                                                                                formatType: FormatType.percent,
                                                                              ),
                                                                              '0',
                                                                            )} de descuento adicional comprando',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.white,
                                                                                  fontSize: 11,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            'de 0 a ${valueOrDefault<String>(
                                                                              productoVariantsRecord.discountRange1.toString(),
                                                                              '0',
                                                                            )} unidades',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFFE3A322),
                                                                                  fontSize: 13,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((productoVariantsRecord
                                                                    .discountRange2) !=
                                                                0)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 190,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            190,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0),
                                                                            bottomRight:
                                                                                Radius.circular(0),
                                                                            topLeft:
                                                                                Radius.circular(5),
                                                                            topRight:
                                                                                Radius.circular(5),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            'Llévate un ${valueOrDefault<String>(
                                                                              formatNumber(
                                                                                productoVariantsRecord.discount2,
                                                                                formatType: FormatType.percent,
                                                                              ),
                                                                              '0',
                                                                            )} de descuento adicional comprando',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.white,
                                                                                  fontSize: 11,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            'de ${productoVariantsRecord.discountRange1.toString()} a ${valueOrDefault<String>(
                                                                              productoVariantsRecord.discountRange2.toString(),
                                                                              '0',
                                                                            )} unidades',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFFE3A322),
                                                                                  fontSize: 13,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((productoVariantsRecord
                                                                    .discountRange3) !=
                                                                0)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 190,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            190,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0),
                                                                            bottomRight:
                                                                                Radius.circular(0),
                                                                            topLeft:
                                                                                Radius.circular(5),
                                                                            topRight:
                                                                                Radius.circular(5),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            'Llévate un ${formatNumber(
                                                                              productoVariantsRecord.discount3,
                                                                              formatType: FormatType.percent,
                                                                            )} de descuento adicional comprando',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.white,
                                                                                  fontSize: 11,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            'de ${valueOrDefault<String>(
                                                                              productoVariantsRecord.discount3.toString(),
                                                                              '0',
                                                                            )} o más unidades',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFFE3A322),
                                                                                  fontSize: 13,
                                                                                ),
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 20, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                child: Text(
                                                                  'Ordenar por tiempo de entrega',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.45,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          20,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FaIcon(
                                                                            FontAwesomeIcons.bolt,
                                                                            color:
                                                                                Color(0xFF76E735),
                                                                            size:
                                                                                24,
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                68,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00EEEEEE),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                              child: Text(
                                                                                'Express\n30 min.',
                                                                                textAlign: TextAlign.end,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Color(0xFF76E735),
                                                                                      fontSize: 13,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      formatNumber(
                                                                                        productoVariantsRecord.publicPrice,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                        currency: '',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF1EEBBD),
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FutureBuilder<ApiCallResponse>(
                                                                                      future: GetVariantInventoryCall.call(
                                                                                        productId: widget.productId,
                                                                                        variantId: productoVariantsRecord.id,
                                                                                        userLocationState: FFAppState().locationKey,
                                                                                        userLocationCity: FFAppState().locationKeyCity,
                                                                                        priceType: 'public',
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
                                                                                        final containerGetVariantInventoryResponse = snapshot.data;
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
                                                                                                  (containerGetVariantInventoryResponse?.jsonBody ?? ''),
                                                                                                  r'''$.inventory''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Color(0xFFAEAEAE),
                                                                                                      fontSize: 11,
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
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            130,
                                                                        height:
                                                                            50,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(4),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFE9E9E9),
                                                                            width:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            FlutterFlowCountController(
                                                                          decrementIconBuilder: (enabled) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.minus,
                                                                            color: enabled
                                                                                ? Color(0xDD000000)
                                                                                : Color(0xFFEEEEEE),
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          incrementIconBuilder: (enabled) =>
                                                                              FaIcon(
                                                                            FontAwesomeIcons.plus,
                                                                            color: enabled
                                                                                ? FlutterFlowTheme.of(context).primaryColor
                                                                                : Color(0xFFEEEEEE),
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          countBuilder: (count) =>
                                                                              Text(
                                                                            count.toString(),
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Roboto',
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                          count: expressCountDValue ??=
                                                                              0,
                                                                          updateCount: (count) =>
                                                                              setState(() => expressCountDValue = count),
                                                                          stepSize:
                                                                              1,
                                                                          minimum:
                                                                              0,
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
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            20),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.45,
                                                                  height: 50,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.clock,
                                                                              color: Colors.black,
                                                                              size: 20,
                                                                            ),
                                                                            Container(
                                                                              width: 68,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x00EEEEEE),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                child: Text(
                                                                                  'Estándar\n1-5 días',
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 13,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Stack(
                                                                                        children: [
                                                                                          if ((valueOrDefault(currentUserDocument?.type, '')) == 'public')
                                                                                            AuthUserStreamWidget(
                                                                                              child: Text(
                                                                                                formatNumber(
                                                                                                  productoVariantsRecord.publicPrice,
                                                                                                  formatType: FormatType.decimal,
                                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                                  currency: '',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Color(0xFF1EEBBD),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((valueOrDefault(currentUserDocument?.type, '')) == 'wholesale')
                                                                                            AuthUserStreamWidget(
                                                                                              child: Text(
                                                                                                formatNumber(
                                                                                                  productoVariantsRecord.wholesalePrice,
                                                                                                  formatType: FormatType.decimal,
                                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                                  currency: '',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Color(0xFF1EEBBD),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((valueOrDefault(currentUserDocument?.type, '')) == 'megaWholesale')
                                                                                            AuthUserStreamWidget(
                                                                                              child: Text(
                                                                                                formatNumber(
                                                                                                  productoVariantsRecord.megaWholesalePrice,
                                                                                                  formatType: FormatType.decimal,
                                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                                  currency: '',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Color(0xFF1EEBBD),
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          if (!(loggedIn) ?? true)
                                                                                            Text(
                                                                                              formatNumber(
                                                                                                productoVariantsRecord.publicPrice,
                                                                                                formatType: FormatType.decimal,
                                                                                                decimalType: DecimalType.periodDecimal,
                                                                                                currency: '',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    color: Color(0xFF1EEBBD),
                                                                                                  ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 89,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00EEEEEE),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'disponible',
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
                                                                          width:
                                                                              130,
                                                                          height:
                                                                              50,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(4),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFFE9E9E9),
                                                                              width: 1,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowCountController(
                                                                            decrementIconBuilder: (enabled) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.minus,
                                                                              color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                                                                              size: 20,
                                                                            ),
                                                                            incrementIconBuilder: (enabled) =>
                                                                                FaIcon(
                                                                              FontAwesomeIcons.plus,
                                                                              color: enabled ? FlutterFlowTheme.of(context).primaryColor : Color(0xFFEEEEEE),
                                                                              size: 20,
                                                                            ),
                                                                            countBuilder: (count) =>
                                                                                Text(
                                                                              count.toString(),
                                                                              style: GoogleFonts.getFont(
                                                                                'Roboto',
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 16,
                                                                              ),
                                                                            ),
                                                                            count: normalShipmentCountDValue ??=
                                                                                0,
                                                                            updateCount: (count) =>
                                                                                setState(() => normalShipmentCountDValue = count),
                                                                            stepSize:
                                                                                1,
                                                                            minimum:
                                                                                0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
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
                                                                  20, 0, 5, 0),
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
                                                              Text(
                                                                'Comprar y Recoger en tienda',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 50,
                                                            icon: Icon(
                                                              Icons.add_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 30,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'VendedoresEnMapa');
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final store = FFAppState()
                                                                  .localStores
                                                                  ?.toList() ??
                                                              [];
                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: List.generate(
                                                                  store.length,
                                                                  (storeIndex) {
                                                                final storeItem =
                                                                    store[
                                                                        storeIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          10),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          StoresRecord>>(
                                                                    stream:
                                                                        queryStoresRecord(
                                                                      queryBuilder: (storesRecord) => storesRecord.where(
                                                                          'id',
                                                                          isEqualTo:
                                                                              storeItem),
                                                                      singleRecord:
                                                                          true,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                SpinKitFadingCircle(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<StoresRecord>
                                                                          sellerStoresRecordList =
                                                                          snapshot
                                                                              .data;
                                                                      // Return an empty Container when the document does not exist.
                                                                      if (snapshot
                                                                          .data
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final sellerStoresRecord = sellerStoresRecordList
                                                                              .isNotEmpty
                                                                          ? sellerStoresRecordList
                                                                              .first
                                                                          : null;
                                                                      return Container(
                                                                        width:
                                                                            190,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 5,
                                                                              color: Color(0x3D000000),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0, -1),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0),
                                                                                      bottomRight: Radius.circular(0),
                                                                                      topLeft: Radius.circular(10),
                                                                                      topRight: Radius.circular(10),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        sellerStoresRecord.banner,
                                                                                        'https://images.pexels.com/photos/4312860/pexels-photo-4312860.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                                                      ),
                                                                                      width: 220,
                                                                                      height: 70,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                                                  child: InkWell(
                                                                                    onTap: () async {
                                                                                      context.pushNamed(
                                                                                        'PerfilDelSeller',
                                                                                        params: {
                                                                                          'storeId': serializeParam(sellerStoresRecord.id, ParamType.String),
                                                                                        }.withoutNulls,
                                                                                        queryParams: {
                                                                                          'calledFromPage': serializeParam('productPage', ParamType.String),
                                                                                          'productId': serializeParam(widget.productId, ParamType.String),
                                                                                          'variantId': serializeParam(FFAppState().currentVariant, ParamType.String),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0, -1),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(50),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  sellerStoresRecord.logo,
                                                                                                  'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                                                ),
                                                                                                width: 70,
                                                                                                height: 70,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          sellerStoresRecord.name,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                          child: Text(
                                                                                            sellerStoresRecord.address.maybeHandleOverflow(maxChars: 15),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                              child: FutureBuilder<ApiCallResponse>(
                                                                                                future: GetVariantInventoryByStoreCall.call(
                                                                                                  productId: widget.productId,
                                                                                                  variantId: FFAppState().currentVariant,
                                                                                                  store: storeItem,
                                                                                                  priceType: 'public',
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
                                                                                                    GetVariantInventoryByStoreCall.inventory(
                                                                                                      (textGetVariantInventoryByStoreResponse?.jsonBody ?? ''),
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Montserrat',
                                                                                                          color: Color(0xFFA8A8A8),
                                                                                                          fontSize: 11,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                              child: Text(
                                                                                                ' disponibles',
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Color(0xFFA8A8A8),
                                                                                                      fontSize: 11,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                              child: Text(
                                                                                                '\$',
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Color(0xFF1EEBBD),
                                                                                                      fontSize: 13,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                              child: Text(
                                                                                                formatNumber(
                                                                                                  productoVariantsRecord.publicPrice,
                                                                                                  formatType: FormatType.decimal,
                                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                                  currency: '',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Color(0xFF1EEBBD),
                                                                                                      fontSize: 13,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                              child: Text(
                                                                                                ' x unidad',
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      fontSize: 13,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
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
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 30, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 350,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: DefaultTabController(
                                                length: 3,
                                                initialIndex: 0,
                                                child: Column(
                                                  children: [
                                                    TabBar(
                                                      labelColor: Colors.black,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 13,
                                                              ),
                                                      indicatorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      indicatorWeight: 3,
                                                      tabs: [
                                                        Tab(
                                                          text: 'Detalles',
                                                        ),
                                                        Tab(
                                                          text: 'Ficha técnica',
                                                        ),
                                                        Tab(
                                                          text: 'Garantía',
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: TabBarView(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30,
                                                                        20,
                                                                        30,
                                                                        0),
                                                            child: Text(
                                                              'Ver página de cátalogo PDF\t257\nPotencia\t370 W / 1/2 HP\nVelocidad de disco\t3,500 rpm\nCapacidad de disco\t6\" (15 cm)\nCapacidad de banda\t4\" x 36\" (10 x 90 cm)\nVelocidad de banda\t600 m/min\nMesa de trabajo\t9\" x 6\" (23 x 15 cm)\nTensión / Frecuencia\t127 V / 60 Hz\nConsumo\t4.5 A\nCiclo de trabajo\t50 minutos de trabajo por 20 minutos de descanso. Máximo diario 6 horas\nPeso\t16 kg\nEmpaque individual\tCaja',
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
                                                          ),
                                                          FlutterFlowPdfViewer(
                                                            assetPath:
                                                                'assets/pdfs/SS._Obra_Misional_2_Trimestre_2022.pdf',
                                                            horizontalScroll:
                                                                true,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30,
                                                                        20,
                                                                        30,
                                                                        0),
                                                            child: Text(
                                                              'Todos nuestros productos son fabricados bajo una estricta supervisión, con estándares internacionales de calidad y cuentan con garantía contra defectos de fabricación y mano de obra. Para conocer los procedimientos necesarios para hacer válidas nuestras garantías o para cualquier información adicional, comunícate con nosotros.',
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 400,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 10, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'Valoraciones');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Valoraciones',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          RatingBar.builder(
                                                            onRatingUpdate: (newValue) =>
                                                                setState(() =>
                                                                    ratingBarValue1 =
                                                                        newValue),
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                            ),
                                                            direction:
                                                                Axis.horizontal,
                                                            initialRating:
                                                                ratingBarValue1 ??=
                                                                    3,
                                                            unratedColor: Color(
                                                                0xFFDDDDDD),
                                                            itemCount: 5,
                                                            itemSize: 15,
                                                            glowColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 50,
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_right_rounded,
                                                              color:
                                                                  Colors.black,
                                                              size: 30,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'Valoraciones');
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 20, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/580/600',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/580/600',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/580/600',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/580/600',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 30,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -0.55),
                                                      child: Text(
                                                        '...',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 25,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 0,
                                                                  30, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, -0.55),
                                                            child: Text(
                                                              '[date]',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '[User Name]',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  RatingBar
                                                                      .builder(
                                                                    onRatingUpdate:
                                                                        (newValue) =>
                                                                            setState(() =>
                                                                                ratingBarValue2 = newValue),
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    initialRating:
                                                                        ratingBarValue2 ??=
                                                                            3,
                                                                    unratedColor:
                                                                        Color(
                                                                            0xFFE9E9E9),
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        20,
                                                                    glowColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Aquí va reseña completa tras haber comprando',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.8500000000000001,
                                                          0),
                                                ),
                                              ),
                                            ],
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
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: responsiveVisibility(
                            context: context,
                            tabletLandscape: false,
                            desktop: false,
                          ),
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
                              List<VariantsRecord> productoVariantsRecordList =
                                  snapshot.data;
                              final productoVariantsRecord =
                                  productoVariantsRecordList.isNotEmpty
                                      ? productoVariantsRecordList.first
                                      : null;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed('MarcaSingle');
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  columnProductsRecord
                                                      .brandLogo,
                                                  'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: FaIcon(
                                            FontAwesomeIcons.share,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              await actions.likeProduct(
                                                currentUserUid,
                                                widget.productId,
                                              );
                                            },
                                            child: ToggleLikeProductWidget(
                                              productId: widget.productId,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 380,
                                            child: PageView(
                                              controller: pageViewController ??=
                                                  PageController(
                                                      initialPage: 0),
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Image.network(
                                                  valueOrDefault<String>(
                                                    columnProductsRecord
                                                        .mainImage,
                                                    'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                  ),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                if (loggedIn ?? true)
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 20,
                                                          color:
                                                              Color(0x0D000000),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 80, 0, 0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(25, 0,
                                                                    25, 10),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  columnProductsRecord
                                                                      .sales
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontSize:
                                                                            13,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  ' vendidos',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontSize:
                                                                            13,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FAF1E2),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25,
                                                                          0,
                                                                          25,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            formatNumber(
                                                                              productoVariantsRecord.publicPrice,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.periodDecimal,
                                                                              currency: '',
                                                                            ),
                                                                            'Cotizar',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color(0xFF1EEBBD),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        formatNumber(
                                                                          productoVariantsRecord
                                                                              .publicPrice,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                          currency:
                                                                              '',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: Color(0xFFE7E7E7),
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FontStyle.italic,
                                                                              decoration: TextDecoration.lineThrough,
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
                                                                          25,
                                                                          10,
                                                                          25,
                                                                          10),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  if (productoVariantsRecord
                                                                          .tags
                                                                          .toList()
                                                                          ?.contains(
                                                                              'Oferta') ??
                                                                      true)
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              3,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.tag,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                13,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            'Oferta',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  fontSize: 13,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (productoVariantsRecord
                                                                          .tags
                                                                          .toList()
                                                                          ?.contains(
                                                                              'Envio Gratis') ??
                                                                      true)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              15,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FaIcon(
                                                                            FontAwesomeIcons.shippingFast,
                                                                            color:
                                                                                Color(0xFF5AE93E),
                                                                            size:
                                                                                12,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              'Envio Gratis',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Color(0xFF5AE93E),
                                                                                    fontSize: 13,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    20, 0, 0),
                                                        child: Text(
                                                          columnProductsRecord
                                                              .title,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00EEEEEE),
                                                          ),
                                                          child: Text(
                                                            columnProductsRecord
                                                                .description,
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    10, 20, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                'CotizacionFormulario');
                                                          },
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
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await launchURL(
                                                                        'http://tienda.srconstruccion.com');
                                                                  },
                                                                  text:
                                                                      'Cotizar',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .forum_rounded,
                                                                    size: 15,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 130,
                                                                    height: 30,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    10, 20, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                              child: Text(
                                                                'Escoger unidad',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                            FutureBuilder<
                                                                ApiCallResponse>(
                                                              future:
                                                                  GetApplicableVariantsCall
                                                                      .call(
                                                                productId: widget
                                                                    .productId,
                                                                userLocation:
                                                                    FFAppState()
                                                                        .locationKey,
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
                                                                final rowGetApplicableVariantsResponse =
                                                                    snapshot
                                                                        .data;
                                                                return Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final units =
                                                                        getJsonField(
                                                                              (rowGetApplicableVariantsResponse?.jsonBody ?? ''),
                                                                              r'''$.variants''',
                                                                            )?.toList() ??
                                                                            [];
                                                                    return SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: List.generate(
                                                                            units.length,
                                                                            (unitsIndex) {
                                                                          final unitsItem =
                                                                              units[unitsIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                setState(() => FFAppState().currentVariant = getJsonField(
                                                                                      unitsItem,
                                                                                      r'''$.id''',
                                                                                    ).toString());
                                                                              },
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  borderRadius: BorderRadius.circular(50),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      unitsItem,
                                                                                      r'''$.unit''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 20,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                    child: Text(
                                                                      'Descuentos y Promociones',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    0, 0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              if ((productoVariantsRecord
                                                                      .discountRange1) !=
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 190,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              190,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0),
                                                                              bottomRight: Radius.circular(0),
                                                                              topLeft: Radius.circular(5),
                                                                              topRight: Radius.circular(5),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Text(
                                                                              'Llévate un ${valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  productoVariantsRecord.discount1,
                                                                                  formatType: FormatType.percent,
                                                                                ),
                                                                                '0',
                                                                              )} de descuento adicional comprando',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Colors.white,
                                                                                    fontSize: 11,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Text(
                                                                              'de 0 a ${valueOrDefault<String>(
                                                                                productoVariantsRecord.discountRange1.toString(),
                                                                                '0',
                                                                              )} unidades',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Color(0xFFE3A322),
                                                                                    fontSize: 13,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              if ((productoVariantsRecord
                                                                      .discountRange2) !=
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 190,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              190,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0),
                                                                              bottomRight: Radius.circular(0),
                                                                              topLeft: Radius.circular(5),
                                                                              topRight: Radius.circular(5),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Text(
                                                                              'Llévate un ${valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  productoVariantsRecord.discount2,
                                                                                  formatType: FormatType.percent,
                                                                                ),
                                                                                '0',
                                                                              )} de descuento adicional comprando',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Colors.white,
                                                                                    fontSize: 11,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Text(
                                                                              'de ${productoVariantsRecord.discountRange1.toString()} a ${valueOrDefault<String>(
                                                                                productoVariantsRecord.discountRange2.toString(),
                                                                                '0',
                                                                              )} unidades',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Color(0xFFE3A322),
                                                                                    fontSize: 13,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              if ((productoVariantsRecord
                                                                      .discountRange3) !=
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 190,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              190,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0),
                                                                              bottomRight: Radius.circular(0),
                                                                              topLeft: Radius.circular(5),
                                                                              topRight: Radius.circular(5),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Text(
                                                                              'Llévate un ${formatNumber(
                                                                                productoVariantsRecord.discount3,
                                                                                formatType: FormatType.percent,
                                                                              )} de descuento adicional comprando',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Colors.white,
                                                                                    fontSize: 11,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Text(
                                                                              'de ${valueOrDefault<String>(
                                                                                productoVariantsRecord.discount3.toString(),
                                                                                '0',
                                                                              )} o más unidades',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Color(0xFFE3A322),
                                                                                    fontSize: 13,
                                                                                  ),
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 20,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            FutureBuilder<
                                                                ApiCallResponse>(
                                                              future:
                                                                  CheckIfProductInCartCall
                                                                      .call(
                                                                uid:
                                                                    currentUserUid,
                                                                variantId:
                                                                    productoVariantsRecord
                                                                        .id,
                                                                cartId:
                                                                    currentUserUid,
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
                                                                final columnCheckIfProductInCartResponse =
                                                                    snapshot
                                                                        .data;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              20,
                                                                              0,
                                                                              0,
                                                                              20),
                                                                      child:
                                                                          Text(
                                                                        'Ordenar por tiempo de entrega',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.bolt,
                                                                                  color: Color(0xFF76E735),
                                                                                  size: 24,
                                                                                ),
                                                                                Container(
                                                                                  width: 68,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                    child: Text(
                                                                                      'Express\n30 min.',
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF76E735),
                                                                                            fontSize: 13,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FontStyle.italic,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              productoVariantsRecord.publicPrice,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: '',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Color(0xFF1EEBBD),
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FutureBuilder<ApiCallResponse>(
                                                                                            future: GetVariantInventoryCall.call(
                                                                                              productId: widget.productId,
                                                                                              variantId: productoVariantsRecord.id,
                                                                                              userLocationState: FFAppState().locationKey,
                                                                                              userLocationCity: FFAppState().locationKeyCity,
                                                                                              priceType: 'public',
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
                                                                                              final containerGetVariantInventoryResponse = snapshot.data;
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
                                                                                                        (containerGetVariantInventoryResponse?.jsonBody ?? ''),
                                                                                                        r'''$.inventory''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            color: Color(0xFFAEAEAE),
                                                                                                            fontSize: 11,
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
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(4),
                                                                                shape: BoxShape.rectangle,
                                                                                border: Border.all(
                                                                                  color: Color(0xFFE9E9E9),
                                                                                  width: 1,
                                                                                ),
                                                                              ),
                                                                              child: FlutterFlowCountController(
                                                                                decrementIconBuilder: (enabled) => FaIcon(
                                                                                  FontAwesomeIcons.minus,
                                                                                  color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                                                                                  size: 20,
                                                                                ),
                                                                                incrementIconBuilder: (enabled) => FaIcon(
                                                                                  FontAwesomeIcons.plus,
                                                                                  color: enabled ? FlutterFlowTheme.of(context).primaryColor : Color(0xFFEEEEEE),
                                                                                  size: 20,
                                                                                ),
                                                                                countBuilder: (count) => Text(
                                                                                  count.toString(),
                                                                                  style: GoogleFonts.getFont(
                                                                                    'Roboto',
                                                                                    color: Colors.black,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 16,
                                                                                  ),
                                                                                ),
                                                                                count: expressCountValue ??= CheckIfProductInCartCall.expressShipAmount(
                                                                                  (columnCheckIfProductInCartResponse?.jsonBody ?? ''),
                                                                                ),
                                                                                updateCount: (count) => setState(() => expressCountValue = count),
                                                                                stepSize: 1,
                                                                                minimum: 0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              20),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              0,
                                                                              20,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FaIcon(
                                                                                    FontAwesomeIcons.clock,
                                                                                    color: Colors.black,
                                                                                    size: 20,
                                                                                  ),
                                                                                  Container(
                                                                                    width: 68,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x00EEEEEE),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: Text(
                                                                                        'Estándar\n1-5 días',
                                                                                        textAlign: TextAlign.end,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 13,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                if ((valueOrDefault(currentUserDocument?.type, '')) == 'public')
                                                                                                  AuthUserStreamWidget(
                                                                                                    child: Text(
                                                                                                      formatNumber(
                                                                                                        productoVariantsRecord.publicPrice,
                                                                                                        formatType: FormatType.decimal,
                                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                                        currency: '',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            color: Color(0xFF1EEBBD),
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if ((valueOrDefault(currentUserDocument?.type, '')) == 'wholesale')
                                                                                                  AuthUserStreamWidget(
                                                                                                    child: Text(
                                                                                                      formatNumber(
                                                                                                        productoVariantsRecord.wholesalePrice,
                                                                                                        formatType: FormatType.decimal,
                                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                                        currency: '',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            color: Color(0xFF1EEBBD),
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if ((valueOrDefault(currentUserDocument?.type, '')) == 'megaWholesale')
                                                                                                  AuthUserStreamWidget(
                                                                                                    child: Text(
                                                                                                      formatNumber(
                                                                                                        productoVariantsRecord.megaWholesalePrice,
                                                                                                        formatType: FormatType.decimal,
                                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                                        currency: '',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            color: Color(0xFF1EEBBD),
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 89,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00EEEEEE),
                                                                                              ),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'disponible',
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
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  borderRadius: BorderRadius.circular(4),
                                                                                  shape: BoxShape.rectangle,
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFE9E9E9),
                                                                                    width: 1,
                                                                                  ),
                                                                                ),
                                                                                child: FlutterFlowCountController(
                                                                                  decrementIconBuilder: (enabled) => FaIcon(
                                                                                    FontAwesomeIcons.minus,
                                                                                    color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                                                                                    size: 20,
                                                                                  ),
                                                                                  incrementIconBuilder: (enabled) => FaIcon(
                                                                                    FontAwesomeIcons.plus,
                                                                                    color: enabled ? FlutterFlowTheme.of(context).primaryColor : Color(0xFFEEEEEE),
                                                                                    size: 20,
                                                                                  ),
                                                                                  countBuilder: (count) => Text(
                                                                                    count.toString(),
                                                                                    style: GoogleFonts.getFont(
                                                                                      'Roboto',
                                                                                      color: Colors.black,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  ),
                                                                                  count: normalShipmentCountValue ??= CheckIfProductInCartCall.normalShipAmount(
                                                                                    (columnCheckIfProductInCartResponse?.jsonBody ?? ''),
                                                                                  ),
                                                                                  updateCount: (count) => setState(() => normalShipmentCountValue = count),
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    5, 0),
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
                                                                Text(
                                                                  'Comprar y Recoger en tienda',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              borderWidth: 1,
                                                              buttonSize: 50,
                                                              icon: Icon(
                                                                Icons
                                                                    .add_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'VendedoresEnMapa');
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final stores = FFAppState()
                                                                    .localStores
                                                                    ?.toList() ??
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
                                                                        .spaceEvenly,
                                                                children: List.generate(
                                                                    stores
                                                                        .length,
                                                                    (storesIndex) {
                                                                  final storesItem =
                                                                      stores[
                                                                          storesIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            StoresRecord>>(
                                                                      stream:
                                                                          queryStoresRecord(
                                                                        queryBuilder: (storesRecord) => storesRecord.where(
                                                                            'id',
                                                                            isEqualTo:
                                                                                storesItem),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: SpinKitFadingCircle(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 50,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<StoresRecord>
                                                                            sellerStoresRecordList =
                                                                            snapshot.data;
                                                                        // Return an empty Container when the document does not exist.
                                                                        if (snapshot
                                                                            .data
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final sellerStoresRecord = sellerStoresRecordList.isNotEmpty
                                                                            ? sellerStoresRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          width:
                                                                              190,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 5,
                                                                                color: Color(0x3D000000),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Stack(
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0, -1),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0),
                                                                                        bottomRight: Radius.circular(0),
                                                                                        topLeft: Radius.circular(10),
                                                                                        topRight: Radius.circular(10),
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          sellerStoresRecord.banner,
                                                                                          'https://images.pexels.com/photos/4312860/pexels-photo-4312860.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                                                        ),
                                                                                        width: 220,
                                                                                        height: 70,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                                                    child: InkWell(
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          'PerfilDelSeller',
                                                                                          params: {
                                                                                            'storeId': serializeParam(sellerStoresRecord.id, ParamType.String),
                                                                                          }.withoutNulls,
                                                                                          queryParams: {
                                                                                            'calledFromPage': serializeParam('productPage', ParamType.String),
                                                                                            'productId': serializeParam(widget.productId, ParamType.String),
                                                                                            'variantId': serializeParam(FFAppState().currentVariant, ParamType.String),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0, -1),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(50),
                                                                                                child: Image.network(
                                                                                                  valueOrDefault<String>(
                                                                                                    sellerStoresRecord.logo,
                                                                                                    'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                                                  ),
                                                                                                  width: 70,
                                                                                                  height: 70,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            sellerStoresRecord.name,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                            child: Text(
                                                                                              sellerStoresRecord.address.maybeHandleOverflow(maxChars: 15),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    fontSize: 12,
                                                                                                    fontWeight: FontWeight.w300,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                                child: FutureBuilder<ApiCallResponse>(
                                                                                                  future: GetVariantInventoryByStoreCall.call(
                                                                                                    productId: widget.productId,
                                                                                                    variantId: FFAppState().currentVariant,
                                                                                                    store: storesItem,
                                                                                                    priceType: 'public',
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
                                                                                                      GetVariantInventoryByStoreCall.inventory(
                                                                                                        (textGetVariantInventoryByStoreResponse?.jsonBody ?? ''),
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            color: Color(0xFFA8A8A8),
                                                                                                            fontSize: 11,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                                child: Text(
                                                                                                  ' disponibles',
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Montserrat',
                                                                                                        color: Color(0xFFA8A8A8),
                                                                                                        fontSize: 11,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                                child: Text(
                                                                                                  formatNumber(
                                                                                                    productoVariantsRecord.publicPrice,
                                                                                                    formatType: FormatType.decimal,
                                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                                    currency: '',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Montserrat',
                                                                                                        color: Color(0xFF1EEBBD),
                                                                                                        fontSize: 13,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                                child: Text(
                                                                                                  ' x unidad',
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Montserrat',
                                                                                                        fontSize: 13,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
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
                                          0, 30, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 350,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: DefaultTabController(
                                              length: 3,
                                              initialIndex: 0,
                                              child: Column(
                                                children: [
                                                  TabBar(
                                                    labelColor: Colors.black,
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 13,
                                                            ),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryColor,
                                                    indicatorWeight: 3,
                                                    tabs: [
                                                      Tab(
                                                        text: 'Detalles',
                                                      ),
                                                      Tab(
                                                        text: 'Ficha técnica',
                                                      ),
                                                      Tab(
                                                        text: 'Garantía',
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: TabBarView(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      30,
                                                                      20,
                                                                      30,
                                                                      0),
                                                          child: Text(
                                                            'Ver página de cátalogo PDF\t257\nPotencia\t370 W / 1/2 HP\nVelocidad de disco\t3,500 rpm\nCapacidad de disco\t6\" (15 cm)\nCapacidad de banda\t4\" x 36\" (10 x 90 cm)\nVelocidad de banda\t600 m/min\nMesa de trabajo\t9\" x 6\" (23 x 15 cm)\nTensión / Frecuencia\t127 V / 60 Hz\nConsumo\t4.5 A\nCiclo de trabajo\t50 minutos de trabajo por 20 minutos de descanso. Máximo diario 6 horas\nPeso\t16 kg\nEmpaque individual\tCaja',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 11,
                                                                ),
                                                          ),
                                                        ),
                                                        FlutterFlowPdfViewer(
                                                          assetPath:
                                                              'assets/pdfs/SS._Obra_Misional_2_Trimestre_2022.pdf',
                                                          horizontalScroll:
                                                              true,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      30,
                                                                      20,
                                                                      30,
                                                                      0),
                                                          child: Text(
                                                            'Todos nuestros productos son fabricados bajo una estricta supervisión, con estándares internacionales de calidad y cuentan con garantía contra defectos de fabricación y mano de obra. Para conocer los procedimientos necesarios para hacer válidas nuestras garantías o para cualquier información adicional, comunícate con nosotros.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 11,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 10, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'Valoraciones');
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Valoraciones',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        RatingBar.builder(
                                                          onRatingUpdate: (newValue) =>
                                                              setState(() =>
                                                                  ratingBarValue3 =
                                                                      newValue),
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(
                                                            Icons.star_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                          ),
                                                          direction:
                                                              Axis.horizontal,
                                                          initialRating:
                                                              ratingBarValue3 ??=
                                                                  3,
                                                          unratedColor:
                                                              Color(0xFFDDDDDD),
                                                          itemCount: 5,
                                                          itemSize: 15,
                                                          glowColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryColor,
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 50,
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_right_rounded,
                                                            color: Colors.black,
                                                            size: 30,
                                                          ),
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                                'Valoraciones');
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 20, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/580/600',
                                                      width: 60,
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/580/600',
                                                      width: 60,
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/580/600',
                                                      width: 60,
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/580/600',
                                                      width: 60,
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 30,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, -0.55),
                                                    child: Text(
                                                      '...',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 25,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 30, 10),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1, -0.55),
                                                          child: Text(
                                                            '[date]',
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '[User Name]',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                RatingBar
                                                                    .builder(
                                                                  onRatingUpdate:
                                                                      (newValue) =>
                                                                          setState(() =>
                                                                              ratingBarValue4 = newValue),
                                                                  itemBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          Icon(
                                                                    Icons
                                                                        .star_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                  ),
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  initialRating:
                                                                      ratingBarValue4 ??=
                                                                          3,
                                                                  unratedColor:
                                                                      Color(
                                                                          0xFFE9E9E9),
                                                                  itemCount: 5,
                                                                  itemSize: 20,
                                                                  glowColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Aquí va reseña completa tras haber comprando',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.8500000000000001, 0),
                                              ),
                                            ),
                                          ],
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
