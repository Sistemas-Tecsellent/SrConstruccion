// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future<dynamic> setCheckoutSessionSellerWise(
  String address,
  String paymentMethod,
  dynamic invoiceProfile,
  String invoiceUsage,
  String storeId,
) async {
  FirebaseFunctions functions =
      FirebaseFunctions.instanceFor(region: 'us-central1');
  HttpsCallable checkoutSession =
      functions.httpsCallable('setCheckoutSessionSellerWise');
  final response = await checkoutSession.call(<String, dynamic>{
    'address': address,
    'paymentMethod': paymentMethod,
    'invoiceProfile': invoiceProfile,
    'invoiceUsage': invoiceUsage,
    'storeId': storeId,
  });
  return response;
}
