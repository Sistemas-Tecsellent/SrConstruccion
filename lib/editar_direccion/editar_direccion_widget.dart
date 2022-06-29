import '../auth/auth_util.dart';
import '../direcciones/direcciones_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditarDireccionWidget extends StatefulWidget {
  const EditarDireccionWidget({
    Key key,
    this.name,
    this.addressLine1,
    this.suburb,
    this.postalCode,
    this.city,
    this.state,
  }) : super(key: key);

  final String name;
  final String addressLine1;
  final String suburb;
  final String postalCode;
  final String city;
  final String state;

  @override
  _EditarDireccionWidgetState createState() => _EditarDireccionWidgetState();
}

class _EditarDireccionWidgetState extends State<EditarDireccionWidget> {
  LatLng googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  List<dynamic> newupdatedAddress;
  String dropDownValue;
  TextEditingController addressLine1Controller;
  TextEditingController nameFieldController;
  TextEditingController suburbController;
  TextEditingController postalCodeController;
  TextEditingController textController5;
  List<dynamic> updatedAddress;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    addressLine1Controller = TextEditingController(text: widget.addressLine1);
    nameFieldController = TextEditingController(text: widget.name);
    suburbController = TextEditingController(text: widget.suburb);
    postalCodeController = TextEditingController(text: widget.postalCode);
    textController5 = TextEditingController(text: widget.city);
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
            Icons.chevron_left_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            updatedAddress = await actions.getUserAddresses(
              currentUserUid,
            );
            setState(
                () => FFAppState().userAddresses = updatedAddress.toList());
            Navigator.pop(context);

            setState(() {});
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 290,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            'https://programacion.net/files/article/20170405040453_mapa.jpg',
                          ).image,
                        ),
                      ),
                      child: FlutterFlowGoogleMap(
                        controller: googleMapsController,
                        onCameraIdle: (latLng) => googleMapsCenter = latLng,
                        initialLocation: googleMapsCenter ??=
                            currentUserLocationValue,
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14,
                        allowInteraction: false,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 270, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 460,
                          constraints: BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                            child: Form(
                              key: formKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        controller: nameFieldController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Nombre de dirección',
                                          hintText:
                                              'Ponle un nombre a esta dirección',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF525252),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        controller: addressLine1Controller,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Calle',
                                          hintText: 'Calle y Número',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          prefixIcon: Icon(
                                            Icons.location_pin,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF525252),
                                            ),
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Es requerido';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        controller: suburbController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Colonia',
                                          hintText: 'Colonia',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF525252),
                                            ),
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Es requerido';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        controller: postalCodeController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'C.P',
                                          hintText: 'Código Postal',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF525252),
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Es requerido';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: TextFormField(
                                        controller: textController5,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Ciudad o Municipio',
                                          hintText: 'Ciudad o Municipio',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC3C3C3),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF525252),
                                            ),
                                      ),
                                    ),
                                    FlutterFlowDropDown(
                                      initialOption: dropDownValue ??=
                                          widget.state,
                                      options: [
                                        'Aguascalientes',
                                        'Morelos',
                                        'Veracruz',
                                        'Ciudad de México'
                                      ],
                                      onChanged: (val) =>
                                          setState(() => dropDownValue = val),
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF525252),
                                          ),
                                      hintText: 'Selecciona un estado',
                                      fillColor: Colors.white,
                                      elevation: 0,
                                      borderColor: Colors.white,
                                      borderWidth: 0,
                                      borderRadius: 5,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await actions.saveAddress(
                                            nameFieldController.text,
                                            addressLine1Controller.text,
                                            textController5.text,
                                            suburbController.text,
                                            postalCodeController.text,
                                            dropDownValue,
                                            currentUserUid,
                                          );
                                          newupdatedAddress =
                                              await actions.getUserAddresses(
                                            currentUserUid,
                                          );
                                          setState(() =>
                                              FFAppState().userAddresses =
                                                  newupdatedAddress.toList());
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                              reverseDuration:
                                                  Duration(milliseconds: 0),
                                              child: DireccionesWidget(),
                                            ),
                                          );

                                          setState(() {});
                                        },
                                        text: 'Guardar',
                                        options: FFButtonOptions(
                                          width: 230,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
