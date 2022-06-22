// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future<bool> addProductToCart(
  String productId,
  String variantId,
  int expressShipAmount,
  int normalShipAmount,
  String userLocationState,
  String userLocationCity,
) async {
  if (expressShipAmount == 0 && normalShipAmount == 0) {
    return false;
  }

  FirebaseFunctions functions = FirebaseFunctions.instance;
  HttpsCallable addProductsToCart = functions.httpsCallable('addProductToCart');
  final response = await addProductsToCart.call(<String, dynamic>{
    'productId': productId,
    'variantId': variantId,
    'expressShipAmount': expressShipAmount,
    'normalShipAmount': normalShipAmount,
    'userLocationState': userLocationState,
    'userLocationCity': userLocationCity,
  });
  bool result = response.data;
  return result;
}
