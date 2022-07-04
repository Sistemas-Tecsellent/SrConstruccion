import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedProductosCategoriaWidget extends StatefulWidget {
  const FeedProductosCategoriaWidget({
    Key key,
    this.categoryId,
  }) : super(key: key);

  final String categoryId;

  @override
  _FeedProductosCategoriaWidgetState createState() =>
      _FeedProductosCategoriaWidgetState();
}

class _FeedProductosCategoriaWidgetState
    extends State<FeedProductosCategoriaWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: FutureBuilder<List<ProductsRecord>>(
            future: queryProductsRecordOnce(
              queryBuilder: (productsRecord) => productsRecord
                  .where('categoryId', isEqualTo: widget.categoryId),
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
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: gridViewProductsRecordList.length,
                itemBuilder: (context, gridViewIndex) {
                  final gridViewProductsRecord =
                      gridViewProductsRecordList[gridViewIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
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
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 185, 10, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.tag,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 13,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: Text(
                                            'Oferta',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
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
                                          AlignmentDirectional(-1, -0.45),
                                      child: Text(
                                        gridViewProductsRecord.title
                                            .maybeHandleOverflow(
                                          maxChars: 23,
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
                                    Align(
                                      alignment: AlignmentDirectional(-1, -0.7),
                                      child: Text(
                                        '\$000,000.00',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.shippingFast,
                                          color: Color(0xFF5AE93E),
                                          size: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: Text(
                                            'Envio Gratis',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF5AE93E),
                                                  fontSize: 11,
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.6),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'ProductPage',
                                params: {
                                  'productId': serializeParam(
                                      gridViewProductsRecord.id,
                                      ParamType.String),
                                }.withoutNulls,
                              );
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
                          alignment: AlignmentDirectional(-0.9, -0.98),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
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
                                  'https://cdn.shopify.com/s/files/1/0590/5045/9343/files/MARCA.png?v=1655401403',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
