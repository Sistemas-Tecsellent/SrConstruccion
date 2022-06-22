import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/envio_gratis_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../product_page/product_page_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductFeedHomeWidget extends StatefulWidget {
  const ProductFeedHomeWidget({Key key}) : super(key: key);

  @override
  _ProductFeedHomeWidgetState createState() => _ProductFeedHomeWidgetState();
}

class _ProductFeedHomeWidgetState extends State<ProductFeedHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductsRecord>>(
      future: queryProductsRecordOnce(
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
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<ProductsRecord> gridViewProductsRecordList = snapshot.data;
        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.58,
          ),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: gridViewProductsRecordList.length,
          itemBuilder: (context, gridViewIndex) {
            final gridViewProductsRecord =
                gridViewProductsRecordList[gridViewIndex];
            return AuthUserStreamWidget(
              child: FutureBuilder<ApiCallResponse>(
                future: GetOneVariantCall.call(
                  productId: gridViewProductsRecord.id,
                  userLocation: FFAppState().locationKey,
                  userType: valueOrDefault(currentUserDocument?.type, ''),
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
                  final stackGetOneVariantResponse = snapshot.data;
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                        child: StreamBuilder<List<VariantsRecord>>(
                          stream: queryVariantsRecord(
                            parent: gridViewProductsRecord.reference,
                            queryBuilder: (variantsRecord) =>
                                variantsRecord.where('id',
                                    isEqualTo: GetOneVariantCall.id(
                                      (stackGetOneVariantResponse?.jsonBody ??
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<VariantsRecord> cageVariantsRecordList =
                                snapshot.data;
                            final cageVariantsRecord =
                                cageVariantsRecordList.isNotEmpty
                                    ? cageVariantsRecordList.first
                                    : null;
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x17000000),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 195, 10, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (cageVariantsRecord.tags
                                              .toList()
                                              ?.contains('Oferta') ??
                                          true)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.tag,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 13,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                'Oferta',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                            AlignmentDirectional(-1, -0.45),
                                        child: Text(
                                          gridViewProductsRecord.title
                                              .maybeHandleOverflow(
                                            maxChars: 30,
                                            replacement: '…',
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '\$',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF1EEBBD),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, -0.7),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                GetOneVariantCall.price(
                                                  (stackGetOneVariantResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF1EEBBD),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (cageVariantsRecord.tags
                                              .toList()
                                              ?.contains('Envio Gratis') ??
                                          true)
                                        EnvioGratisWidget(),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.2, -0.5),
                        child: InkWell(
                          onTap: () async {
                            setState(() => FFAppState().currentVariant =
                                    GetOneVariantCall.id(
                                  (stackGetOneVariantResponse?.jsonBody ?? ''),
                                ).toString());
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                                reverseDuration: Duration(milliseconds: 0),
                                child: ProductPageWidget(
                                  productId: gridViewProductsRecord.id,
                                ),
                              ),
                            );
                            await actions.productViewed(
                              gridViewProductsRecord.id,
                            );

                            final usersUpdateData = {
                              'recentlyViewed': FieldValue.arrayUnion(
                                  [gridViewProductsRecord.id]),
                            };
                            await currentUserReference.update(usersUpdateData);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              valueOrDefault<String>(
                                gridViewProductsRecord.mainImage,
                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                              ),
                              width: 150,
                              height: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.8, -0.93),
                        child: Container(
                          width: 30,
                          height: 30,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              gridViewProductsRecord.brandLogo,
                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
