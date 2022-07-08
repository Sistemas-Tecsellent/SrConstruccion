import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CotizacionesDeEnvioWidget extends StatefulWidget {
  const CotizacionesDeEnvioWidget({Key key}) : super(key: key);

  @override
  _CotizacionesDeEnvioWidgetState createState() =>
      _CotizacionesDeEnvioWidgetState();
}

class _CotizacionesDeEnvioWidgetState extends State<CotizacionesDeEnvioWidget> {
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
            Icons.keyboard_arrow_left_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Cotizaciones de Envío',
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    constraints: BoxConstraints(
                      maxWidth: 500,
                    ),
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<PricingRequestsRecord>>(
                      stream: queryPricingRequestsRecord(
                        queryBuilder: (pricingRequestsRecord) =>
                            pricingRequestsRecord
                                .where('owner', isEqualTo: currentUserUid)
                                .where('active', isEqualTo: true),
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
                        List<PricingRequestsRecord>
                            listViewPricingRequestsRecordList = snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPricingRequestsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPricingRequestsRecord =
                                listViewPricingRequestsRecordList[
                                    listViewIndex];
                            return InkWell(
                              onTap: () async {
                                await CheckoutPricingRequestCall.call(
                                  requestId: listViewPricingRequestsRecord.id,
                                );
                                if ((listViewPricingRequestsRecord.store) ==
                                    'srconstruccion') {
                                  context.pushNamed('Checkout');
                                } else {
                                  context.pushNamed(
                                    'CheckoutSeller',
                                    params: {
                                      'storeName': serializeParam(
                                          listViewPricingRequestsRecord
                                              .storeName,
                                          ParamType.String),
                                    }.withoutNulls,
                                    queryParams: {
                                      'storeId': serializeParam(
                                          listViewPricingRequestsRecord.store,
                                          ParamType.String),
                                    }.withoutNulls,
                                  );
                                }
                              },
                              child: Slidable(
                                actionPane: const SlidableScrollActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: 'Eliminar',
                                    color: Color(0x00FFFFFF),
                                    icon: Icons.clear_outlined,
                                    onTap: () async {
                                      await actions.deleteNotification(
                                        currentUserUid,
                                        listViewPricingRequestsRecord.id,
                                      );
                                    },
                                  ),
                                ],
                                child: ListTile(
                                  title: Text(
                                    listViewPricingRequestsRecord.id,
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF787878),
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  subtitle: Text(
                                    listViewPricingRequestsRecord.status,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  dense: false,
                                ),
                              ),
                            );
                          },
                        );
                      },
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
