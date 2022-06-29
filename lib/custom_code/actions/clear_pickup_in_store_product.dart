// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future clearPickupInStoreProduct(
  String uid,
  String checkoutId,
) async {
  await FirebaseFirestore.instance
      .collection('users/$uid/carts/$checkoutId/products')
      .where("id", isNotEqualTo: checkoutId)
      .get()
      .then((QuerySnapshot querySnapshot) async {
    for (var product in querySnapshot.docs) {
      if (product['deliveryType'] == 'Recoger en Tienda') {
        await FirebaseFirestore.instance
            .doc('users/$uid/carts/$checkoutId/products/${product['id']}')
            .delete();
      }
    }
  });
}
