// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future savePaymentSellerWiseOrder(
  String paymentId,
  String bundleId,
  String storeId,
  String addressLine1,
  String uid,
) async {
  await FirebaseFirestore.instance
      .doc('users/$uid/payments/$paymentId')
      .set({'id': paymentId, 'address': addressLine1, 'bundleId': bundleId});

  FirebaseFunctions functions = FirebaseFunctions.instance;
  HttpsCallable savePayment =
      functions.httpsCallable('savePaymentSellerWiseOrder');
  await savePayment.call(<String, dynamic>{
    'paymentId': paymentId,
    'bundleId': bundleId,
    'storeId': storeId,
  });
}
