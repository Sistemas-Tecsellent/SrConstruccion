import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OfertasWidget extends StatefulWidget {
  const OfertasWidget({Key key}) : super(key: key);

  @override
  _OfertasWidgetState createState() => _OfertasWidgetState();
}

class _OfertasWidgetState extends State<OfertasWidget> {
  PageController pageViewController;
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
          'Ofertas',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
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
                        fillColor: FlutterFlowTheme.of(context).primaryColor,
                        icon: Icon(
                          Icons.home_outlined,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Container(
                                width: double.infinity,
                                height: 250,
                                child: PageView(
                                  controller: pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        'assets/images/Banner_Oferta_1_(4).png',
                                        width: 100,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        'https://image.shutterstock.com/image-vector/summer-ad-sale-banner-popart-260nw-1458893918.jpg',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        'https://static.vecteezy.com/system/resources/previews/002/822/446/non_2x/sale-banner-template-design-big-sale-special-offer-promotion-discount-banner-vector.jpg',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0x00FFFFFF),
                            width: 0,
                          ),
                        ),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('Ofertas');
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.transparent,
                                )
                              ],
                              borderRadius: BorderRadius.circular(500),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 5),
                                  child: Text(
                                    'Categor??as',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0x00FFFFFF),
                              width: 0,
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed('OfertasMarcas');
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color: Colors.transparent,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(500),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 5),
                                    child: Text(
                                      'Marcas',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0x00FFFFFF),
                            width: 0,
                          ),
                        ),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('OfertasTiendas');
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.transparent,
                                )
                              ],
                              borderRadius: BorderRadius.circular(500),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 5),
                                  child: Text(
                                    'Tiendas',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
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
                StreamBuilder<List<CategoriesRecord>>(
                  stream: queryCategoriesRecord(),
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
                    List<CategoriesRecord> columnCategoriesRecordList =
                        snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnCategoriesRecordList.length,
                          (columnIndex) {
                        final columnCategoriesRecord =
                            columnCategoriesRecordList[columnIndex];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25, 0, 0, 0),
                                                  child: Container(
                                                    width: 6,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    columnCategoriesRecord
                                                        .title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 17,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 25, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Ver m??s',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
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
                                    10, 0, 0, 10),
                                child: StreamBuilder<List<ProductsRecord>>(
                                  stream: queryProductsRecord(
                                    queryBuilder: (productsRecord) =>
                                        productsRecord
                                            .where(
                                                'categoryId',
                                                isEqualTo:
                                                    columnCategoriesRecord.id)
                                            .where('isInSale', isEqualTo: true),
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
                                    List<ProductsRecord> rowProductsRecordList =
                                        snapshot.data;
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            rowProductsRecordList.length,
                                            (rowIndex) {
                                          final rowProductsRecord =
                                              rowProductsRecordList[rowIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 5, 5),
                                            child: AuthUserStreamWidget(
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: GetOneVariantCall.call(
                                                  productId:
                                                      rowProductsRecord.id,
                                                  userLocation:
                                                      FFAppState().locationKey,
                                                  userType: valueOrDefault(
                                                      currentUserDocument?.type,
                                                      ''),
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
                                                  final cageGetOneVariantResponse =
                                                      snapshot.data;
                                                  return InkWell(
                                                    onTap: () async {
                                                      if ((rowProductsRecord
                                                              .owner) ==
                                                          'srconstruccion') {
                                                        context.pushNamed(
                                                          'ProductPage',
                                                          params: {
                                                            'productId':
                                                                serializeParam(
                                                                    rowProductsRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          'ProductPageSeller',
                                                          params: {
                                                            'storeName': serializeParam(
                                                                rowProductsRecord
                                                                    .ownerName,
                                                                ParamType
                                                                    .String),
                                                            'productId':
                                                                serializeParam(
                                                                    rowProductsRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                          }.withoutNulls,
                                                          queryParams: {
                                                            'storeId':
                                                                serializeParam(
                                                                    rowProductsRecord
                                                                        .owner,
                                                                    ParamType
                                                                        .String),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 180,
                                                      height: 280,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 10,
                                                            color: Color(
                                                                0x10000000),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  VariantsRecord>>(
                                                            stream:
                                                                queryVariantsRecord(
                                                              parent:
                                                                  rowProductsRecord
                                                                      .reference,
                                                              queryBuilder: (variantsRecord) =>
                                                                  variantsRecord.where(
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
                                                              List<VariantsRecord>
                                                                  columnVariantsRecordList =
                                                                  snapshot.data;
                                                              // Return an empty Container when the document does not exist.
                                                              if (snapshot.data
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
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'MarcaSingle',
                                                                            params:
                                                                                {
                                                                              'brandId': serializeParam(rowProductsRecord.brand, ParamType.String),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              30,
                                                                          height:
                                                                              30,
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
                                                                              rowProductsRecord.brandLogo,
                                                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if ((rowProductsRecord
                                                                              .owner) !=
                                                                          'srconstruccion')
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
                                                                                    fontSize: 11,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'PerfilDelSeller',
                                                                                  params: {
                                                                                    'storeName': serializeParam(rowProductsRecord.ownerName, ParamType.String),
                                                                                  }.withoutNulls,
                                                                                  queryParams: {
                                                                                    'storeId': serializeParam(rowProductsRecord.owner, ParamType.String),
                                                                                    'calledFromPage': serializeParam('List', ParamType.String),
                                                                                    'productId': serializeParam('\"\"', ParamType.String),
                                                                                    'variantId': serializeParam('\"\"', ParamType.String),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                rowProductsRecord.ownerName.maybeHandleOverflow(
                                                                                  maxChars: 15,
                                                                                  replacement: '???',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      fontSize: 11,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        rowProductsRecord
                                                                            .mainImage,
                                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                      ),
                                                                      width:
                                                                          200,
                                                                      height:
                                                                          100,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (columnVariantsRecord
                                                                              .tags
                                                                              .toList()
                                                                              ?.contains('Oferta') ??
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
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.tag,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                size: 9,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                child: Text(
                                                                                  'Oferta',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        fontSize: 9,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (columnVariantsRecord
                                                                              .tags
                                                                              .toList()
                                                                              ?.contains('Envio Gratis') ??
                                                                          true)
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.shippingFast,
                                                                              color: Color(0xFF5AE93E),
                                                                              size: 9,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                              child: Text(
                                                                                'Envio Gratis',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Color(0xFF5AE93E),
                                                                                      fontSize: 9,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            -0.45),
                                                                    child: Text(
                                                                      rowProductsRecord
                                                                          .title
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            40,
                                                                        replacement:
                                                                            '???',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            -0.45),
                                                                    child: Text(
                                                                      rowProductsRecord
                                                                          .sku
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            40,
                                                                        replacement:
                                                                            '???',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0xFF909090),
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            15,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40),
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          columnVariantsRecord
                                                                              .unit,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 9,
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
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1,
                                                                            -0.7),
                                                                        child:
                                                                            Text(
                                                                          '\$',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1,
                                                                            -0.7),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            GetOneVariantCall.price(
                                                                              (cageGetOneVariantResponse?.jsonBody ?? ''),
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  fontSize: 18,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
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
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
