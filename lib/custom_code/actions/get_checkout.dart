// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<dynamic> getCheckout(String uid) async {
  return await FirebaseFirestore.instance
      .collection('checkouts')
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    var response = {
      'expressOrder': {
        'total': documentSnapshot['expressOrder']['total'].toStringAsFixed(2),
        'subtotal':
            documentSnapshot['expressOrder']['subtotal'].toStringAsFixed(2),
        'shipmentPrice': documentSnapshot['expressOrder']['shipmentPrice']
            .toStringAsFixed(2),
        'shipmentTime': documentSnapshot['expressOrder']['shipmentTime'],
        'shipmentTimeText': documentSnapshot['expressOrder']
            ['shipmentTimeText'],
        'shipmentDistance': documentSnapshot['expressOrder']
            ['shipmentDistance'],
        'totalWeight': 0,
        'amountOfProducts': documentSnapshot['expressOrder']
            ['amountOfProducts'],
        'missingAmount': 0,
        'transport': documentSnapshot['expressOrder']['transport'],
        'products': [],
        'totalSuppliers': [],
        'route': {
          'origins': [],
          'destinations': [],
        },
      },
      'normalOrder': {
        'total': documentSnapshot['normalOrder']['total'].toStringAsFixed(2),
        'subtotal':
            documentSnapshot['normalOrder']['subtotal'].toStringAsFixed(2),
        'shipmentPrice':
            documentSnapshot['normalOrder']['shipmentPrice'].toStringAsFixed(2),
        'shipmentTimeText': documentSnapshot['normalOrder']['shipmentTimeText'],
        'totalWeight': 0,
        'amountOfProducts': documentSnapshot['normalOrder']['amountOfProducts'],
        'missingAmount': 0,
        'products': [],
      },
      'storeWiseOrders': {
        'orders': [],
        'total': 0,
        'subtotal': 0,
        'shipmentPrice': 0,
        'amountOfProducts': 0,
      },
      'largePeriodOrder': {
        'total': 0,
        'subtotal': 0,
        'shipmentPrice': 0,
        'totalWeight': 0,
        'amountOfProducts': 0,
        'missingAmount': 0,
        'products': [],
      },
      'services': {
        'total': 0,
        'subtotal': 0,
        'shipmentPrice': 0,
        'amountOfProducts': 0,
        'missingAmount': 0,
        'products': [],
      },
      'subtotal': documentSnapshot['subtotal'].toStringAsFixed(2),
      'shipmentTotal': documentSnapshot['shipmentTotal'].toStringAsFixed(2),
      'total': documentSnapshot['total'].toStringAsFixed(2),
      'totalInNumber': documentSnapshot['total'],
      'totalInCents': documentSnapshot['totalInCents'],
    };
    return response;
  });
}
