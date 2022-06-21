// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<int> countItemsInCart(String uid) async {
  return FirebaseFirestore.instance
      .collection('users/$uid/carts/$uid/products')
      .where('id', isNotEqualTo: uid)
      .get()
      .then((QuerySnapshot querySnapshot) {
    return querySnapshot.docs.length;
  });
}
