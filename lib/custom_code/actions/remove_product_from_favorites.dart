// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future removeProductFromFavorites(
  String productId,
  String uid,
) async {
  await FirebaseFirestore.instance.doc('users/$uid').update({
    'liked_products': FieldValue.arrayRemove([productId])
  });
}
