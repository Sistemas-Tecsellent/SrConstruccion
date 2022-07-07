import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DireccionesWidget extends StatefulWidget {
  const DireccionesWidget({Key key}) : super(key: key);

  @override
  _DireccionesWidgetState createState() => _DireccionesWidgetState();
}

class _DireccionesWidgetState extends State<DireccionesWidget> {
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
            context.pop();
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
        label: Container(
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
                  context.pushNamed('AnadirDireccion');
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
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
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
                child: StreamBuilder<List<AddressesRecord>>(
                  stream: queryAddressesRecord(
                    parent: currentUserReference,
                    queryBuilder: (addressesRecord) => addressesRecord
                        .where('name', isNotEqualTo: 'Sin-Direccion'),
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
                    List<AddressesRecord> listViewAddressesRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewAddressesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewAddressesRecord =
                            listViewAddressesRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'EditarDireccion',
                                queryParams: {
                                  'name': serializeParam(
                                      listViewAddressesRecord.name,
                                      ParamType.String),
                                }.withoutNulls,
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
                                  listViewAddressesRecord.name,
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                ),
                                subtitle: Text(
                                  listViewAddressesRecord.addressLine1
                                      .maybeHandleOverflow(maxChars: 28),
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
