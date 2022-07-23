import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/toggle_like_product_white_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriaSingleMARCAWidget extends StatefulWidget {
  const CategoriaSingleMARCAWidget({
    Key key,
    this.categoryId,
    this.brandId,
  }) : super(key: key);

  final String categoryId;
  final String brandId;

  @override
  _CategoriaSingleMARCAWidgetState createState() =>
      _CategoriaSingleMARCAWidgetState();
}

class _CategoriaSingleMARCAWidgetState
    extends State<CategoriaSingleMARCAWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoriesRecord>>(
      stream: queryCategoriesRecord(
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
        List<CategoriesRecord> categoriaSingleMARCACategoriesRecordList =
            snapshot.data;
        final categoriaSingleMARCACategoriesRecord =
            categoriaSingleMARCACategoriesRecordList.isNotEmpty
                ? categoriaSingleMARCACategoriesRecordList.first
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
                Icons.chevron_left_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                context.pushNamed('MarcaSingle');
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
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: StreamBuilder<List<BrandsRecord>>(
              stream: queryBrandsRecord(
                queryBuilder: (brandsRecord) =>
                    brandsRecord.where('id', isEqualTo: widget.brandId),
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
                List<BrandsRecord> cuerpoBrandsRecordList = snapshot.data;
                final cuerpoBrandsRecord = cuerpoBrandsRecordList.isNotEmpty
                    ? cuerpoBrandsRecordList.first
                    : null;
                return SingleChildScrollView(
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
                                    height: 250,
                                    child: PageView(
                                      controller: pageViewController ??=
                                          PageController(initialPage: 0),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, -1),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              'assets/images/Diseo_sin_ttulo_(16).png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.95,
                                              height: 200,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: StreamBuilder<List<SubcategoriesRecord>>(
                          stream: querySubcategoriesRecord(
                            parent:
                                categoriaSingleMARCACategoriesRecord.reference,
                            queryBuilder: (subcategoriesRecord) =>
                                subcategoriesRecord.where('id',
                                    whereIn: cuerpoBrandsRecord.subcategories
                                        .toList()),
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
                            List<SubcategoriesRecord>
                                rowSubcategoriesRecordList = snapshot.data;
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'subcategoriaSingle',
                                              queryParams: {
                                                'categoryId': serializeParam(
                                                    widget.categoryId,
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
                                                    rowSubcategoriesRecord
                                                        .image,
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
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Container(
                                            width: 6,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                      'ProductListingSrConstruccion');
                                },
                                child: Text(
                                  'Ver más',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                              .where('isInSale', isEqualTo: true)
                              .where('brand', isEqualTo: widget.brandId),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                                  rowProductsRecordList.length, (rowIndex) {
                                final rowProductsRecord =
                                    rowProductsRecordList[rowIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        final stackGetOneVariantResponse =
                                            snapshot.data;
                                        return InkWell(
                                          onTap: () async {
                                            if ((rowProductsRecord.owner) ==
                                                'srconstruccion') {
                                              context.pushNamed(
                                                'ProductPage',
                                                params: {
                                                  'productId': serializeParam(
                                                      rowProductsRecord.id,
                                                      ParamType.String),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              context.pushNamed(
                                                'ProductPageSeller',
                                                params: {
                                                  'storeName': serializeParam(
                                                      rowProductsRecord
                                                          .ownerName,
                                                      ParamType.String),
                                                  'productId': serializeParam(
                                                      rowProductsRecord.id,
                                                      ParamType.String),
                                                }.withoutNulls,
                                                queryParams: {
                                                  'storeId': serializeParam(
                                                      rowProductsRecord.owner,
                                                      ParamType.String),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 190,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  -0.35, -1),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 20, 0, 0),
                                                    child: StreamBuilder<
                                                        List<VariantsRecord>>(
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
                                                                  (stackGetOneVariantResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ).toString()),
                                                        singleRecord: true,
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
                                                        List<VariantsRecord>
                                                            containerVariantsRecordList =
                                                            snapshot.data;
                                                        final containerVariantsRecord =
                                                            containerVariantsRecordList
                                                                    .isNotEmpty
                                                                ? containerVariantsRecordList
                                                                    .first
                                                                : null;
                                                        return Container(
                                                          width: 170,
                                                          height: 255,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, -1),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1,
                                                                            -1),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            rowProductsRecord.title.maybeHandleOverflow(
                                                                              maxChars: 40,
                                                                              replacement: '…',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.white,
                                                                                  fontSize: 13,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 35,
                                                                              height: 35,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFEEEEEE),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    'MarcaSingle',
                                                                                    params: {
                                                                                      'brandId': serializeParam(rowProductsRecord.brand, ParamType.String),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  width: 120,
                                                                                  height: 120,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    rowProductsRecord.brandLogo,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1, 0),
                                                                            child:
                                                                                Container(
                                                                              width: 120,
                                                                              height: 40,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(10),
                                                                                  bottomRight: Radius.circular(0),
                                                                                  topLeft: Radius.circular(10),
                                                                                  topRight: Radius.circular(0),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1, 0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                                                                                        child: Text(
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
                                                                                      alignment: AlignmentDirectional(1, 0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                        child: Text(
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
                                                                        ],
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
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.65, 0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      rowProductsRecord
                                                          .saleImage,
                                                      'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FDise%C3%B1o%20sin%20t%C3%ADtulo%20(1).png?alt=media&token=96c985a1-8023-4ffe-b992-4d534a2e3767',
                                                    ),
                                                    width: 150,
                                                    height: 170,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ],
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Container(
                                            width: 6,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                      'ProductListingSrConstruccion');
                                },
                                child: Text(
                                  'Ver más',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                .where('categoryId',
                                    isEqualTo: widget.categoryId)
                                .where('brand', isEqualTo: widget.brandId)
                                .orderBy('sales', descending: true),
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
                                    rowProductsRecordList.length, (rowIndex) {
                                  final rowProductsRecord =
                                      rowProductsRecordList[rowIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 5, 5),
                                    child: AuthUserStreamWidget(
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: GetOneVariantCall.call(
                                          productId: rowProductsRecord.id,
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
                                          final cageGetOneVariantResponse =
                                              snapshot.data;
                                          return InkWell(
                                            onTap: () async {
                                              if ((rowProductsRecord.owner) ==
                                                  'srconstruccion') {
                                                context.pushNamed(
                                                  'ProductPage',
                                                  params: {
                                                    'productId': serializeParam(
                                                        rowProductsRecord.id,
                                                        ParamType.String),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'ProductPageSeller',
                                                  params: {
                                                    'storeName': serializeParam(
                                                        rowProductsRecord
                                                            .ownerName,
                                                        ParamType.String),
                                                    'productId': serializeParam(
                                                        rowProductsRecord.id,
                                                        ParamType.String),
                                                  }.withoutNulls,
                                                  queryParams: {
                                                    'storeId': serializeParam(
                                                        rowProductsRecord.owner,
                                                        ParamType.String),
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
                                                    color: Color(0x10000000),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 10, 0),
                                                  child: StreamBuilder<
                                                      List<VariantsRecord>>(
                                                    stream: queryVariantsRecord(
                                                      parent: rowProductsRecord
                                                          .reference,
                                                      queryBuilder: (variantsRecord) =>
                                                          variantsRecord.where(
                                                              'id',
                                                              isEqualTo:
                                                                  GetOneVariantCall
                                                                      .id(
                                                                (cageGetOneVariantResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString()),
                                                      singleRecord: true,
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
                                                      List<VariantsRecord>
                                                          columnVariantsRecordList =
                                                          snapshot.data;
                                                      // Return an empty Container when the document does not exist.
                                                      if (snapshot
                                                          .data.isEmpty) {
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
                                                                    params: {
                                                                      'brandId': serializeParam(
                                                                          rowProductsRecord
                                                                              .brand,
                                                                          ParamType
                                                                              .String),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 30,
                                                                  height: 30,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    rowProductsRecord
                                                                        .brandLogo,
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((rowProductsRecord
                                                                      .owner) !=
                                                                  'srconstruccion')
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
                                                                            color:
                                                                                Colors.black,
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
                                                                          params:
                                                                              {
                                                                            'storeName':
                                                                                serializeParam(rowProductsRecord.ownerName, ParamType.String),
                                                                          }.withoutNulls,
                                                                          queryParams:
                                                                              {
                                                                            'storeId':
                                                                                serializeParam(rowProductsRecord.owner, ParamType.String),
                                                                            'calledFromPage':
                                                                                serializeParam('List', ParamType.String),
                                                                            'productId':
                                                                                serializeParam('\"\"', ParamType.String),
                                                                            'variantId':
                                                                                serializeParam('\"\"', ParamType.String),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        rowProductsRecord
                                                                            .ownerName
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              15,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                    .circular(
                                                                        5),
                                                            child:
                                                                Image.network(
                                                              rowProductsRecord
                                                                  .mainImage,
                                                              width: 200,
                                                              height: 100,
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
                                                                      ?.contains(
                                                                          'Oferta') ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .tag,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size: 9,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'Oferta',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              2,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Envio Gratis',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                    -1, -0.45),
                                                            child: Text(
                                                              rowProductsRecord
                                                                  .title
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, -0.45),
                                                            child: Text(
                                                              rowProductsRecord
                                                                  .sku
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 50,
                                                                  height: 15,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFEEEEEE),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              9,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '\$',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1,
                                                                        -0.7),
                                                                child: Text(
                                                                  getJsonField(
                                                                    (cageGetOneVariantResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Container(
                                            width: 6,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                      'ProductListingSrConstruccion');
                                },
                                child: Text(
                                  'Ver más',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                .where('categoryId',
                                    isEqualTo: widget.categoryId)
                                .where('brand', isEqualTo: widget.brandId)
                                .orderBy('likes', descending: true),
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
                                    rowProductsRecordList.length, (rowIndex) {
                                  final rowProductsRecord =
                                      rowProductsRecordList[rowIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 5, 5),
                                    child: AuthUserStreamWidget(
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: GetOneVariantCall.call(
                                          productId: rowProductsRecord.id,
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
                                          final cageGetOneVariantResponse =
                                              snapshot.data;
                                          return InkWell(
                                            onTap: () async {
                                              if ((rowProductsRecord.owner) ==
                                                  'srconstruccion') {
                                                context.pushNamed(
                                                  'ProductPage',
                                                  params: {
                                                    'productId': serializeParam(
                                                        rowProductsRecord.id,
                                                        ParamType.String),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'ProductPageSeller',
                                                  params: {
                                                    'storeName': serializeParam(
                                                        rowProductsRecord
                                                            .ownerName,
                                                        ParamType.String),
                                                    'productId': serializeParam(
                                                        rowProductsRecord.id,
                                                        ParamType.String),
                                                  }.withoutNulls,
                                                  queryParams: {
                                                    'storeId': serializeParam(
                                                        rowProductsRecord.owner,
                                                        ParamType.String),
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
                                                    color: Color(0x10000000),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 10, 0),
                                                  child: StreamBuilder<
                                                      List<VariantsRecord>>(
                                                    stream: queryVariantsRecord(
                                                      parent: rowProductsRecord
                                                          .reference,
                                                      queryBuilder: (variantsRecord) =>
                                                          variantsRecord.where(
                                                              'id',
                                                              isEqualTo:
                                                                  GetOneVariantCall
                                                                      .id(
                                                                (cageGetOneVariantResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString()),
                                                      singleRecord: true,
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
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                    params: {
                                                                      'brandId': serializeParam(
                                                                          rowProductsRecord
                                                                              .brand,
                                                                          ParamType
                                                                              .String),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 30,
                                                                  height: 30,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    rowProductsRecord
                                                                        .brandLogo,
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((rowProductsRecord
                                                                      .owner) !=
                                                                  'srconstruccion')
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
                                                                            color:
                                                                                Colors.black,
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
                                                                          params:
                                                                              {
                                                                            'storeName':
                                                                                serializeParam(rowProductsRecord.ownerName, ParamType.String),
                                                                          }.withoutNulls,
                                                                          queryParams:
                                                                              {
                                                                            'storeId':
                                                                                serializeParam(rowProductsRecord.owner, ParamType.String),
                                                                            'calledFromPage':
                                                                                serializeParam('List', ParamType.String),
                                                                            'productId':
                                                                                serializeParam('\"\"', ParamType.String),
                                                                            'variantId':
                                                                                serializeParam('\"\"', ParamType.String),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        rowProductsRecord
                                                                            .ownerName
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              15,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                    .circular(
                                                                        5),
                                                            child:
                                                                Image.network(
                                                              rowProductsRecord
                                                                  .mainImage,
                                                              width: 200,
                                                              height: 100,
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
                                                                      ?.contains(
                                                                          'Oferta') ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .tag,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size: 9,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'Oferta',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              2,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Envio Gratis',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                    -1, -0.45),
                                                            child: Text(
                                                              rowProductsRecord
                                                                  .title
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, -0.45),
                                                            child: Text(
                                                              rowProductsRecord
                                                                  .sku
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 50,
                                                                  height: 15,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFEEEEEE),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              9,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '\$',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1,
                                                                        -0.7),
                                                                child: Text(
                                                                  getJsonField(
                                                                    (cageGetOneVariantResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Container(
                                            width: 6,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                      'ProductListingSrConstruccion');
                                },
                                child: Text(
                                  'Ver más',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                .where('categoryId',
                                    isEqualTo: widget.categoryId)
                                .where('brand', isEqualTo: widget.brandId),
                            limit: 40,
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
                                    rowProductsRecordList.length, (rowIndex) {
                                  final rowProductsRecord =
                                      rowProductsRecordList[rowIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 5, 5),
                                    child: AuthUserStreamWidget(
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: GetOneVariantCall.call(
                                          productId: rowProductsRecord.id,
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
                                          final cageGetOneVariantResponse =
                                              snapshot.data;
                                          return InkWell(
                                            onTap: () async {
                                              if ((rowProductsRecord.owner) ==
                                                  'srconstruccion') {
                                                context.pushNamed(
                                                  'ProductPage',
                                                  params: {
                                                    'productId': serializeParam(
                                                        rowProductsRecord.id,
                                                        ParamType.String),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'ProductPageSeller',
                                                  params: {
                                                    'storeName': serializeParam(
                                                        rowProductsRecord
                                                            .ownerName,
                                                        ParamType.String),
                                                    'productId': serializeParam(
                                                        rowProductsRecord.id,
                                                        ParamType.String),
                                                  }.withoutNulls,
                                                  queryParams: {
                                                    'storeId': serializeParam(
                                                        rowProductsRecord.owner,
                                                        ParamType.String),
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
                                                    color: Color(0x10000000),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 10, 0),
                                                  child: StreamBuilder<
                                                      List<VariantsRecord>>(
                                                    stream: queryVariantsRecord(
                                                      parent: rowProductsRecord
                                                          .reference,
                                                      queryBuilder: (variantsRecord) =>
                                                          variantsRecord.where(
                                                              'id',
                                                              isEqualTo:
                                                                  GetOneVariantCall
                                                                      .id(
                                                                (cageGetOneVariantResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString()),
                                                      singleRecord: true,
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
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                    params: {
                                                                      'brandId': serializeParam(
                                                                          rowProductsRecord
                                                                              .brand,
                                                                          ParamType
                                                                              .String),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 30,
                                                                  height: 30,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    rowProductsRecord
                                                                        .brandLogo,
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((rowProductsRecord
                                                                      .owner) !=
                                                                  'srconstruccion')
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
                                                                            color:
                                                                                Colors.black,
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
                                                                          params:
                                                                              {
                                                                            'storeName':
                                                                                serializeParam(rowProductsRecord.ownerName, ParamType.String),
                                                                          }.withoutNulls,
                                                                          queryParams:
                                                                              {
                                                                            'storeId':
                                                                                serializeParam(rowProductsRecord.owner, ParamType.String),
                                                                            'calledFromPage':
                                                                                serializeParam('List', ParamType.String),
                                                                            'productId':
                                                                                serializeParam('\"\"', ParamType.String),
                                                                            'variantId':
                                                                                serializeParam('\"\"', ParamType.String),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        rowProductsRecord
                                                                            .ownerName
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              15,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                    .circular(
                                                                        5),
                                                            child:
                                                                Image.network(
                                                              rowProductsRecord
                                                                  .mainImage,
                                                              width: 200,
                                                              height: 100,
                                                              fit: BoxFit.cover,
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
                                                                      ?.contains(
                                                                          'Oferta') ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .tag,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size: 9,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'Oferta',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              2,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Envio Gratis',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                    -1, -0.45),
                                                            child: Text(
                                                              rowProductsRecord
                                                                  .title
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, -0.45),
                                                            child: Text(
                                                              rowProductsRecord
                                                                  .sku
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 50,
                                                                  height: 15,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFEEEEEE),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              9,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '\$',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1,
                                                                        -0.7),
                                                                child: Text(
                                                                  getJsonField(
                                                                    (cageGetOneVariantResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
              },
            ),
          ),
        );
      },
    );
  }
}
