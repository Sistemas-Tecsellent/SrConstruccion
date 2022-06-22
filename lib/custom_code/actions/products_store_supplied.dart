// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<String>> productsStoreSupplied(
  dynamic products,
  String store,
) async {
  List<String> productsStoreSupplied = [];
  for (var prod in products['products']) {
    for (var theStore in prod['suppliers']) {
      if (theStore['store']['id'] == store) {
        productsStoreSupplied.add(prod['productId']);
      }
    }
  }
  return productsStoreSupplied;
}
