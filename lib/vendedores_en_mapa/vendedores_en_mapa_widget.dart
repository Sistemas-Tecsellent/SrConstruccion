import '../backend/backend.dart';
import '../components/sellers_home_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VendedoresEnMapaWidget extends StatefulWidget {
  const VendedoresEnMapaWidget({Key key}) : super(key: key);

  @override
  _VendedoresEnMapaWidgetState createState() => _VendedoresEnMapaWidgetState();
}

class _VendedoresEnMapaWidgetState extends State<VendedoresEnMapaWidget> {
  LatLng googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0x00FFFFFF),
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
          'Vendedores',
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: StreamBuilder<List<StoresRecord>>(
                      stream: queryStoresRecord(
                        queryBuilder: (storesRecord) => storesRecord
                            .where('location',
                                isEqualTo: FFAppState().locationKey)
                            .where('locationCity',
                                isEqualTo: FFAppState().locationKeyCity),
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
                        List<StoresRecord> googleMapStoresRecordList =
                            snapshot.data;
                        return FlutterFlowGoogleMap(
                          controller: googleMapsController,
                          onCameraIdle: (latLng) =>
                              setState(() => googleMapsCenter = latLng),
                          initialLocation: googleMapsCenter ??=
                              currentUserLocationValue,
                          markers: (googleMapStoresRecordList ?? [])
                              .map(
                                (googleMapStoresRecord) => FlutterFlowMarker(
                                  googleMapStoresRecord.reference.path,
                                  googleMapStoresRecord.mapLocation,
                                ),
                              )
                              .toList(),
                          markerColor: GoogleMarkerColor.red,
                          mapType: MapType.normal,
                          style: GoogleMapStyle.standard,
                          initialZoom: 14,
                          allowInteraction: true,
                          allowZoom: true,
                          showZoomControls: true,
                          showLocation: true,
                          showCompass: true,
                          showMapToolbar: true,
                          showTraffic: false,
                          centerMapOnMarkerTap: true,
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.55),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: SellersHomeWidget(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
