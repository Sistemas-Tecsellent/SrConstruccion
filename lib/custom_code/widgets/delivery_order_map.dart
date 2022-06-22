// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:location/location.dart';

class DeliveryOrderMap extends StatefulWidget {
  const DeliveryOrderMap({
    Key key,
    this.width,
    this.height,
    this.delivererId,
    this.orderForClientId,
    this.destination,
  }) : super(key: key);

  final double width;
  final double height;
  final String delivererId;
  final String orderForClientId;
  final LatLng destination;

  @override
  _DeliveryOrderMapState createState() => _DeliveryOrderMapState();
}

class _DeliveryOrderMapState extends State<DeliveryOrderMap> {
  Location location = Location();
  double destinationLatitude;
  double destinationLongitude;
  bool mapReady = false;
  String delivererId;
  String orderForClientId;
  Set<gm.Marker> _markers = Set<gm.Marker>();
  LatLng currentUserLocationValue;
  LatLng delivererCoordinates;
  gm.GoogleMapController mapController;
  Stream<DocumentSnapshot> delivererDoc;
  gm.BitmapDescriptor delivererIcon;
  gm.BitmapDescriptor userLocationIcon;

  @override
  void initState() {
    super.initState();
    delivererId = widget.delivererId;
    destinationLatitude = widget.destination.latitude;
    destinationLongitude = widget.destination.longitude;

    setIcons();
    location.getLocation().then((currLoc) {
      setState(() {
        currentUserLocationValue =
            LatLng(destinationLatitude, destinationLongitude);
        mapReady = true;
      });
    });
    print(
        "-------------------------------------------------------------------deliverer Id " +
            widget.delivererId);
    delivererDoc = FirebaseFirestore.instance
        .collection('deliverersLocation')
        .doc(widget.delivererId)
        .snapshots();
    delivererDoc.listen((event) {
      delivererCoordinates =
          LatLng(event["location"].latitude, event["location"].longitude);
      updatePinOnMap();
    });
  }

  void updatePinOnMap() async {
    setState(() {
      _markers.removeWhere((m) => m.markerId.value == 'delivererPin');
      _markers.add(gm.Marker(
        markerId: gm.MarkerId('delivererPin'),
        position: gm.LatLng(
            delivererCoordinates.latitude, delivererCoordinates.longitude),
        icon: delivererIcon,
      ));
    });
  }

  void showPinsOnMap() async {
    var delCoord = await FirebaseFirestore.instance
        .doc('deliverersLocation/$delivererId')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return {
        'latitude': documentSnapshot['location'].latitude,
        'longitude': documentSnapshot['location'].longitude
      };
    });

    var userCoord = await location.getLocation().then((currLoc) {
      return LatLng(destinationLatitude, destinationLongitude);
    });

    _markers.add(gm.Marker(
      markerId: gm.MarkerId('delivererPin'),
      position: gm.LatLng(delCoord['latitude'], delCoord['longitude']),
      icon: delivererIcon,
    ));
    _markers.add(gm.Marker(
      markerId: gm.MarkerId('userPin'),
      position: gm.LatLng(userCoord.latitude, userCoord.longitude),
      icon: userLocationIcon,
    ));
  }

  void setIcons() async {
    delivererIcon = await gm.BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/Moto.png');

    userLocationIcon = await gm.BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/Casa.png');
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
      showPinsOnMap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      width: double.infinity,
      child: mapReady
          ? gm.GoogleMap(
              onMapCreated: onMapCreated,
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: false,
              mapType: gm.MapType.normal,
              initialCameraPosition: gm.CameraPosition(
                bearing: 0.0,
                target: gm.LatLng(currentUserLocationValue.latitude,
                    currentUserLocationValue.longitude),
                tilt: 0.0,
                zoom: 20.0,
              ),
              markers: _markers,
            )
          : const Center(child: Text('Cargando...')),
    );
  }
}
