import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/cart_product_widget.dart';
import '../components/sugerencias_recomendaciones_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CarritoWidget extends StatefulWidget {
  const CarritoWidget({Key key}) : super(key: key);

  @override
  _CarritoWidgetState createState() => _CarritoWidgetState();
}

class _CarritoWidgetState extends State<CarritoWidget> {
  String deleteProductResponse;
  int cartLength;
  dynamic checkoutResponse;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          'Carrito',
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
          future: GetCartTotalCall.call(
            uid: currentUserUid,
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
            final containerGetCartTotalResponse = snapshot.data;
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
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final rowAddtoCartAddressesRecord =
                      rowAddtoCartAddressesRecordList.isNotEmpty
                          ? rowAddtoCartAddressesRecordList.first
                          : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<InvoiceProfilesRecord>
                              buttonInvoiceProfilesRecordList = snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final buttonInvoiceProfilesRecord =
                              buttonInvoiceProfilesRecordList.isNotEmpty
                                  ? buttonInvoiceProfilesRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              if (loggedIn) {
                                checkoutResponse =
                                    await actions.setCheckoutSession(
                                  rowAddtoCartAddressesRecord.name,
                                  'Tarjeta Crédito / Débito',
                                  buttonInvoiceProfilesRecord.id,
                                  'Gastos en General',
                                );
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: SugerenciasRecomendacionesWidget(),
                                    );
                                  },
                                );
                              } else {
                                context.pushNamed('login');
                              }

                              setState(() {});
                            },
                            text: GetCartTotalCall.message(
                              (containerGetCartTotalResponse?.jsonBody ?? ''),
                            ).toString(),
                            options: FFButtonOptions(
                              width: 300,
                              height: 54,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                              borderRadius: 5,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<ApiCallResponse>(
                future: GetCartCall.call(
                  uid: currentUserUid,
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
                  final containerGetCartResponse = snapshot.data;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final productsInCart = getJsonField(
                              (containerGetCartResponse?.jsonBody ?? ''),
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
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.95,
                                            constraints: BoxConstraints(
                                              maxWidth: 400,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3,
                                                  color: Color(0x17000000),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 500,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.95, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          deleteProductResponse =
                                                              await actions
                                                                  .removeProductFromCart(
                                                            currentUserUid,
                                                            getJsonField(
                                                              productsInCartItem,
                                                              r'''$.variantId''',
                                                            ).toString(),
                                                          );
                                                          cartLength = await actions
                                                              .countItemsInCart(
                                                            currentUserUid,
                                                          );

                                                          final usersUpdateData =
                                                              createUsersRecordData(
                                                            itemsInCart:
                                                                cartLength,
                                                          );
                                                          await currentUserReference
                                                              .update(
                                                                  usersUpdateData);

                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          'Eliminar',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFF60A0A),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'ProductPage',
                                                      params: {
                                                        'productId':
                                                            serializeParam(
                                                                getJsonField(
                                                                  productsInCartItem,
                                                                  r'''$.productId''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: CartProductWidget(
                                                    expressAmount: getJsonField(
                                                      productsInCartItem,
                                                      r'''$.expressShipAmount''',
                                                    ),
                                                    normalAmount: getJsonField(
                                                      productsInCartItem,
                                                      r'''$.normalShipAmount''',
                                                    ),
                                                    normalPrice: getJsonField(
                                                      productsInCartItem,
                                                      r'''$.normalPrice''',
                                                    ).toString(),
                                                    productId: getJsonField(
                                                      productsInCartItem,
                                                      r'''$.productId''',
                                                    ).toString(),
                                                    variantId: getJsonField(
                                                      productsInCartItem,
                                                      r'''$.variantId''',
                                                    ).toString(),
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
                            }),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
