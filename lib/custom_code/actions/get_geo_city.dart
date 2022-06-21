// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:geocoding/geocoding.dart';

Future<String> getGeoCity(
  double latitude,
  double longitude,
) async {
  var placemarkers = await GeocodingPlatform.instance
      .placemarkFromCoordinates(latitude, longitude);
  return placemarkers.first.locality;
}
