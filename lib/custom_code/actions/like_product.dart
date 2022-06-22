// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future likeProduct(
  String uid,
  String productId,
) async {
  var isLiked = await FirebaseFirestore.instance
      .doc('users/$uid')
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot['liked_products'].contains(productId)) {
      return true;
    }
    return false;
  });
  if (isLiked) {
    var markProduct = FirebaseFunctions.instance.httpsCallable('markProduct');
    await markProduct
        .call(<String, dynamic>{'mark': 'like', 'productId': productId});
  }
}
