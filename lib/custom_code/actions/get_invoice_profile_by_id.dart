// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<dynamic> getInvoiceProfileById(String id) async {
  return await FirebaseFirestore.instance
      .collection('publicInvoiceProfiles')
      .where('id', isEqualTo: id)
      .get()
      .then((QuerySnapshot querySnapshot) {
    return querySnapshot.docs[0].data();
  });
}
