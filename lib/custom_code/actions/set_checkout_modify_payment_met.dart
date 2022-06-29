// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future setCheckoutModifyPaymentMet(
  String checkoutId,
  String paymentMethod,
) async {
  HttpsCallable setCheckoutModifyPaymentMet =
      FirebaseFunctions.instance.httpsCallable('setCheckoutModifyPaymentMet');
  await setCheckoutModifyPaymentMet.call(<String, dynamic>{
    'checkoutId': checkoutId,
    'paymentMethod': paymentMethod,
  });
}
