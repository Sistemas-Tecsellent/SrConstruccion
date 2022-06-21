// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future<List<dynamic>> getCarrito() async {
  HttpsCallable getCart = FirebaseFunctions.instance.httpsCallable('getCart');
  final response = await getCart();
  var productsInCar = List<dynamic>.from(response.data);
  return productsInCar;
}
