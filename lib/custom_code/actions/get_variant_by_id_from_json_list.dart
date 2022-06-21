// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<dynamic> getVariantByIdFromJsonList(
  List<dynamic> variantList,
  String variantId,
) async {
  for (var variant in variantList) {
    if (variant['id'] == variantId) {
      return variant;
    }
  }
  return {};
}
