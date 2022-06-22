// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future<List<String>> getLocalStores(
  String userLocation,
  String userCity,
) async {
  FirebaseFunctions functions = FirebaseFunctions.instance;
  HttpsCallable callable = functions.httpsCallable('getLocalStores');
  final resp = await callable.call(<String, dynamic>{
    'userLocation': userLocation,
    'userCity': userCity,
  });
  List<String> response = [];
  for (var obj in resp.data) {
    if (obj != null) {
      response.add(obj);
    }
  }
  return response;
}
