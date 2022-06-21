import '../auth/auth_util.dart';
import '../checkout/checkout_widget.dart';
import '../checkout_seller/checkout_seller_widget.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MetodoDePagoWidget extends StatefulWidget {
  const MetodoDePagoWidget({
    Key key,
    this.storeId,
  }) : super(key: key);

  final String storeId;

  @override
  _MetodoDePagoWidgetState createState() => _MetodoDePagoWidgetState();
}

class _MetodoDePagoWidgetState extends State<MetodoDePagoWidget> {
  String radioButtonValue;
  dynamic check;
  dynamic checkoutSession;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 3,
                        indent: 150,
                        endIndent: 150,
                        color: Color(0xFFDBE2E7),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 16, 0),
                              child: Text(
                                'Método de Pago',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF090F13),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                'Selecciona un método de pago',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF57636C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: FlutterFlowRadioButton(
                          options: [
                            'Transferencia Interbancaria',
                            'Tarjeta Crédito / Débito',
                            'Kueski Pay'
                          ].toList(),
                          onChanged: (value) {
                            setState(() => radioButtonValue = value);
                          },
                          optionHeight: 50,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                          textPadding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor: Colors.blue,
                          inactiveRadioButtonColor: Color(0x8A000000),
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() => FFAppState().paymentMethod =
                                    radioButtonValue);
                                if ((widget.storeId) == '\"\"') {
                                  check = await actions.setCheckoutSession(
                                    getJsonField(
                                      FFAppState().checkoutAddress,
                                      r'''$.name''',
                                    ).toString(),
                                    FFAppState().paymentMethod,
                                    FFAppState().checkoutInvoiceProfile,
                                    FFAppState().invoiceUsage,
                                  );
                                  checkoutSession = await actions.getCheckout(
                                    currentUserUid,
                                  );
                                  setState(() => FFAppState().checkoutSession =
                                      checkoutSession);
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: CheckoutWidget(),
                                    ),
                                  );
                                } else {
                                  await actions.setCheckoutSessionSellerWise(
                                    getJsonField(
                                      FFAppState().checkoutAddress,
                                      r'''$.name''',
                                    ).toString(),
                                    FFAppState().paymentMethod,
                                    FFAppState().checkoutInvoiceProfile,
                                    FFAppState().invoiceUsage,
                                    widget.storeId,
                                  );
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: CheckoutSellerWidget(
                                        storeId: widget.storeId,
                                      ),
                                    ),
                                  );
                                }

                                setState(() {});
                              },
                              text: 'Seleccionar',
                              options: FFButtonOptions(
                                width: 250,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
