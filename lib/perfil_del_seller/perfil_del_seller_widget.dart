import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/envio_gratis_widget.dart';
import '../components/seller_details_widget.dart';
import '../components/seller_feed_widget.dart';
import '../components/toggle_like_store_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PerfilDelSellerWidget extends StatefulWidget {
  const PerfilDelSellerWidget({
    Key key,
    this.storeId,
    this.calledFromPage,
    this.productId,
    this.variantId,
    this.storeName,
  }) : super(key: key);

  final String storeId;
  final String calledFromPage;
  final String productId;
  final String variantId;
  final String storeName;

  @override
  _PerfilDelSellerWidgetState createState() => _PerfilDelSellerWidgetState();
}

class _PerfilDelSellerWidgetState extends State<PerfilDelSellerWidget> {
  String currentUserState;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      currentUserState = await actions.getGeoState(
        functions.getLatitudeFromLatlng(currentUserLocationValue),
        functions.getLongitudeFromLatlng(currentUserLocationValue),
      );
      setState(() => FFAppState().locationKey = currentUserState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StoresRecord>>(
      future: queryStoresRecordOnce(
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
        List<StoresRecord> perfilDelSellerStoresRecordList = snapshot.data;
        final perfilDelSellerStoresRecord =
            perfilDelSellerStoresRecordList.isNotEmpty
                ? perfilDelSellerStoresRecordList.first
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
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 25,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.search,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 15,
                ),
                onPressed: () async {
                  context.pushNamed('searchProductsSeller');
                },
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: Color(0x00FFFFFF),
            elevation: 0,
            label: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: AlignmentDirectional(0, 0),
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x28000000),
                          )
                        ],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.person_outline,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed(
                                'Perfil',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            icon: Icon(
                              Icons.home_outlined,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed(
                                'HomeAlt',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.notifications_none,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed(
                                'Notificaciones',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1.05,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 320,
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 200,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                perfilDelSellerStoresRecord
                                                                    .banner,
                                                                'https://images.pexels.com/photos/4312860/pexels-photo-4312860.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                              ),
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 200,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x43000000),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1,
                                                                              -1),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                10,
                                                                                0,
                                                                                0),
                                                                            child:
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
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
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
                                                                                        'storeName': serializeParam(perfilDelSellerStoresRecord.name, ParamType.String),
                                                                                      }.withoutNulls,
                                                                                      queryParams: {
                                                                                        'storeId': serializeParam(widget.storeId, ParamType.String),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  text: GetCartAmountCall.amount(
                                                                                    (buttonGetCartAmountResponse?.jsonBody ?? ''),
                                                                                  ).toString(),
                                                                                  icon: Icon(
                                                                                    Icons.shopping_bag_outlined,
                                                                                    size: 15,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: 100,
                                                                                    height: 40,
                                                                                    color: Color(0xFF1EEBBD),
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Colors.white,
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                    elevation: 2,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(25),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              70,
                                                                          height:
                                                                              70,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              perfilDelSellerStoresRecord.logo,
                                                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            perfilDelSellerStoresRecord.name,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.white,
                                                                                  fontSize: 20,
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
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 1),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 190,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 500,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5,
                                                            color: Color(
                                                                0x16000000),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 5,
                                                                    10, 5),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            17,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'Entrega Express: 30 min',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            25,
                                                                        height:
                                                                            25,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 5,
                                                                              color: Color(0x1C000000),
                                                                            )
                                                                          ],
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            ToggleLikeStoreWidget(
                                                                          storeId:
                                                                              widget.storeId,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25,
                                                                          height:
                                                                              25,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 5,
                                                                                color: Color(0x1C000000),
                                                                              )
                                                                            ],
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.share,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                15,
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
                                                                          10,
                                                                          5,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Opciones de Envío Disponibles',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          11,
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
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  if (perfilDelSellerStoresRecord
                                                                          .transports
                                                                          .toList()
                                                                          ?.contains(
                                                                              'bycicle') ??
                                                                      true)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .bicycle,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          'Bicicleta',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.black,
                                                                                fontSize: 10,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (perfilDelSellerStoresRecord
                                                                          .transports
                                                                          .toList()
                                                                          ?.contains(
                                                                              'motorcycle') ??
                                                                      true)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .motorcycle,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          'Moto',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.black,
                                                                                fontSize: 10,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (perfilDelSellerStoresRecord
                                                                          .transports
                                                                          .toList()
                                                                          ?.contains(
                                                                              'car') ??
                                                                      true)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .carSide,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          'Carro',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.black,
                                                                                fontSize: 10,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (perfilDelSellerStoresRecord
                                                                          .transports
                                                                          .toList()
                                                                          ?.contains(
                                                                              'van') ??
                                                                      true)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .shuttleVan,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          'Camioneta',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.black,
                                                                                fontSize: 10,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (perfilDelSellerStoresRecord
                                                                          .transports
                                                                          .toList()
                                                                          ?.contains(
                                                                              'truck') ??
                                                                      true)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .truckPickup,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          'Camión',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.black,
                                                                                fontSize: 10,
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
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          5),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
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
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            SellerDetailsWidget(
                                                                          storeId:
                                                                              widget.storeId,
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
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            5,
                                                                            10,
                                                                            5),
                                                                        child:
                                                                            Text(
                                                                          'Dirección',
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            5,
                                                                            10,
                                                                            5),
                                                                        child:
                                                                            Text(
                                                                          'Horario de Apertura',
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, -0.4),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  StreamBuilder<
                                                                      List<
                                                                          ProductsRecord>>(
                                                                    stream:
                                                                        queryProductsRecord(
                                                                      queryBuilder: (productsRecord) => productsRecord.where(
                                                                          'stores',
                                                                          arrayContains:
                                                                              widget.storeId),
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
                                                                      List<ProductsRecord>
                                                                          textProductsRecordList =
                                                                          snapshot
                                                                              .data;
                                                                      return Text(
                                                                        textProductsRecordList
                                                                            .length
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: Color(0xFFC4C4C4),
                                                                              fontSize: 11,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      ' productos',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0xFFC4C4C4),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 10, 15, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'searchProductsSeller');
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      height: 50,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 500,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Row(
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
                                                                        20,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Buscar',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        5,
                                                                        0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 5,
                                                              borderWidth: 1,
                                                              buttonSize: 40,
                                                              fillColor: Color(
                                                                  0xFF1EEBBD),
                                                              icon: Icon(
                                                                Icons.search,
                                                                color: Colors
                                                                    .white,
                                                                size: 15,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
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
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 20, 0, 0),
                                          child: StreamBuilder<
                                              List<StoreBrandsRecord>>(
                                            stream: queryStoreBrandsRecord(
                                              parent:
                                                  perfilDelSellerStoresRecord
                                                      .reference,
                                              queryBuilder:
                                                  (storeBrandsRecord) =>
                                                      storeBrandsRecord.where(
                                                          'id',
                                                          isNotEqualTo:
                                                              widget.storeId),
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
                                              List<StoreBrandsRecord>
                                                  subcategorasStoreBrandsRecordList =
                                                  snapshot.data;
                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      subcategorasStoreBrandsRecordList
                                                          .length,
                                                      (subcategorasIndex) {
                                                    final subcategorasStoreBrandsRecord =
                                                        subcategorasStoreBrandsRecordList[
                                                            subcategorasIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 0),
                                                      child: Container(
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                subcategorasStoreBrandsRecord
                                                                    .id,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      if (loggedIn ?? true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 20),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width: 6,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Mis Favoritos',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 25, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'ProductListingForSeller');
                                                      },
                                                      child: Text(
                                                        'Ver más',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (loggedIn ?? true)
                                        SellerFeedWidget(
                                          storeId: widget.storeId,
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(25,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: 6,
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Ofertas',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 25, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'ProductListingForSeller',
                                                        params: {
                                                          'storeId':
                                                              serializeParam(
                                                                  widget
                                                                      .storeId,
                                                                  ParamType
                                                                      .String),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      'Ver más',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      StreamBuilder<List<ProductsRecord>>(
                                        stream: queryProductsRecord(
                                          queryBuilder: (productsRecord) =>
                                              productsRecord
                                                  .where('stores',
                                                      arrayContains:
                                                          widget.storeId)
                                                  .where('isInSale',
                                                      isEqualTo: true),
                                          limit: 10,
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
                                          List<ProductsRecord>
                                              rowProductsRecordList =
                                              snapshot.data;
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  rowProductsRecordList.length,
                                                  (rowIndex) {
                                                final rowProductsRecord =
                                                    rowProductsRecordList[
                                                        rowIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: AuthUserStreamWidget(
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: GetOneVariantCall
                                                          .call(
                                                        productId:
                                                            rowProductsRecord
                                                                .id,
                                                        userLocation:
                                                            FFAppState()
                                                                .locationKey,
                                                        userType: valueOrDefault(
                                                            currentUserDocument
                                                                ?.type,
                                                            ''),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final cageGetOneVariantResponse =
                                                            snapshot.data;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ProductPageSeller',
                                                              params: {
                                                                'storeName': serializeParam(
                                                                    perfilDelSellerStoresRecord
                                                                        .name,
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
                                                                    perfilDelSellerStoresRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 180,
                                                            height: 280,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: Color(
                                                                      0x17000000),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: StreamBuilder<
                                                                List<
                                                                    VariantsRecord>>(
                                                              stream:
                                                                  queryVariantsRecord(
                                                                parent:
                                                                    rowProductsRecord
                                                                        .reference,
                                                                queryBuilder: (variantsRecord) => variantsRecord.where(
                                                                    'id',
                                                                    isEqualTo:
                                                                        GetOneVariantCall
                                                                            .id(
                                                                      (cageGetOneVariantResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()),
                                                                singleRecord:
                                                                    true,
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
                                                                List<VariantsRecord>
                                                                    columnVariantsRecordList =
                                                                    snapshot
                                                                        .data;
                                                                // Return an empty Container when the document does not exist.
                                                                if (snapshot
                                                                    .data
                                                                    .isEmpty) {
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
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              5),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                rowProductsRecord.brandLogo,
                                                                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                'Exclusivo en',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Colors.black,
                                                                                      fontSize: 9,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              StreamBuilder<List<StoresRecord>>(
                                                                                stream: queryStoresRecord(
                                                                                  queryBuilder: (storesRecord) => storesRecord.where('id', isEqualTo: widget.storeId),
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
                                                                                  List<StoresRecord> textStoresRecordList = snapshot.data;
                                                                                  // Return an empty Container when the document does not exist.
                                                                                  if (snapshot.data.isEmpty) {
                                                                                    return Container();
                                                                                  }
                                                                                  final textStoresRecord = textStoresRecordList.isNotEmpty ? textStoresRecordList.first : null;
                                                                                  return InkWell(
                                                                                    onTap: () async {
                                                                                      context.pushNamed('PerfilDelSeller');
                                                                                    },
                                                                                    child: Text(
                                                                                      textStoresRecord.name,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            fontSize: 9,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          rowProductsRecord
                                                                              .mainImage,
                                                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                        ),
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            if (columnVariantsRecord.tags.toList()?.contains('Oferta') ??
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.tag,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      size: 13,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: Text(
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
                                                                              ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1, -0.45),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Text(
                                                                                  rowProductsRecord.title.maybeHandleOverflow(
                                                                                    maxChars: 40,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Colors.black,
                                                                                        fontSize: 13,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -0.7),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      '\$',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 22,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -0.7),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 5),
                                                                                    child: Text(
                                                                                      GetOneVariantCall.price(
                                                                                        (cageGetOneVariantResponse?.jsonBody ?? ''),
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 22,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            if (columnVariantsRecord.tags.toList()?.contains('Envio Gratis') ??
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: EnvioGratisWidget(),
                                                                              ),
                                                                          ],
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
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(25,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: 6,
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Productos únicos',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 25, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'ProductListingForSeller',
                                                        params: {
                                                          'storeId':
                                                              serializeParam(
                                                                  widget
                                                                      .storeId,
                                                                  ParamType
                                                                      .String),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      'Ver más',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      StreamBuilder<List<ProductsRecord>>(
                                        stream: queryProductsRecord(
                                          queryBuilder: (productsRecord) =>
                                              productsRecord.where('owner',
                                                  isEqualTo: widget.storeId),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProductsRecord>
                                              rowProductsRecordList =
                                              snapshot.data;
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  rowProductsRecordList.length,
                                                  (rowIndex) {
                                                final rowProductsRecord =
                                                    rowProductsRecordList[
                                                        rowIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: AuthUserStreamWidget(
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: GetOneVariantCall
                                                          .call(
                                                        productId:
                                                            rowProductsRecord
                                                                .id,
                                                        userLocation:
                                                            FFAppState()
                                                                .locationKey,
                                                        userType: valueOrDefault(
                                                            currentUserDocument
                                                                ?.type,
                                                            ''),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final cageGetOneVariantResponse =
                                                            snapshot.data;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ProductPageSeller',
                                                              params: {
                                                                'storeName': serializeParam(
                                                                    perfilDelSellerStoresRecord
                                                                        .name,
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
                                                                    perfilDelSellerStoresRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 180,
                                                            height: 280,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: Color(
                                                                      0x17000000),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: StreamBuilder<
                                                                List<
                                                                    VariantsRecord>>(
                                                              stream:
                                                                  queryVariantsRecord(
                                                                parent:
                                                                    rowProductsRecord
                                                                        .reference,
                                                                queryBuilder: (variantsRecord) => variantsRecord.where(
                                                                    'id',
                                                                    isEqualTo:
                                                                        GetOneVariantCall
                                                                            .id(
                                                                      (cageGetOneVariantResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()),
                                                                singleRecord:
                                                                    true,
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
                                                                List<VariantsRecord>
                                                                    columnVariantsRecordList =
                                                                    snapshot
                                                                        .data;
                                                                final columnVariantsRecord =
                                                                    columnVariantsRecordList
                                                                            .isNotEmpty
                                                                        ? columnVariantsRecordList
                                                                            .first
                                                                        : null;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              5),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                rowProductsRecord.brandLogo,
                                                                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                'Exclusivo en',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Colors.black,
                                                                                      fontSize: 9,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    'PerfilDelSeller',
                                                                                    queryParams: {
                                                                                      'storeId': serializeParam(widget.storeId, ParamType.String),
                                                                                      'calledFromPage': serializeParam('perfil', ParamType.String),
                                                                                      'productId': serializeParam('\"\"', ParamType.String),
                                                                                      'variantId': serializeParam('\"\"', ParamType.String),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  perfilDelSellerStoresRecord.name,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        fontSize: 9,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          rowProductsRecord
                                                                              .mainImage,
                                                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                        ),
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            if (columnVariantsRecord.tags.toList()?.contains('Oferta') ??
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.tag,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      size: 13,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: Text(
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
                                                                              ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1, -0.45),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Text(
                                                                                  rowProductsRecord.title.maybeHandleOverflow(
                                                                                    maxChars: 40,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Colors.black,
                                                                                        fontSize: 13,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -0.7),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      '\$',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -0.7),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 5),
                                                                                    child: Text(
                                                                                      GetOneVariantCall.price(
                                                                                        (cageGetOneVariantResponse?.jsonBody ?? ''),
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 22,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            if (columnVariantsRecord.tags.toList()?.contains('Envio Gratis') ??
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: EnvioGratisWidget(),
                                                                              ),
                                                                          ],
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
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(25,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: 6,
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Añadidos Recientemente',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 25, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'ProductListingForSeller',
                                                        params: {
                                                          'storeId':
                                                              serializeParam(
                                                                  widget
                                                                      .storeId,
                                                                  ParamType
                                                                      .String),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      'Ver más',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      StreamBuilder<List<ProductsRecord>>(
                                        stream: queryProductsRecord(
                                          queryBuilder: (productsRecord) =>
                                              productsRecord
                                                  .where('owner',
                                                      isEqualTo: widget.storeId)
                                                  .orderBy('createdDate',
                                                      descending: true),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProductsRecord>
                                              rowProductsRecordList =
                                              snapshot.data;
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  rowProductsRecordList.length,
                                                  (rowIndex) {
                                                final rowProductsRecord =
                                                    rowProductsRecordList[
                                                        rowIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: AuthUserStreamWidget(
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: GetOneVariantCall
                                                          .call(
                                                        productId:
                                                            rowProductsRecord
                                                                .id,
                                                        userLocation:
                                                            FFAppState()
                                                                .locationKey,
                                                        userType: valueOrDefault(
                                                            currentUserDocument
                                                                ?.type,
                                                            ''),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final cageGetOneVariantResponse =
                                                            snapshot.data;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ProductPageSeller',
                                                              params: {
                                                                'storeName': serializeParam(
                                                                    perfilDelSellerStoresRecord
                                                                        .name,
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
                                                                    perfilDelSellerStoresRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 180,
                                                            height: 280,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: Color(
                                                                      0x17000000),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: StreamBuilder<
                                                                List<
                                                                    VariantsRecord>>(
                                                              stream:
                                                                  queryVariantsRecord(
                                                                parent:
                                                                    rowProductsRecord
                                                                        .reference,
                                                                queryBuilder: (variantsRecord) => variantsRecord.where(
                                                                    'id',
                                                                    isEqualTo:
                                                                        GetOneVariantCall
                                                                            .id(
                                                                      (cageGetOneVariantResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()),
                                                                singleRecord:
                                                                    true,
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
                                                                List<VariantsRecord>
                                                                    columnVariantsRecordList =
                                                                    snapshot
                                                                        .data;
                                                                final columnVariantsRecord =
                                                                    columnVariantsRecordList
                                                                            .isNotEmpty
                                                                        ? columnVariantsRecordList
                                                                            .first
                                                                        : null;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              5),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                rowProductsRecord.brandLogo,
                                                                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                'Exclusivo en',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Colors.black,
                                                                                      fontSize: 9,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    'PerfilDelSeller',
                                                                                    queryParams: {
                                                                                      'storeId': serializeParam(widget.storeId, ParamType.String),
                                                                                      'calledFromPage': serializeParam('perfil', ParamType.String),
                                                                                      'productId': serializeParam('l', ParamType.String),
                                                                                      'variantId': serializeParam('l', ParamType.String),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  perfilDelSellerStoresRecord.name,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        fontSize: 9,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          rowProductsRecord
                                                                              .mainImage,
                                                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                        ),
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            if (columnVariantsRecord.tags.toList()?.contains('Oferta') ??
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.tag,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      size: 13,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: Text(
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
                                                                              ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1, -0.45),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Text(
                                                                                  rowProductsRecord.title.maybeHandleOverflow(
                                                                                    maxChars: 40,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Colors.black,
                                                                                        fontSize: 13,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -0.7),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      '\$',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 22,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -0.7),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 5),
                                                                                    child: Text(
                                                                                      GetOneVariantCall.price(
                                                                                        (cageGetOneVariantResponse?.jsonBody ?? ''),
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 22,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            if (columnVariantsRecord.tags.toList()?.contains('Envio Gratis') ??
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: EnvioGratisWidget(),
                                                                              ),
                                                                          ],
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
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(25,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: 6,
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Más vendidos',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 25, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'ProductListingForSeller',
                                                        params: {
                                                          'storeId':
                                                              serializeParam(
                                                                  widget
                                                                      .storeId,
                                                                  ParamType
                                                                      .String),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      'Ver más',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      StreamBuilder<List<ProductsRecord>>(
                                        stream: queryProductsRecord(
                                          queryBuilder: (productsRecord) =>
                                              productsRecord
                                                  .where('owner',
                                                      isEqualTo: widget.storeId)
                                                  .orderBy('sales',
                                                      descending: true),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProductsRecord>
                                              rowProductsRecordList =
                                              snapshot.data;
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  rowProductsRecordList.length,
                                                  (rowIndex) {
                                                final rowProductsRecord =
                                                    rowProductsRecordList[
                                                        rowIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: AuthUserStreamWidget(
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: GetOneVariantCall
                                                          .call(
                                                        productId:
                                                            rowProductsRecord
                                                                .id,
                                                        userLocation:
                                                            FFAppState()
                                                                .locationKey,
                                                        userType: valueOrDefault(
                                                            currentUserDocument
                                                                ?.type,
                                                            ''),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final cageGetOneVariantResponse =
                                                            snapshot.data;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ProductPageSeller',
                                                              params: {
                                                                'storeName': serializeParam(
                                                                    perfilDelSellerStoresRecord
                                                                        .name,
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
                                                                    perfilDelSellerStoresRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 180,
                                                            height: 280,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: Color(
                                                                      0x17000000),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: StreamBuilder<
                                                                List<
                                                                    VariantsRecord>>(
                                                              stream:
                                                                  queryVariantsRecord(
                                                                parent:
                                                                    rowProductsRecord
                                                                        .reference,
                                                                queryBuilder: (variantsRecord) => variantsRecord.where(
                                                                    'id',
                                                                    isEqualTo:
                                                                        GetOneVariantCall
                                                                            .id(
                                                                      (cageGetOneVariantResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()),
                                                                singleRecord:
                                                                    true,
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
                                                                List<VariantsRecord>
                                                                    columnVariantsRecordList =
                                                                    snapshot
                                                                        .data;
                                                                final columnVariantsRecord =
                                                                    columnVariantsRecordList
                                                                            .isNotEmpty
                                                                        ? columnVariantsRecordList
                                                                            .first
                                                                        : null;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              5),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                rowProductsRecord.brandLogo,
                                                                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                'Exclusivo en',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Colors.black,
                                                                                      fontSize: 9,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed('PerfilDelSeller');
                                                                                },
                                                                                child: Text(
                                                                                  perfilDelSellerStoresRecord.name,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        fontSize: 9,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          rowProductsRecord
                                                                              .mainImage,
                                                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                        ),
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            if (columnVariantsRecord.tags.toList()?.contains('Oferta') ??
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.tag,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      size: 13,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: Text(
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
                                                                              ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1, -0.45),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Text(
                                                                                  rowProductsRecord.title.maybeHandleOverflow(
                                                                                    maxChars: 40,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Colors.black,
                                                                                        fontSize: 13,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -0.7),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      '\$',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 22,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -0.7),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 5),
                                                                                    child: Text(
                                                                                      GetOneVariantCall.price(
                                                                                        (cageGetOneVariantResponse?.jsonBody ?? ''),
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 22,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            if (columnVariantsRecord.tags.toList()?.contains('Envio Gratis') ??
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: EnvioGratisWidget(),
                                                                              ),
                                                                          ],
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
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(25,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: 6,
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Todos los productos',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 25, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'ProductListingForSeller',
                                                        params: {
                                                          'storeId':
                                                              serializeParam(
                                                                  widget
                                                                      .storeId,
                                                                  ParamType
                                                                      .String),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      'Ver más',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 100),
                                        child:
                                            FutureBuilder<List<ProductsRecord>>(
                                          future: queryProductsRecordOnce(
                                            queryBuilder: (productsRecord) =>
                                                productsRecord.where('stores',
                                                    arrayContains:
                                                        widget.storeId),
                                            limit: 10,
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
                                            List<ProductsRecord>
                                                rowProductsRecordList =
                                                snapshot.data;
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    rowProductsRecordList
                                                        .length, (rowIndex) {
                                                  final rowProductsRecord =
                                                      rowProductsRecordList[
                                                          rowIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: AuthUserStreamWidget(
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future:
                                                            GetOneVariantCall
                                                                .call(
                                                          productId:
                                                              rowProductsRecord
                                                                  .id,
                                                          userLocation:
                                                              FFAppState()
                                                                  .locationKey,
                                                          userType: valueOrDefault(
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
                                                              child: SizedBox(
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
                                                          final cageGetOneVariantResponse =
                                                              snapshot.data;
                                                          return InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'ProductPageSeller',
                                                                params: {
                                                                  'storeName': serializeParam(
                                                                      perfilDelSellerStoresRecord
                                                                          .name,
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
                                                                      perfilDelSellerStoresRecord
                                                                          .id,
                                                                      ParamType
                                                                          .String),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 180,
                                                              height: 280,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        5,
                                                                    color: Color(
                                                                        0x17000000),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      VariantsRecord>>(
                                                                stream:
                                                                    queryVariantsRecord(
                                                                  parent: rowProductsRecord
                                                                      .reference,
                                                                  queryBuilder: (variantsRecord) => variantsRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          GetOneVariantCall
                                                                              .id(
                                                                        (cageGetOneVariantResponse?.jsonBody ??
                                                                            ''),
                                                                      ).toString()),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              50,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<VariantsRecord>
                                                                      columnVariantsRecordList =
                                                                      snapshot
                                                                          .data;
                                                                  final columnVariantsRecord = columnVariantsRecordList
                                                                          .isNotEmpty
                                                                      ? columnVariantsRecordList
                                                                          .first
                                                                      : null;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            5),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
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
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Text(
                                                                                  'Exclusivo en',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Colors.black,
                                                                                        fontSize: 9,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed('PerfilDelSeller');
                                                                                  },
                                                                                  child: Text(
                                                                                    perfilDelSellerStoresRecord.name,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          fontSize: 9,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            rowProductsRecord.mainImage,
                                                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                          ),
                                                                          height:
                                                                              100,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              10,
                                                                              10,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              if (columnVariantsRecord.tags.toList()?.contains('Envio') ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FaIcon(
                                                                                        FontAwesomeIcons.tag,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        size: 13,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                        child: Text(
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
                                                                                ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1, -0.45),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Text(
                                                                                    rowProductsRecord.title.maybeHandleOverflow(
                                                                                      maxChars: 40,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Colors.black,
                                                                                          fontSize: 13,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1, -0.7),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Text(
                                                                                        '\$',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 22,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1, -0.7),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 5),
                                                                                      child: Text(
                                                                                        GetOneVariantCall.price(
                                                                                          (cageGetOneVariantResponse?.jsonBody ?? ''),
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 22,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              if (columnVariantsRecord.tags.toList()?.contains('Envio Gratis') ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: EnvioGratisWidget(),
                                                                                ),
                                                                            ],
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
                            ],
                          ),
                        ),
                      ],
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
