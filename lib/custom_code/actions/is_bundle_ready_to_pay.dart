// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:async';

Future<bool> isBundleReadyToPay(String bundleId) async {
  var retry = true;
  var isReadyToPay = false;
  var limit = 10;

  while (retry) {
    isReadyToPay = await FirebaseFirestore.instance
        .collection('orderBundles')
        .doc(bundleId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot['isReadyToPay'];
    });
    if (isReadyToPay) {
      retry = false;
    } else {
      await Future.delayed(const Duration(seconds: 10), () {});
      limit -= 1;
    }
    if (limit <= 0) {
      retry = false;
    }
  }
  return isReadyToPay;
}
