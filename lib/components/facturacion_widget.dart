import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/seleccionar_facturacion_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FacturacionWidget extends StatefulWidget {
  const FacturacionWidget({
    Key key,
    this.storeId,
  }) : super(key: key);

  final String storeId;

  @override
  _FacturacionWidgetState createState() => _FacturacionWidgetState();
}

class _FacturacionWidgetState extends State<FacturacionWidget> {
  String radioButtonValue;
  dynamic newInvoiceProfile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(
          maxWidth: 500,
        ),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Container(
                                width: 100,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                            ),
                        ],
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
                                'Facturación',
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
                                'Selecciona los datos de facturación de esta compra',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF57636C),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: StreamBuilder<List<InvoiceProfilesRecord>>(
                                stream: queryInvoiceProfilesRecord(
                                  parent: currentUserReference,
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
                                  List<InvoiceProfilesRecord>
                                      radioButtonInvoiceProfilesRecordList =
                                      snapshot.data;
                                  return FlutterFlowRadioButton(
                                    options:
                                        radioButtonInvoiceProfilesRecordList
                                            .map((e) => e.name)
                                            .toList()
                                            .toList(),
                                    onChanged: (value) {
                                      setState(() => radioButtonValue = value);
                                    },
                                    optionHeight: 50,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                        ),
                                    selectedTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.vertical,
                                    radioButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryColor,
                                    inactiveRadioButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryColor,
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.start,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                if ((radioButtonValue) == 'Sin factura') {
                                  newInvoiceProfile =
                                      await actions.getInvoiceProfileById(
                                    'JHGjhghjGJHGJGHJVHjn',
                                  );
                                  if ((widget.storeId) == '\"\"') {
                                    await actions
                                        .setCheckoutModifyInvoiceAndUsage(
                                      currentUserUid,
                                      getJsonField(
                                        newInvoiceProfile,
                                        r'''$.id''',
                                      ).toString(),
                                      'Por Definir',
                                    );
                                    Navigator.pop(context);
                                  } else {
                                    await actions
                                        .setCheckoutModifyInvoiceAndUsage(
                                      widget.storeId,
                                      getJsonField(
                                        newInvoiceProfile,
                                        r'''$.id''',
                                      ).toString(),
                                      'Por Definir',
                                    );
                                    Navigator.pop(context);
                                  }
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: SeleccionarFacturacionWidget(
                                          invoiceProfileName: radioButtonValue,
                                          storeId: widget.storeId,
                                        ),
                                      );
                                    },
                                  );
                                }

                                setState(() {});
                              },
                              text: 'Confirmar Datos',
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
                                borderRadius: BorderRadius.circular(5),
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
        ),
      ),
    );
  }
}
