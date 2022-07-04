import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/toggle_like_product_white_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriaSingleWidget extends StatefulWidget {
  const CategoriaSingleWidget({
    Key key,
    this.categoryId,
  }) : super(key: key);

  final String categoryId;

  @override
  _CategoriaSingleWidgetState createState() => _CategoriaSingleWidgetState();
}

class _CategoriaSingleWidgetState extends State<CategoriaSingleWidget> {
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
            Icons.chevron_left_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('HomeAlt');
          },
        ),
        title: FutureBuilder<List<CategoriesRecord>>(
          future: queryCategoriesRecordOnce(
            queryBuilder: (categoriesRecord) =>
                categoriesRecord.where('id', isEqualTo: widget.categoryId),
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
            List<CategoriesRecord> textCategoriesRecordList = snapshot.data;
            final textCategoriesRecord = textCategoriesRecordList.isNotEmpty
                ? textCategoriesRecordList.first
                : null;
            return Text(
              textCategoriesRecord.title,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    fontSize: 18,
                  ),
            );
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
              color: Colors.black,
              size: 15,
            ),
            onPressed: () async {
              context.pushNamed('search');
            },
          ),
        ],
        centerTitle: true,
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
      body: GestureDetector(
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
                          child: Container(
                            height: 120,
                            child: PageView(
                              controller: pageViewController ??=
                                  PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/Diseo_sin_ttulo_(16).png',
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, -1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://img.freepik.com/foto-gratis/banner-tienda-pintura-composicion-pinceles-carta-colores-contenedores-pintura_162490-10.jpg',
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<CategoriesRecord>>(
                stream: queryCategoriesRecord(
                  queryBuilder: (categoriesRecord) => categoriesRecord
                      .where('id', isEqualTo: widget.categoryId),
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
                  List<CategoriesRecord> containerCategoriesRecordList =
                      snapshot.data;
                  final containerCategoriesRecord =
                      containerCategoriesRecordList.isNotEmpty
                          ? containerCategoriesRecordList.first
                          : null;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: StreamBuilder<List<SubcategoriesRecord>>(
                        stream: querySubcategoriesRecord(
                          parent: containerCategoriesRecord.reference,
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
                          List<SubcategoriesRecord> rowSubcategoriesRecordList =
                              snapshot.data;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                  rowSubcategoriesRecordList.length,
                                  (rowIndex) {
                                final rowSubcategoriesRecord =
                                    rowSubcategoriesRecordList[rowIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          context.pushNamed(
                                            'subcategoriaSingle',
                                            queryParams: {
                                              'categoryId': serializeParam(
                                                  containerCategoriesRecord.id,
                                                  ParamType.String),
                                              'subcategoryId': serializeParam(
                                                  rowSubcategoriesRecord.id,
                                                  ParamType.String),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 85,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                valueOrDefault<String>(
                                                  rowSubcategoriesRecord.image,
                                                  'https://images.pexels.com/photos/3930091/pexels-photo-3930091.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                ),
                                              ).image,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10,
                                                color: Color(0x12000000),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0, 0.9),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 5),
                                            child: Text(
                                              rowSubcategoriesRecord.id,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25, 0, 0, 0),
                                  child: Container(
                                    width: 6,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Ofertas',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed('ProductListingSrConstruccion');
                        },
                        child: Text(
                          'Ver más',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<ProductsRecord>>(
                stream: queryProductsRecord(
                  queryBuilder: (productsRecord) => productsRecord
                      .where('categoryId', isEqualTo: widget.categoryId)
                      .where('isInSale', isEqualTo: true),
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<ProductsRecord> rowProductsRecordList = snapshot.data;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(rowProductsRecordList.length,
                          (rowIndex) {
                        final rowProductsRecord =
                            rowProductsRecordList[rowIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: AuthUserStreamWidget(
                            child: FutureBuilder<ApiCallResponse>(
                              future: GetOneVariantCall.call(
                                productId: rowProductsRecord.id,
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
                                final stackGetOneVariantResponse =
                                    snapshot.data;
                                return Container(
                                  width: 190,
                                  child: Stack(
                                    alignment: AlignmentDirectional(-0.35, -1),
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: StreamBuilder<
                                              List<VariantsRecord>>(
                                            stream: queryVariantsRecord(
                                              parent:
                                                  rowProductsRecord.reference,
                                              queryBuilder: (variantsRecord) =>
                                                  variantsRecord.where('id',
                                                      isEqualTo:
                                                          GetOneVariantCall.id(
                                                        (stackGetOneVariantResponse
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
                                                  containerVariantsRecordList =
                                                  snapshot.data;
                                              final containerVariantsRecord =
                                                  containerVariantsRecordList
                                                          .isNotEmpty
                                                      ? containerVariantsRecordList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                onTap: () async {
                                                  await actions.productViewed(
                                                    rowProductsRecord.id,
                                                  );

                                                  final usersUpdateData = {
                                                    'recentlyViewed':
                                                        FieldValue.arrayUnion([
                                                      rowProductsRecord.id
                                                    ]),
                                                  };
                                                  await currentUserReference
                                                      .update(usersUpdateData);
                                                  context.pushNamed(
                                                    'ProductPage',
                                                    params: {
                                                      'productId':
                                                          serializeParam(
                                                              rowProductsRecord
                                                                  .id,
                                                              ParamType.String),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: 170,
                                                  height: 255,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, -1),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child:
                                                            ToggleLikeProductWhiteWidget(
                                                          productId:
                                                              rowProductsRecord
                                                                  .id,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 20),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1, -1),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child: Text(
                                                                    rowProductsRecord
                                                                        .title
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          22,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 150,
                                                                  height: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1,
                                                                              0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              '\$',
                                                                              textAlign: TextAlign.end,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Colors.white,
                                                                                    fontSize: 18,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1,
                                                                              0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              GetOneVariantCall.price(
                                                                                (stackGetOneVariantResponse?.jsonBody ?? ''),
                                                                              ).toString(),
                                                                              textAlign: TextAlign.end,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Colors.white,
                                                                                    fontSize: 18,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
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
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            rowProductsRecord.saleImage,
                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FDise%C3%B1o%20sin%20t%C3%ADtulo%20(1).png?alt=media&token=96c985a1-8023-4ffe-b992-4d534a2e3767',
                                          ),
                                          width: 150,
                                          height: 170,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25, 0, 0, 0),
                                  child: Container(
                                    width: 6,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Marcas Oficiales',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('ListadoMarcas');
                          },
                          child: Text(
                            'Ver más',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                child: StreamBuilder<List<BrandsRecord>>(
                  stream: queryBrandsRecord(
                    queryBuilder: (brandsRecord) => brandsRecord
                        .where('categories', arrayContains: widget.categoryId),
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<BrandsRecord> feature4BrandsRecordList = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(feature4BrandsRecordList.length,
                            (feature4Index) {
                          final feature4BrandsRecord =
                              feature4BrandsRecordList[feature4Index];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                context.pushNamed('MarcaSingle');
                              },
                              child: Container(
                                width: 90,
                                height: 90,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    feature4BrandsRecord.logo,
                                    'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                  ),
                                  fit: BoxFit.contain,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25, 0, 0, 0),
                                  child: Container(
                                    width: 6,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Más Vendidos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed('ProductListingSrConstruccion');
                        },
                        child: Text(
                          'Ver más',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    queryBuilder: (productsRecord) => productsRecord
                        .where('categoryId', isEqualTo: widget.categoryId)
                        .orderBy('sales', descending: true),
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<ProductsRecord> rowProductsRecordList = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(rowProductsRecordList.length,
                            (rowIndex) {
                          final rowProductsRecord =
                              rowProductsRecordList[rowIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: AuthUserStreamWidget(
                              child: FutureBuilder<ApiCallResponse>(
                                future: GetOneVariantCall.call(
                                  productId: rowProductsRecord.id,
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
                                  final cageGetOneVariantResponse =
                                      snapshot.data;
                                  return Container(
                                    width: 150,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Color(0x10000000),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child:
                                            StreamBuilder<List<VariantsRecord>>(
                                          stream: queryVariantsRecord(
                                            parent: rowProductsRecord.reference,
                                            queryBuilder: (variantsRecord) =>
                                                variantsRecord.where('id',
                                                    isEqualTo:
                                                        GetOneVariantCall.id(
                                                      (cageGetOneVariantResponse
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
                                            return InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'ProductPage',
                                                  params: {
                                                    'productId': serializeParam(
                                                        rowProductsRecord.id,
                                                        ParamType.String),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
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
                                                            rowProductsRecord
                                                                .brandLogo,
                                                            'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        rowProductsRecord
                                                            .mainImage,
                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                      ),
                                                      width: 200,
                                                      height: 100,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  if (columnVariantsRecord.tags
                                                          .toList()
                                                          ?.contains(
                                                              'Oferta') ??
                                                      true)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons.tag,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          size: 13,
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
                                                                  fontSize: 13,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1, -0.45),
                                                    child: Text(
                                                      rowProductsRecord.title
                                                          .maybeHandleOverflow(
                                                        maxChars: 23,
                                                        replacement: '…',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '\$',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF1EEBBD),
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, -0.7),
                                                        child: Text(
                                                          getJsonField(
                                                            (cageGetOneVariantResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.price''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF1EEBBD),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (columnVariantsRecord.tags
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
                                                ],
                                              ),
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
                        }),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25, 0, 0, 0),
                                  child: Container(
                                    width: 6,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Mejor valorados',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed('ProductListingSrConstruccion');
                        },
                        child: Text(
                          'Ver más',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    queryBuilder: (productsRecord) => productsRecord
                        .where('categoryId', isEqualTo: widget.categoryId)
                        .orderBy('likes', descending: true),
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<ProductsRecord> rowProductsRecordList = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(rowProductsRecordList.length,
                            (rowIndex) {
                          final rowProductsRecord =
                              rowProductsRecordList[rowIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: AuthUserStreamWidget(
                              child: FutureBuilder<ApiCallResponse>(
                                future: GetOneVariantCall.call(
                                  productId: rowProductsRecord.id,
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
                                  final cageGetOneVariantResponse =
                                      snapshot.data;
                                  return Container(
                                    width: 150,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Color(0x10000000),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child:
                                            StreamBuilder<List<VariantsRecord>>(
                                          stream: queryVariantsRecord(
                                            parent: rowProductsRecord.reference,
                                            queryBuilder: (variantsRecord) =>
                                                variantsRecord.where('id',
                                                    isEqualTo:
                                                        GetOneVariantCall.id(
                                                      (cageGetOneVariantResponse
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width: 30,
                                                      height: 30,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          rowProductsRecord
                                                              .brandLogo,
                                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () async {
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
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        rowProductsRecord
                                                            .mainImage,
                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                      ),
                                                      width: 200,
                                                      height: 100,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                if (columnVariantsRecord.tags
                                                        .toList()
                                                        ?.contains('Oferta') ??
                                                    true)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons.tag,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 13,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
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
                                                                fontSize: 13,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, -0.45),
                                                  child: Text(
                                                    rowProductsRecord.title
                                                        .maybeHandleOverflow(
                                                      maxChars: 23,
                                                      replacement: '…',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '\$',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF1EEBBD),
                                                              ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, -0.7),
                                                      child: Text(
                                                        getJsonField(
                                                          (cageGetOneVariantResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.price''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF1EEBBD),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (columnVariantsRecord.tags
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
                                                        color:
                                                            Color(0xFF5AE93E),
                                                        size: 11,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
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
                        }),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25, 0, 0, 0),
                                  child: Container(
                                    width: 6,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Más productos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed('ProductListingSrConstruccion');
                        },
                        child: Text(
                          'Ver más',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 80),
                child: StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    queryBuilder: (productsRecord) => productsRecord
                        .where('categoryId', isEqualTo: widget.categoryId),
                    limit: 6,
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
                    List<ProductsRecord> rowProductsRecordList = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(rowProductsRecordList.length,
                            (rowIndex) {
                          final rowProductsRecord =
                              rowProductsRecordList[rowIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: AuthUserStreamWidget(
                              child: FutureBuilder<ApiCallResponse>(
                                future: GetOneVariantCall.call(
                                  productId: rowProductsRecord.id,
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
                                  final cageGetOneVariantResponse =
                                      snapshot.data;
                                  return Container(
                                    width: 150,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Color(0x10000000),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child:
                                            StreamBuilder<List<VariantsRecord>>(
                                          stream: queryVariantsRecord(
                                            parent: rowProductsRecord.reference,
                                            queryBuilder: (variantsRecord) =>
                                                variantsRecord.where('id',
                                                    isEqualTo:
                                                        GetOneVariantCall.id(
                                                      (cageGetOneVariantResponse
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width: 30,
                                                      height: 30,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          rowProductsRecord
                                                              .brandLogo,
                                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () async {
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
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        rowProductsRecord
                                                            .mainImage,
                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                      ),
                                                      width: 200,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                if (columnVariantsRecord.tags
                                                        .toList()
                                                        ?.contains('Oferta') ??
                                                    true)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons.tag,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 13,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
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
                                                                fontSize: 13,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, -0.45),
                                                  child: Text(
                                                    rowProductsRecord.title
                                                        .maybeHandleOverflow(
                                                      maxChars: 23,
                                                      replacement: '…',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '\$',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF1EEBBD),
                                                              ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, -0.7),
                                                      child: Text(
                                                        getJsonField(
                                                          (cageGetOneVariantResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.price''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF1EEBBD),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (columnVariantsRecord.tags
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
                                                        color:
                                                            Color(0xFF5AE93E),
                                                        size: 11,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
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
    );
  }
}
