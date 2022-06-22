// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future<double> getCartTotal() async {
  HttpsCallable getCartTotal =
      FirebaseFunctions.instance.httpsCallable('getCartTotal');
  final response = await getCartTotal();
  var res = response.data;
  var total = 0.0;
  if (res.runtimeType == int) {
    total = res.toDouble();
  } else {
    total = res;
  }
  return total;
}
