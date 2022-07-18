// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future<bool> addProductSellerWiseCart(
  String productId,
  String variantId,
  String deliveryType,
  int amount,
  String storeId,
  int expressShipAmount,
  int normalShipAmount,
  int pickupInStoreAmount,
) async {
  HttpsCallable addProductToSellerWiseCart =
      FirebaseFunctions.instance.httpsCallable('addProductToSellerWiseCart');
  var response = await addProductToSellerWiseCart.call(<String, dynamic>{
    'productId': productId,
    'variantId': variantId,
    'normalShipAmount': normalShipAmount,
    'expressShipAmount': expressShipAmount,
    'pickupInStoreAmount': pickupInStoreAmount,
    'storeId': storeId,
  });
  return response.data['hasInventory'];
}
