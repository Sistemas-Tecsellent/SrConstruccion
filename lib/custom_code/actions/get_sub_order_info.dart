// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<dynamic> getSubOrderInfo(
  String bundleId,
  String orderType,
) async {
  return await FirebaseFirestore.instance
      .doc('orderBundles/$bundleId')
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    var stores = [];
    for (var store in documentSnapshot['checkout'][orderType]
        ['totalSuppliers']) {
      stores.add(store['id']);
    }
    var address = documentSnapshot['checkout']['address']['addressLine1'] +
        ", " +
        documentSnapshot['checkout']['address']['suburb'] +
        ", " +
        documentSnapshot['checkout']['address']['city'];

    return {
      'address': address,
      'stores': stores,
      'total': documentSnapshot['checkout'][orderType]['total'],
      'subtotal': documentSnapshot['checkout'][orderType]['subtotal'],
      'shipmentPrice': documentSnapshot['checkout'][orderType]['shipmentPrice'],
      'shipmentTimeText': documentSnapshot['checkout'][orderType]
          ['shipmentTimeText'],
      'products': documentSnapshot['checkout'][orderType]['products']
    };
  });
}
