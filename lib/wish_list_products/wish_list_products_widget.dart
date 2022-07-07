import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/filters2_widget.dart';
import '../components/toggle_like_product_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListProductsWidget extends StatefulWidget {
  const WishListProductsWidget({Key key}) : super(key: key);

  @override
  _WishListProductsWidgetState createState() => _WishListProductsWidgetState();
}

class _WishListProductsWidgetState extends State<WishListProductsWidget> {
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
        title: Text(
          'Productos Favoritos',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Filters2Widget(),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0xFFD1D1D1),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'A-Z',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
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
                      child: AuthUserStreamWidget(
                        child: FutureBuilder<List<ProductsRecord>>(
                          future: queryProductsRecordOnce(
                            queryBuilder: (productsRecord) =>
                                productsRecord.where('id',
                                    whereIn: (currentUserDocument?.likedProducts
                                            ?.toList() ??
                                        [])),
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
                                childAspectRatio: 0.7,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewProductsRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewProductsRecord =
                                    gridViewProductsRecordList[gridViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 15, 15),
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
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              color: Color(0x10000000),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 1),
                                          child: StreamBuilder<
                                              List<VariantsRecord>>(
                                            stream: queryVariantsRecord(
                                              parent: gridViewProductsRecord
                                                  .reference,
                                              queryBuilder: (variantsRecord) =>
                                                  variantsRecord.where('id',
                                                      isEqualTo:
                                                          GetOneVariantCall.id(
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
                                              List<VariantsRecord>
                                                  columnVariantsRecordList =
                                                  snapshot.data;
                                              final columnVariantsRecord =
                                                  columnVariantsRecordList
                                                          .isNotEmpty
                                                      ? columnVariantsRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              gridViewProductsRecord
                                                                  .brandLogo,
                                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                            ),
                                                          ),
                                                        ),
                                                        ToggleLikeProductWidget(
                                                          productId:
                                                              gridViewProductsRecord
                                                                  .id,
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
                                                            'productId':
                                                                serializeParam(
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
                                                  if (columnVariantsRecord.tags
                                                          .toList()
                                                          ?.contains(
                                                              'Oferta') ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 5),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .tag,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00EEEEEE),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          gridViewProductsRecord
                                                              .title
                                                              .maybeHandleOverflow(
                                                                  maxChars: 15),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
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
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (columnVariantsRecord.tags
                                                          .toList()
                                                          ?.contains(
                                                              'Envio Gratis') ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Row(
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                    child: AuthUserStreamWidget(
                      child: FutureBuilder<List<ProductsRecord>>(
                        future: queryProductsRecordOnce(
                          queryBuilder: (productsRecord) =>
                              productsRecord.where('id',
                                  whereIn: (currentUserDocument?.likedProducts
                                          ?.toList() ??
                                      [])),
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
                              childAspectRatio: 0.6,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewProductsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewProductsRecord =
                                  gridViewProductsRecordList[gridViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 15, 15),
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
                                            color: FlutterFlowTheme.of(context)
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
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color: Color(0x18000000),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 1),
                                        child:
                                            StreamBuilder<List<VariantsRecord>>(
                                          stream: queryVariantsRecord(
                                            parent: gridViewProductsRecord
                                                .reference,
                                            queryBuilder: (variantsRecord) =>
                                                variantsRecord.where('id',
                                                    isEqualTo:
                                                        GetOneVariantCall.id(
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
                                                columnVariantsRecordList =
                                                snapshot.data;
                                            final columnVariantsRecord =
                                                columnVariantsRecordList
                                                        .isNotEmpty
                                                    ? columnVariantsRecordList
                                                        .first
                                                    : null;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
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
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            gridViewProductsRecord
                                                                .brandLogo,
                                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                          ),
                                                        ),
                                                      ),
                                                      ToggleLikeProductWidget(
                                                        productId:
                                                            gridViewProductsRecord
                                                                .id,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'ProductPage',
                                                        params: {
                                                          'productId':
                                                              serializeParam(
                                                                  gridViewProductsRecord
                                                                      .id,
                                                                  ParamType
                                                                      .String),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
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
                                                if (columnVariantsRecord.tags
                                                        .toList()
                                                        ?.contains('Oferta') ??
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 5),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons.tag,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          size: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
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
                                                                  fontSize: 11,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00EEEEEE),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        gridViewProductsRecord
                                                            .title
                                                            .maybeHandleOverflow(
                                                                maxChars: 15),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
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
                                                                  .fromSTEB(2,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            GetOneVariantCall
                                                                .price(
                                                              (containerGetOneVariantResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString(),
                                                            maxLines: 2,
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (columnVariantsRecord.tags
                                                        .toList()
                                                        ?.contains(
                                                            'Envio Gratis') ??
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .shippingFast,
                                                          color:
                                                              Color(0xFF5AE93E),
                                                          size: 11,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Envio Gratis',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF5AE93E),
                                                                  fontSize: 11,
                                                                ),
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
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
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
