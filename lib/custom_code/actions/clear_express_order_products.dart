// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future clearExpressOrderProducts(
  String uid,
  String checkoutId,
) async {
  if (uid == checkoutId) {
    await FirebaseFirestore.instance
        .collection('users/$uid/carts/$checkoutId/products')
        .where("id", isNotEqualTo: checkoutId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var product in querySnapshot.docs) {
        if (product['expressShipAmount'] > 0) {
          FirebaseFirestore.instance
              .doc('users/$uid/carts/$checkoutId/products/${product['id']}')
              .update({'expressShipAmount': 0});
        }
      }
    });
  } else {
    await FirebaseFirestore.instance
        .collection('users/$uid/carts/$checkoutId/products')
        .where("id", isNotEqualTo: checkoutId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var product in querySnapshot.docs) {
        if (product['deliveryType'] == 'Express 30 min') {
          FirebaseFirestore.instance
              .doc('users/$uid/carts/$checkoutId/products/${product['id']}')
              .delete();
        }
      }
    });
  }
}
