import '../anadir_direccion/anadir_direccion_widget.dart';
import '../auth/auth_util.dart';
import '../checkout/checkout_widget.dart';
import '../components/sugerencias_recomendaciones_widget.dart';
import '../editar_direccion/editar_direccion_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../perfil/perfil_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DireccionesWidget extends StatefulWidget {
  const DireccionesWidget({Key key}) : super(key: key);

  @override
  _DireccionesWidgetState createState() => _DireccionesWidgetState();
}

class _DireccionesWidgetState extends State<DireccionesWidget> {
  List<dynamic> userAddresses;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      userAddresses = await actions.getUserAddresses(
        currentUserUid,
      );
      setState(() => FFAppState().userAddresses = userAddresses.toList());
    });
  }

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
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
                reverseDuration: Duration(milliseconds: 0),
                child: PerfilWidget(),
              ),
            );
          },
        ),
        title: Text(
          'Direcciones',
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
        backgroundColor: Color(0x00FDC054),
        elevation: 0,
        label: InkWell(
          onTap: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SugerenciasRecomendacionesWidget(),
                );
              },
            );
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
                reverseDuration: Duration(milliseconds: 0),
                child: CheckoutWidget(),
              ),
            );
          },
          child: Container(
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                        reverseDuration: Duration(milliseconds: 0),
                        child: AnadirDireccionWidget(),
                      ),
                    );
                  },
                  text: 'Agregar Dirección',
                  options: FFButtonOptions(
                    width: 300,
                    height: 54,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final addresses =
                        FFAppState().userAddresses?.toList() ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: addresses.length,
                      itemBuilder: (context, addressesIndex) {
                        final addressesItem = addresses[addressesIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: EditarDireccionWidget(
                                    addressLine1: getJsonField(
                                      addressesItem,
                                      r'''$.addressLine1''',
                                    ).toString(),
                                    suburb: getJsonField(
                                      addressesItem,
                                      r'''$.suburb''',
                                    ).toString(),
                                    postalCode: getJsonField(
                                      addressesItem,
                                      r'''$.postalCode''',
                                    ).toString(),
                                    city: getJsonField(
                                      addressesItem,
                                      r'''$.city''',
                                    ).toString(),
                                    state: getJsonField(
                                      addressesItem,
                                      r'''$.state''',
                                    ).toString(),
                                    name: getJsonField(
                                      addressesItem,
                                      r'''$.name''',
                                    ).toString(),
                                  ),
                                ),
                              );
                            },
                            child: Slidable(
                              actionPane: const SlidableScrollActionPane(),
                              secondaryActions: [
                                IconSlideAction(
                                  caption: 'Eliminar',
                                  color: Colors.white,
                                  icon: Icons.close_rounded,
                                  onTap: () {
                                    print('SlidableActionWidget pressed ...');
                                  },
                                ),
                              ],
                              child: ListTile(
                                leading: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                title: Text(
                                  getJsonField(
                                    addressesItem,
                                    r'''$.name''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                ),
                                subtitle: Text(
                                  getJsonField(
                                    addressesItem,
                                    r'''$.addressLine1''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 2,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 22,
                                ),
                                tileColor: Colors.white,
                                dense: false,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
