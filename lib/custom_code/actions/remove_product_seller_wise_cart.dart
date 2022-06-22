// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future removeProductSellerWiseCart(
  String storeId,
  String uid,
  String variantId,
) async {
  await FirebaseFirestore.instance
      .doc('users/$uid/carts/$storeId/products/$variantId')
      .delete()
      .then((value) {
    return 'Elemento borrado con éxito.';
  }).catchError((error) {
    return 'Ocurrió un error: $error';
  });
}
