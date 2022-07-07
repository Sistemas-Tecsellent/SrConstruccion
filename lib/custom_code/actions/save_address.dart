// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future saveAddress(
  String name,
  String addressLine1,
  String city,
  String suburb,
  String postalCode,
  String state,
  String uid,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference addresses = firestore.collection('users/$uid/addresses');

  try {
    await addresses.doc('Sin-Direccion').delete();
  } catch (e) {
    print(e);
  }

  return await addresses.doc(name).set({
    'id': name.trim(),
    'addressLine1': addressLine1.trim(),
    'city': city.trim(),
    'country': 'Mexico',
    'name': name.trim(),
    'postalCode': postalCode.trim(),
    'state': state.trim(),
    'suburb': suburb.trim(),
  });
}
