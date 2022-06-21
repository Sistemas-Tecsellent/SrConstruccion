// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<double> getCheckoutTotal(String uid) async {
  return await FirebaseFirestore.instance
      .doc('checkouts/$uid')
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    var res = documentSnapshot['totalInCents'];
    var total = 0.0;
    if (res.runtimeType == int) {
      total = res.toDouble();
    } else {
      total = res;
    }
    return total;
  });
}
